import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  bool build() => false; // false = signed out, true = signed in

  void signIn() => state = true;
  void signOut() => state = false;
}
