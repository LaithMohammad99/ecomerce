import 'package:ecommercapp/services/auth.dart';
import 'package:ecommercapp/utlis/enum.dart';
import 'package:flutter/cupertino.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;

  AuthController(
      {required this.auth,
      this.email = '',
      this.password = '',
      this.authFormType = AuthFormType.login});

  void updateEmail(String email) => copyWith(
      email:
          email); //this function main work to update your email from controller
  void updatePassword(String password) => copyWith(
      password:
          password); //this function main work to update your password from controller
  void toggleFormType() {
    final formType = authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    copyWith(authFormType: formType, email: '', password: '');
  }

  Future<void> submit() async {
    try {
      if (authFormType == AuthFormType.login) {
        await auth.loginWithEmailAndPassword(email: email, password: password);
      } else
        await auth.signUpWithEmailAndPassword(email: email, password: password);
    } catch (e) {}
  }

  void copyWith(
      {AuthBase? auth,
      String? email,
      String? password,
      AuthFormType? authFormType}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;

    notifyListeners();
  }
}
