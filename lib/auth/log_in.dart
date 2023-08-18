import 'package:flutter/material.dart';
import 'package:nector_app/utils/colors.dart';

import '../widgets/auth/login_auth_widget.dart';
// import '../widgets/custom_button_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => LogInScreenState();
}

class LogInScreenState extends State<LogInScreen> {
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
              'Login',
              style: TextStyle(
                fontSize: 30,
                color: AppColors.blackColor,
              ),
            ),
            const Text(
              'Enter your email and password',
              style: TextStyle(
                color: AppColors.darkGreyColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const LoginFormWidget(),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    ));
  }
}
