import 'package:flutter/material.dart';
import 'package:nector_app/utils/colors.dart';

class OffersListView extends StatelessWidget {
  const OffersListView(this.pName, this.pImageUrl, this.pQuantity, this.pPrice,
      {super.key});

  final String pName;
  final String pImageUrl;
  final String pQuantity;
  final String pPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkGreyColor),
            borderRadius: BorderRadius.circular(25)),
        height: 250,
        width: 165,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                pImageUrl,
                fit: BoxFit.cover,
                height: 60,
              ),
              Text(
                pName,
                style: const TextStyle(color: AppColors.blackColor),
              ),
              Text(pQuantity),
              Text(pPrice),
            ],
          ),
        ),
      ),
    );
  }
}
