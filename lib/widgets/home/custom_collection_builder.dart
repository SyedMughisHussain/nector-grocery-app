import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nector_app/widgets/home/custom_collection_builder_item.dart';

import '../../pages/others/detail_page.dart';

class CustomCollectionBuilder extends StatelessWidget {
  const CustomCollectionBuilder(this.collectionName, {super.key});
  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection(collectionName).snapshots(),
        builder: (contetx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(snapshot.data!.docs)));
            },
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data!.docs[index])));
                        },
                        child: CustomListViewItem(
                            snapshot.data!.docs[index]['productName'],
                            snapshot.data!.docs[index]['imageUrl'],
                            snapshot.data!.docs[index]['productQuantity'],
                            snapshot.data!.docs[index]['productPrice']),
                      )),
            ),
          );
        });
  }
}
