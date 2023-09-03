import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/cart/cart_item.dart';

class FavouriteProductsPage extends StatelessWidget {
  const FavouriteProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: const Text(
          'My Favourites',
          style: TextStyle(
              color: AppColors.blackColor, fontWeight: FontWeight.w600),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('userFavourites')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('userFavourite')
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
                              .collection('userFavourites')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('userFavourite')
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
