import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/beverage_blueprint.dart';
import '../models/beverage_category.dart';
import '../theme/category_presentation.dart';
import '../view_models/dex_view_model.dart';

class QuickLogModal extends ConsumerStatefulWidget {
  const QuickLogModal({super.key});

  @override
  ConsumerState<QuickLogModal> createState() => _QuickLogModalState();
}

class _QuickLogModalState extends ConsumerState<QuickLogModal> {
  static const List<double> _presetVolumes = [250, 330, 500];
  static const double _minVolume = 0;
  static const double _maxVolume = 2000;

  BeverageCategory _selectedCategory = BeverageCategory.water;
  double _volumeMl = 250;
  double _caffeineMg = 0;
  double _sugarGrams = 0;
  String? _note;
  String? _errorMessage;
  bool _isSubmitting = false;

  late final TextEditingController _volumeController;
  late final TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _volumeController = TextEditingController(
      text: _volumeMl.round().toString(),
    );
    _noteController = TextEditingController();
  }

  @override
  void dispose() {
    _volumeController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _setVolume(double value) {
    final clamped = value.clamp(_minVolume, _maxVolume);
    setState(() {
      _volumeMl = clamped;
      _volumeController.text = clamped.round().toString();
    });
  }

  void _onPresetTap(double preset) {
    HapticFeedback.lightImpact();
    _setVolume(preset);
  }

  void _onManualVolumeChanged(String text) {
    final parsed = double.tryParse(text);
    if (parsed == null) return;
    setState(() {
      _volumeMl = parsed.clamp(_minVolume, _maxVolume);
    });
  }

  void _onCategoryTap(BeverageCategory category) {
    setState(() {
      _selectedCategory = category;
      _caffeineMg = 0;
      _sugarGrams = 0;
      _errorMessage = null;
    });
  }

  Future<void> _onConfirm() async {
    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    final error = await ref
        .read(dexViewModelProvider.notifier)
        .submitEntry(
          category: _selectedCategory,
          volumeMl: _volumeMl,
          caffeineMg: _caffeineMg,
          sugarGrams: _sugarGrams,
          note: _note,
        );

    if (!mounted) return;

    if (error != null) {
      setState(() {
        _errorMessage = error;
        _isSubmitting = false;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final blueprint = blueprintFor(_selectedCategory);
    final showCaffeine = blueprint.caffeineImpact != ImpactLevel.none;
    final showSugar = blueprint.sugarImpact != ImpactLevel.none;

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text('QUICK LOG', style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),

            // --- Beverage / category selection ---
            Text('BEVERAGE', style: theme.textTheme.labelSmall),
            const SizedBox(height: 8),
            Row(
              children: BeverageCategory.values.map((category) {
                final isSelected = category == _selectedCategory;
                final accent = categoryAccentColor(category);
                return Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () => _onCategoryTap(category),
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: isSelected ? accent : accent.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(
                                  color: theme.colorScheme.onSurface,
                                  width: 2,
                                )
                              : null,
                        ),
                        child: Icon(
                          categoryIcon(category),
                          color: isSelected
                              ? theme.colorScheme.onPrimary
                              : accent,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // --- Volume input ---
            Text('VOLUME', style: theme.textTheme.labelSmall),
            const SizedBox(height: 8),
            Row(
              children: _presetVolumes.map((preset) {
                final isSelected = _volumeMl == preset;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text('${preset.round()}ml'),
                    selected: isSelected,
                    onSelected: (_) => _onPresetTap(preset),
                  ),
                );
              }).toList(),
            ),
            Slider(
              value: _volumeMl,
              min: _minVolume,
              max: _maxVolume,
              divisions: 200,
              label: '${_volumeMl.round()}ml',
              onChanged: _setVolume,
            ),
            Text('Volume (ml)', style: theme.textTheme.labelSmall),
            const SizedBox(height: 8),
            TextField(
              controller: _volumeController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                isDense: true,
              ),
              onChanged: _onManualVolumeChanged,
            ),
            const SizedBox(height: 16),

            // --- Caffeine (only for blueprints that track it) ---
            if (showCaffeine) ...[
              Text('CAFFEINE (mg)', style: theme.textTheme.labelSmall),
              const SizedBox(height: 8),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(isDense: true),
                onChanged: (text) {
                  final parsed = double.tryParse(text);
                  setState(() {
                    _caffeineMg = parsed ?? 0;
                  });
                },
              ),
              const SizedBox(height: 16),
            ],

            // --- Sugar (only for blueprints that track it) ---
            if (showSugar) ...[
              Text('SUGAR (g)', style: theme.textTheme.labelSmall),
              const SizedBox(height: 8),
              TextField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(isDense: true),
                onChanged: (text) {
                  final parsed = double.tryParse(text);
                  setState(() {
                    _sugarGrams = parsed ?? 0;
                  });
                },
              ),
              const SizedBox(height: 16),
            ],

            // --- Optional note ---
            Text('NOTE (OPTIONAL)', style: theme.textTheme.labelSmall),
            const SizedBox(height: 8),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(isDense: true),
              onChanged: (text) {
                _note = text.isEmpty ? null : text;
              },
            ),
            const SizedBox(height: 16),

            if (_errorMessage != null) ...[
              Text(
                _errorMessage!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
              const SizedBox(height: 8),
            ],

            // --- Confirm ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _onConfirm,
                child: _isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('CONFIRM'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
