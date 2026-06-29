String? validateEmail(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) {
    return 'Email is required.';
  }
  final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  if (!emailPattern.hasMatch(trimmed)) {
    return 'Enter a valid email address.';
  }
  return null;
}

String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'Password is required.';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters.';
  }
  return null;
}

String? validateConfirmPassword(String password, String confirmPassword) {
  if (confirmPassword.isEmpty) {
    return 'Please confirm your password.';
  }
  if (password != confirmPassword) {
    return 'Passwords do not match.';
  }
  return null;
}