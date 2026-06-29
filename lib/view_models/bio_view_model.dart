import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user_profile.dart';
import '../providers/user_targets_provider.dart';
import '../utils/input_validators.dart';

part 'bio_view_model.g.dart';

class BioViewModelState {
  const BioViewModelState({
    required this.profile,
    required this.hydrationTargetMl,
    required this.dailySugarLimitGrams,
    required this.dailyCaffeineLimitMg,
    required this.hydrationError,
    required this.sugarError,
    required this.caffeineError,
    required this.isSaving,
  });

  final UserProfile? profile;
  final double hydrationTargetMl;
  final double dailySugarLimitGrams;
  final double dailyCaffeineLimitMg;

  final String? hydrationError;
  final String? sugarError;
  final String? caffeineError;

  final bool isSaving;

  bool get hasErrors =>
      hydrationError != null || sugarError != null || caffeineError != null;
}

@riverpod
class BioViewModel extends _$BioViewModel {
  @override
  BioViewModelState build() {
    final profile = ref.watch(userTargetsProvider).value;

    return BioViewModelState(
      profile: profile,
      hydrationTargetMl: profile?.hydrationTargetMl ?? 2500,
      dailySugarLimitGrams: profile?.dailySugarLimitGrams ?? 50,
      dailyCaffeineLimitMg: profile?.dailyCaffeineLimitMg ?? 400,
      hydrationError: null,
      sugarError: null,
      caffeineError: null,
      isSaving: false,
    );
  }

  void setHydrationDraft(double value) {
    state = BioViewModelState(
      profile: state.profile,
      hydrationTargetMl: value,
      dailySugarLimitGrams: state.dailySugarLimitGrams,
      dailyCaffeineLimitMg: state.dailyCaffeineLimitMg,
      hydrationError: validateHydrationTargetMl(value),
      sugarError: state.sugarError,
      caffeineError: state.caffeineError,
      isSaving: state.isSaving,
    );
  }

  void setSugarDraft(double value) {
    state = BioViewModelState(
      profile: state.profile,
      hydrationTargetMl: state.hydrationTargetMl,
      dailySugarLimitGrams: value,
      dailyCaffeineLimitMg: state.dailyCaffeineLimitMg,
      hydrationError: state.hydrationError,
      sugarError: validateSugarLimitGrams(value),
      caffeineError: state.caffeineError,
      isSaving: state.isSaving,
    );
  }

  void setCaffeineDraft(double value) {
    state = BioViewModelState(
      profile: state.profile,
      hydrationTargetMl: state.hydrationTargetMl,
      dailySugarLimitGrams: state.dailySugarLimitGrams,
      dailyCaffeineLimitMg: value,
      hydrationError: state.hydrationError,
      sugarError: state.sugarError,
      caffeineError: validateCaffeineLimitMg(value),
      isSaving: state.isSaving,
    );
  }

  Future<bool> save() async {
    state = BioViewModelState(
      profile: state.profile,
      hydrationTargetMl: state.hydrationTargetMl,
      dailySugarLimitGrams: state.dailySugarLimitGrams,
      dailyCaffeineLimitMg: state.dailyCaffeineLimitMg,
      hydrationError: state.hydrationError,
      sugarError: state.sugarError,
      caffeineError: state.caffeineError,
      isSaving: true,
    );

    final errors = await ref
        .read(userTargetsProvider.notifier)
        .updateTargets(
          hydrationTargetMl: state.hydrationTargetMl,
          dailySugarLimitGrams: state.dailySugarLimitGrams,
          dailyCaffeineLimitMg: state.dailyCaffeineLimitMg,
        );

    state = BioViewModelState(
      profile: ref.read(userTargetsProvider).value ?? state.profile,
      hydrationTargetMl: state.hydrationTargetMl,
      dailySugarLimitGrams: state.dailySugarLimitGrams,
      dailyCaffeineLimitMg: state.dailyCaffeineLimitMg,
      hydrationError: errors['hydrationTargetMl'],
      sugarError: errors['dailySugarLimitGrams'],
      caffeineError: errors['dailyCaffeineLimitMg'],
      isSaving: false,
    );

    return errors.isEmpty;
  }
}
