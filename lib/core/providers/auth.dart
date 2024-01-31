import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  final auth = FirebaseAuth.instance;

  Future<void> authenticateUser(
      {required String userEmail,
      required String password,
      required bool isLogin}) async {
    try {
      if (isLogin) {
        UserCredential authResult = await auth.createUserWithEmailAndPassword(
            email: userEmail, password: password);
        User? user =authResult.user;
        if (user != null && user.emailVerified) {
          // User has an account and is logged in
        } else {
          // User doesn't have an account, handle accordingly
          print("User doesn't have an account.");
          return;
        }

      } else {
        UserCredential authResult = await auth.signInWithEmailAndPassword(
            email: userEmail, password: password);
        print(authResult.user!.uid);
      }

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> whenForgotPassword(String userEmail) async {
    try {
      await auth.sendPasswordResetEmail(email: userEmail);
    } catch (error) {
      throw error;
    }
  }
}
