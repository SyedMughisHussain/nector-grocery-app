import 'package:flutter/material.dart';
import 'package:nector_app/auth/log_in.dart';
//import 'package:groccery_app/auth/splash_screen.dart';

//import 'auth/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginAndSignUpscreen(),
    );
  }
}
