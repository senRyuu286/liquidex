import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/auth_provider.dart';
import '../utils/validators.dart';

part 'sign_up_view_model.g.dart';

class SignUpState {
  const SignUpState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isSubmitting = false,
    this.errorMessage,
  });

  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isSubmitting;
  final String? errorMessage;
}

@riverpod
class SignUpViewModel extends _$SignUpViewModel {
  @override
  SignUpState build() => const SignUpState();

  void setUsername(String value) => state = SignUpState(
    username: value,
    email: state.email,
    password: state.password,
    confirmPassword: state.confirmPassword,
    isSubmitting: state.isSubmitting,
  );

  void setEmail(String value) => state = SignUpState(
    username: state.username,
    email: value,
    password: state.password,
    confirmPassword: state.confirmPassword,
    isSubmitting: state.isSubmitting,
  );

  void setPassword(String value) => state = SignUpState(
    username: state.username,
    email: state.email,
    password: value,
    confirmPassword: state.confirmPassword,
    isSubmitting: state.isSubmitting,
  );

  void setConfirmPassword(String value) => state = SignUpState(
    username: state.username,
    email: state.email,
    password: state.password,
    confirmPassword: value,
    isSubmitting: state.isSubmitting,
  );

  Future<void> submit() async {
    final validationError = _validate();
    if (validationError != null) {
      state = SignUpState(
        username: state.username,
        email: state.email,
        password: state.password,
        confirmPassword: state.confirmPassword,
        errorMessage: validationError,
      );
      return;
    }

    state = SignUpState(
      username: state.username,
      email: state.email,
      password: state.password,
      confirmPassword: state.confirmPassword,
      isSubmitting: true,
    );

    try {
      await ref
          .read(authProvider.notifier)
          .signUp(
            email: state.email.trim(),
            password: state.password,
            username: state.username.trim(),
          );
      if (!ref.mounted) return;
      state = SignUpState(
        username: state.username,
        email: state.email,
        password: state.password,
        confirmPassword: state.confirmPassword,
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = SignUpState(
        username: state.username,
        email: state.email,
        password: state.password,
        confirmPassword: state.confirmPassword,
        errorMessage: e is AuthException
            ? e.message
            : 'Sign up failed. Please try again.',
      );
    }
  }

  String? _validate() {
    if (state.username.trim().isEmpty) {
      return 'Username is required.';
    }
    return validateEmail(state.email) ??
        validatePassword(state.password) ??
        validateConfirmPassword(state.password, state.confirmPassword);
  }
}
