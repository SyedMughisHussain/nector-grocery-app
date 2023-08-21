import 'package:flutter/material.dart';
import 'package:nector_app/utils/colors.dart';
//import '../../services/models/product_model.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class ExclusiveOffer extends StatefulWidget {
  const ExclusiveOffer({super.key});

  @override
  State<ExclusiveOffer> createState() => _ExclusiveOfferState();
}

class _ExclusiveOfferState extends State<ExclusiveOffer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(children: [
            const Text(
              'Exclusive Offer',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                  fontSize: 22),
            ),
            const SizedBox(
              width: 120,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'See All',
                  style: TextStyle(color: AppColors.splashBackgroundColor),
                )),
          ]),
        ],
      ),
    );
  }
}
