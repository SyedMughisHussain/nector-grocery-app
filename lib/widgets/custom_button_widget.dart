import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(this.btnText, this.function, {super.key});
  final String btnText;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function(),
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.splashBackgroundColor,
        ),
        child: Text(
          btnText,
          style: const TextStyle(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
