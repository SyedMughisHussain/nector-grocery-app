import 'package:flutter/material.dart';
import 'package:nector_app/utils/colors.dart';

import '../custom_gridview_builder.dart';
//import '../../services/models/product_model.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class BestSelling extends StatefulWidget {
  const BestSelling({super.key});

  @override
  State<BestSelling> createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(children: [
            const Text(
              'Best Selling',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                  fontSize: 22),
            ),
            const SizedBox(
              width: 140,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const CustomGridviewbuilder('bestSellingProducts')));
                },
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
