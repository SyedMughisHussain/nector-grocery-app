import 'package:flutter/material.dart';
//import 'package:nector_app/auth/log_in.dart';
//import 'package:groccery_app/auth/splash_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nector_app/auth/on_boarding.dart';
import 'package:nector_app/auth/splash_screen.dart';
//import 'package:nector_app/pages/others/home_page.dart';
//import 'auth/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return const SplashScreen();
            } else {
              return const OnBoardingScreen();
            }
          })),
    );
  }
}
