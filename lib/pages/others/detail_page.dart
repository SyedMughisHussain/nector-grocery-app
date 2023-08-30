import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nector_app/utils/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nector_app/widgets/custom_button_widget.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var product;
  DetailPage(this.product, {super.key});

  Future<void> addToCart() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    firestore
        .collection('userCarts')
        .doc(auth.currentUser!.uid)
        .collection('userCart')
        .doc()
        .set({
      'productName': product['productName'],
      'productPrice': product['productPrice'],
      'imageUrl': product['imageUrl'],
    }).then((value) => print('Added to cart'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              color: Colors.grey[300],
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.blackColor,
                      ))
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Colors.grey[300]),
            child: Image.network(
              product['imageUrl'],
              fit: BoxFit.cover,
              height: 220,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product['productName'],
                      style: const TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border))
                  ],
                ),
                Text(
                  product['productQuantity'],
                  style: const TextStyle(color: AppColors.darkGreyColor),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    '\$${product['productPrice']}',
                    style: const TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  color: AppColors.darkGreyColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Product Detail',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product['productDetail'],
                  style: const TextStyle(color: AppColors.darkGreyColor),
                ),
                const Divider(
                  color: AppColors.darkGreyColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Nutritions',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      product['nutritions'],
                      style: TextStyle(
                          color: AppColors.blackColor,
                          backgroundColor: Colors.grey[300]),
                    )
                  ],
                ),
                const Divider(
                  color: AppColors.darkGreyColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Review',
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (double value) {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton('Add To Basket', addToCart),
              ],
            ),
          )
        ])
      ],
    ));
  }
}
