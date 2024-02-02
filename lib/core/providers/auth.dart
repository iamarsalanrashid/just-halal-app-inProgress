import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halal_app/core/models/userProfile.dart';

class Auth with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;
 late UserProfile  currentUser ;




  Future<void> fetchUserProfile() async {
    try {
      var documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();

      if (documentSnapshot.exists) {
        // Document exists, create a UserProfile instance
        UserProfile newUser = UserProfile(
          userId: documentSnapshot['userId'],
          userName: documentSnapshot['userName'],
          email: documentSnapshot['email'],
          phoneNumber: int.parse(documentSnapshot['phoneNumber']),
          address: documentSnapshot['address'],
          paymentMethod:  documentSnapshot['paymentMethod'], // You can set a default or retrieve from Firestore
        );

        currentUser = newUser;

        // Now 'currentUser' holds the UserProfile instance
        print('User Profile loaded: $currentUser');
      } else {
        print('User profile not found for userId: $userId');
        // Handle case when user profile doesn't exist
      }
    } catch (e) {
      print('Error fetching user profile: $e');
      // Handle error
    }
  }

// Call this function with the userId when you want to fetch the user profile


  // Future<void> saveUserData () async
  // {
  //
  // }
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

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
