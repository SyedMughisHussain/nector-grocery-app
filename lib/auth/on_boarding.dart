import 'package:flutter/material.dart';
import 'package:nector_app/auth/log_in.dart';
//import 'package:nector_app/pages/others/home_page.dart';

import '../utils/colors.dart';
import '../utils/images.dart';
import '../widgets/custom_button_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.onBoardingBackground),
              fit: BoxFit.cover),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 420),
          child: Column(
            children: [
              Image.asset(
                AppImages.carrot,
                fit: BoxFit.cover,
              ),
              const Text(
                'Welcome',
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'to our store',
                style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Get your grocesories in as fast as one hour',
                style: TextStyle(color: AppColors.grayColor),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton('Get Started', () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: ((context) => const LogInScreen())));
              }),
            ],
          ),
        ),
      ),
    );
  }
}

void goToAnotherPage(BuildContext context) {}
