// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dex_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Drives the Dex Screen grid: per-category aggregates and warning
/// levels, the global summary bar, breach detection for haptics, and
/// the FAB modal's submit action.

@ProviderFor(DexViewModel)
final dexViewModelProvider = DexViewModelProvider._();

/// Drives the Dex Screen grid: per-category aggregates and warning
/// levels, the global summary bar, breach detection for haptics, and
/// the FAB modal's submit action.
final class DexViewModelProvider
    extends $NotifierProvider<DexViewModel, DexViewModelState> {
  /// Drives the Dex Screen grid: per-category aggregates and warning
  /// levels, the global summary bar, breach detection for haptics, and
  /// the FAB modal's submit action.
  DexViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dexViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dexViewModelHash();

  @$internal
  @override
  DexViewModel create() => DexViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DexViewModelState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DexViewModelState>(value),
    );
  }
}

String _$dexViewModelHash() => r'5419eab718befaf2f23d93c637f7a9529444a385';

/// Drives the Dex Screen grid: per-category aggregates and warning
/// levels, the global summary bar, breach detection for haptics, and
/// the FAB modal's submit action.

abstract class _$DexViewModel extends $Notifier<DexViewModelState> {
  DexViewModelState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DexViewModelState, DexViewModelState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DexViewModelState, DexViewModelState>,
              DexViewModelState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
