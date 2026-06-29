import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user_profile.dart';
import '../services/auth_service.dart';
import '../repositories/user_profile_repository.dart';
import '../utils/input_validators.dart';
import 'auth_provider.dart';

part 'user_targets_provider.g.dart';

@riverpod
class UserTargets extends _$UserTargets {
  final UserProfileRepository _repository = UserProfileRepository();
  final AuthService _authService = AuthService();

  @override
  Future<UserProfile> build() async {
    final userId =
        ref.watch(authProvider).value?.uid ?? _authService.currentUserId;
    if (userId == null) {
      throw StateError('Cannot load user targets: no signed-in user.');
    }

    final profile = await _repository.fetchProfile(userId);
    if (profile == null) {
      throw StateError('No profile found for user $userId.');
    }
    return profile;
  }

  Future<Map<String, String>> updateTargets({
    required double hydrationTargetMl,
    required double dailySugarLimitGrams,
    required double dailyCaffeineLimitMg,
  }) async {
    final errors = <String, String>{};

    final hydrationError = validateHydrationTargetMl(hydrationTargetMl);
    if (hydrationError != null) errors['hydrationTargetMl'] = hydrationError;

    final sugarError = validateSugarLimitGrams(dailySugarLimitGrams);
    if (sugarError != null) errors['dailySugarLimitGrams'] = sugarError;

    final caffeineError = validateCaffeineLimitMg(dailyCaffeineLimitMg);
    if (caffeineError != null) errors['dailyCaffeineLimitMg'] = caffeineError;

    if (errors.isNotEmpty) return errors;

    final current = state.value;
    if (current == null) {
      errors['general'] = 'User profile is not loaded yet.';
      return errors;
    }

    final updated = current.copyWith(
      hydrationTargetMl: hydrationTargetMl,
      dailySugarLimitGrams: dailySugarLimitGrams,
      dailyCaffeineLimitMg: dailyCaffeineLimitMg,
    );

    await _repository.saveProfile(updated);
    state = AsyncValue.data(updated);

    return errors;
  }
}
