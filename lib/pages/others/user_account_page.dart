import 'package:flutter/material.dart';
//import 'package:nector_app/services/functions/auth_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nector_app/auth/on_boarding.dart';

class UserAccountPage extends StatelessWidget {
  const UserAccountPage({super.key});

  void logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((value) => Navigator.of(context)
        .push(
            MaterialPageRoute(builder: (context) => const OnBoardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: () => logOut(context),
      child: const Text('LogOut'),
    )));
  }
}
