import 'package:diaryapp/services/authService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum SignInStatus { loading, success, failure }

class AuthModelView extends ChangeNotifier {
  final AuthService authService;
  SignInStatus? signInStatus;
  String errorMessage = "";
  AuthModelView({required this.authService});
  UserCredential? user;
  void signinWithGoogle() async {
    signInStatusSetter = SignInStatus.loading;
    try {
      user = await authService.signInWithGoogle();
      signInStatusSetter = SignInStatus.success;
    } catch (e) {
      errorMessage = e.toString();
      signInStatusSetter = SignInStatus.failure;
    }
  }

  void signinWithGitHub(BuildContext context) async {
    signInStatusSetter = SignInStatus.loading;
    try {
      user = await authService.signInWithGitHub(context);
      signInStatusSetter = SignInStatus.success;
    } catch (e) {
      errorMessage = e.toString();
      signInStatusSetter = SignInStatus.failure;
    }
  }

  User? getuser() {
    return authService.getuser();
  }

  void logout() {
    authService.signOut();
  }

  set signInStatusSetter(SignInStatus value) {
    signInStatus = value;
    notifyListeners();
  }
}
