import 'dart:async';

import 'package:flutter/material.dart';
import '../pages/tabs/bottom_navigation_bar.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                const BottomNavigationBarPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: Center(
        child: Container(
          height: 90,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.carrot,
                fit: BoxFit.cover,
                height: 60,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Image.asset(
                    AppImages.appLogo,
                    fit: BoxFit.cover,
                    height: 45,
                  ),
                  const Text(
                    'online grocesories',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      letterSpacing: 4.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
