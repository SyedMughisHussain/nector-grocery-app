import 'package:flutter/material.dart';
import 'package:nector_app/utils/colors.dart';

import '../custom_gridview_builder.dart';
//import '../../services/models/product_model.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Grocessories extends StatefulWidget {
  const Grocessories({super.key});

  @override
  State<Grocessories> createState() => _GrocessoriesState();
}

class _GrocessoriesState extends State<Grocessories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(children: [
            const Text(
              'Groceseries',
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
