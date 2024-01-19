import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


// sign up with email and password
final FirebaseAuth _auth = FirebaseAuth.instance;
Future<User?> signUpWithEmailPassword(String email, String password) async {
  try {
    final result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (result.user != null) {
      return result.user;
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}

// sign in with email and password
Future<User?> signInWithEmailPassword(String email, String password) async {
  try {
    final result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (result.user != null) {
      return result.user;
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}