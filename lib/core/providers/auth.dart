import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  final auth = FirebaseAuth.instance;

  Future<void> authenticateUser(
      {required String userEmail,
      required String password,
      required bool isLogin,
      required BuildContext ctx}) async {
    try {
      if (!isLogin) {
        UserCredential authResult = await auth.createUserWithEmailAndPassword(
            email: userEmail, password: password);
        User? user = authResult.user;
        if (user != null && user.emailVerified) {
        } else {
          print("User doesn't have an account.");
        }
      } else {
        UserCredential authResult = await auth.signInWithEmailAndPassword(
            email: userEmail, password: password);
        print(authResult.user!.uid);
      }
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      var message = 'sorry the credentials are invalid';
      if (e.message != null) {
        message = e.message.toString();
      }
      print('platform error: ${message}');
      ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(content: Text('An error occurred: $message '),backgroundColor: Colors.red,));
      throw e;
    } catch (error) {
      print('connection error: $error');
      throw error;
    }
  }

  Future<void> logOut({required ctx}) async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {

      throw e;
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
