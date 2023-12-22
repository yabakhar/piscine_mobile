import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Sign in with Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("----------------" + e.toString());
      return Future.error(e);
    }
  }

  // Sign in with Github
  Future<UserCredential> signInWithGitHub(BuildContext context) async {
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
      clientId: "e3feef99fc323d5361b6",
      clientSecret: "ec3c5bc8f5230c16e6cda892ae70f75dbdcd0e86",
      redirectUrl: 'https://diaryapp-b933f.firebaseapp.com/__/auth/handler',
    );
    final result = await gitHubSignIn.signIn(context);
    final githubAuthCredential =
        GithubAuthProvider.credential(result.token ?? "");
    return await FirebaseAuth.instance
        .signInWithCredential(githubAuthCredential);
  }

  User? getuser() {
    return _auth.currentUser;
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
