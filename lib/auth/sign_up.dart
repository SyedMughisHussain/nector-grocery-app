import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/auth/signup_auth_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 70),
              alignment: Alignment.topCenter,
              height: 100,
              child: Image.asset(
                'assets/images/orangeCarrot.png',
                fit: BoxFit.cover,
                height: 55,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 30,
                color: AppColors.blackColor,
              ),
            ),
            const Text(
              'Enter your credentials to continue',
              style: TextStyle(
                color: AppColors.darkGreyColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SignUpFormWidget(),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    ));
  }
}
