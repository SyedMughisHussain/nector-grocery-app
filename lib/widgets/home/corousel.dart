import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CorouselImages extends StatefulWidget {
  const CorouselImages({super.key});

  @override
  State<CorouselImages> createState() => _CorouselImagesState();
}

class _CorouselImagesState extends State<CorouselImages> {
  final CarouselController _carouselController = CarouselController();
  int index = 0;
  int _dataLength = 1;

  @override
  void initState() {
    getSliderImageFromDb();
    super.initState();
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getSliderImageFromDb() async {
    var fireStore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await fireStore.collection('baner').get();
    if (mounted) {
      setState(() {
        _dataLength = snapshot.docs.length;
      });
    }
    return snapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_dataLength != 0)
          FutureBuilder(
            future: getSliderImageFromDb(),
            builder: (_, snapShot) {
              return snapShot.data == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: CarouselSlider.builder(
                          carouselController: _carouselController,
                          itemCount: snapShot.data!.length,
                          // ignore: avoid_types_as_parameter_names
                          itemBuilder: (BuildContext context, index, int) {
                            DocumentSnapshot<Map<String, dynamic>> sliderImage =
                                snapShot.data![index];
                            Map<String, dynamic>? getImage = sliderImage.data();
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Image.network(
                                    getImage!['image1'],
                                    //height: 90,
                                    fit: BoxFit.cover,
                                  )),
                            );
                          },
                          options: CarouselOptions(
                              //iewportFraction: 1,
                              initialPage: 0,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              height: 120,
                              onPageChanged:
                                  (int i, carouselPageChangedReason) {
                                setState(() {
                                  index = i;
                                });
                              })),
                    );
            },
          ),
      ],
    );
  }
}
