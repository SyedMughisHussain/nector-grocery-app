// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/home/bestselling/best_selling.dart';
import '../../widgets/home/corousel.dart';
import '../../widgets/home/exclusive_offer/exclusive_offer.dart';
import '../../widgets/home/fetchAddress/fetch_address.dart';
import '../../widgets/home/custom_collection_builder.dart';
import '../../widgets/home/groccesories/groccesories.dart';

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
      body: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.location_on),
              FetchUserAddress(),
            ]),
            CorouselImages(),
            SizedBox(
              height: 10,
            ),
            ExclusiveOffer(),
            SizedBox(
              height: 10,
            ),
            CustomCollectionBuilder('exclusiveProducts'),
            SizedBox(
              height: 10,
            ),
            BestSelling(),
            SizedBox(
              height: 10,
            ),
            CustomCollectionBuilder('bestSellingProducts'),
            SizedBox(
              height: 10,
            ),
            Grocessories(),
            SizedBox(
              height: 10,
            ),
            CustomCollectionBuilder('exclusiveProducts'),
          ],
        ),
      ),
    );
  }
}
