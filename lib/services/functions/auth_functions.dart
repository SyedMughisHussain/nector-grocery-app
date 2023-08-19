import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthService {
  UserCredential? userCredential;
  Future<void> signUp(BuildContext context, String userEmail,
      String userPassword, String userName) async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential!.user!.uid)
          .set({
        'userEmail': userEmail,
        'userName': userName,
      });
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.code)));
    } catch (error) {
      //print(error);
    }
  }

  Future<void> logIn(
      BuildContext context, String userEmail, String userPassword) async {
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userEmail, password: userPassword);
      // await FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(userCredential!.user!.uid)
      //     .set({
      //   'userEmail': userEmail,
      // });
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.code)));
    } catch (error) {
      //print(error);
    }
  }
}
