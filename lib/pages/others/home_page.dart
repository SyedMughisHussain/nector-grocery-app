import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Image.asset(
          'assets/images/orangeCarrot.png',
          height: 35,
          fit: BoxFit.cover,
        ),
      ),
      body: Container(),
    );
  }
}
