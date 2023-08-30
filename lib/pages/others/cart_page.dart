import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nector_app/utils/colors.dart';

import '../../widgets/cart/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          centerTitle: true,
          title: const Text(
            'My Cart',
            style: TextStyle(
                color: AppColors.blackColor, fontWeight: FontWeight.w600),
          ),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('userCarts')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('userCart')
                .snapshots(),
            builder: (context, cartSnapShot) {
              if (cartSnapShot.connectionState == ConnectionState.waiting) {
                const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (!cartSnapShot.hasData) {
                return const Center(
                  child: Text('Nothing in cart'),
                );
              }
              return ListView.builder(
                  itemCount: cartSnapShot.data!.docs.length,
                  itemBuilder: (context, index) => CartItem(
                      cartSnapShot.data!.docs[index]['imageUrl'],
                      cartSnapShot.data!.docs[index]['productPrice'],
                      cartSnapShot.data!.docs[index]['productName'],
                      cartSnapShot.data!.docs[index]['productQuantity']));
            }));
  }
}
