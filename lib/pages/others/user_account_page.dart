import 'package:flutter/material.dart';
//import 'package:nector_app/services/functions/auth_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAccountPage extends StatelessWidget {
  const UserAccountPage({super.key});

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: () => logOut,
      child: const Text('LogOut'),
    )));
  }
}
