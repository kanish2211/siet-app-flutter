import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider =
    StateNotifierProvider<LoginScreenController, LoginScreenData>((ref) {
  return LoginScreenController();
});

class LoginScreenController extends StateNotifier<LoginScreenData> {
  LoginScreenController()
      : super(LoginScreenData(email: "", password: "", rememberMe: false));

  void updateEmail(String value) {
    state = state.updateLoginScreen(email: value);
  }

  void updatePassword(String value) {
    state = state.updateLoginScreen(email: value);
  }

  void updateRememberMe(String value) {
    state = state.updateLoginScreen(email: value);
  }
}

class LoginScreenData {
  final String email;
  final String password;
  final bool rememberMe;

  LoginScreenData(
      {required this.email, required this.password, required this.rememberMe});

  LoginScreenData updateLoginScreen(
      {String? email, String? password, bool? rememberMe}) {
    return LoginScreenData(
        email: email ?? this.email,
        password: password ?? this.password,
        rememberMe: rememberMe ?? this.rememberMe);
  }
}
