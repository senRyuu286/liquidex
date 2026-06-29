import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/auth_provider.dart';
import '../utils/validators.dart';

part 'sign_in_view_model.g.dart';

class SignInState {
  const SignInState({
    this.email = '',
    this.password = '',
    this.isSubmitting = false,
    this.errorMessage,
  });

  final String email;
  final String password;
  final bool isSubmitting;
  final String? errorMessage;
}

@riverpod
class SignInViewModel extends _$SignInViewModel {
  @override
  SignInState build() => const SignInState();

  void setEmail(String value) {
    state = SignInState(
      email: value,
      password: state.password,
      isSubmitting: state.isSubmitting,
    );
  }

  void setPassword(String value) {
    state = SignInState(
      email: state.email,
      password: value,
      isSubmitting: state.isSubmitting,
    );
  }

  Future<void> submit() async {
    final validationError =
        validateEmail(state.email) ?? validatePassword(state.password);

    if (validationError != null) {
      state = SignInState(
        email: state.email,
        password: state.password,
        errorMessage: validationError,
      );
      return;
    }

    state = SignInState(
      email: state.email,
      password: state.password,
      isSubmitting: true,
    );

    try {
      await ref
          .read(authProvider.notifier)
          .signIn(email: state.email.trim(), password: state.password);
      if (!ref.mounted) return;
      state = SignInState(email: state.email, password: state.password);
    } catch (e) {
      if (!ref.mounted) return;
      state = SignInState(
        email: state.email,
        password: state.password,
        errorMessage: e is AuthException
            ? e.message
            : 'Sign in failed. Please try again.',
      );
    }
  }
}
