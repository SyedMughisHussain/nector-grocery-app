import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nector_app/pages/others/detail_page.dart';

//import 'custom_collection_builder_item.dart';
import 'custom_gridview_item.dart';

class CustomGridviewbuilder extends StatelessWidget {
  const CustomGridviewbuilder(this.collectionName, {super.key});

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection(collectionName).snapshots(),
          builder: (context, snapshot) {
            return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.25 / 2.60,
                ),
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(snapshot.data!.docs[index])));
                    },
                    child: CustomGridViewItem(
                        snapshot.data!.docs[index]['productName'],
                        snapshot.data!.docs[index]['productPrice'],
                        snapshot.data!.docs[index]['imageUrl'],
                        snapshot.data!.docs[index]['productQuantity'])));
          }),
    );
  }
}
