import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/home/corousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    userAddress.get().then((DocumentSnapshot ds) {
      useraddress = ds['address'];
    });
  }

  String useraddress = '';

  DocumentReference userAddress = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);
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
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.location_on),
            Text(
              useraddress,
              style: const TextStyle(color: AppColors.blackColor),
            ),
          ]),
          const CorouselImages(),
        ],
      ),
    );
  }
}
