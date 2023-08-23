import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nector_app/widgets/home/exclusive_offer/offers_listview.dart';

class OffersStreamBuilder extends StatelessWidget {
  const OffersStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (contetx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => OffersListView(
                    snapshot.data!.docs[index]['productName'],
                    snapshot.data!.docs[index]['imageUrl'],
                    snapshot.data!.docs[index]['productQuantity'],
                    snapshot.data!.docs[index]['productPrice'])),
          );
        });
  }
}
