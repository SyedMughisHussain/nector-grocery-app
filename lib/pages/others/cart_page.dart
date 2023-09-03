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
            }
            return Column(children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: cartSnapShot.data == null
                          ? 0
                          : cartSnapShot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            cartSnapShot.data!.docs[index];
                        return CartItem(() {
                          FirebaseFirestore.instance
                              .collection('userCarts')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('userCart')
                              .doc(documentSnapshot.id)
                              .delete()
                              .then((value) =>
                                  print('SuccesFully deleted item.'));
                        },
                            documentSnapshot['imageUrl'],
                            documentSnapshot['productPrice'],
                            documentSnapshot['productName'],
                            documentSnapshot['productQuantity']);
                      })),
            ]);
          }),
    );
  }
}
