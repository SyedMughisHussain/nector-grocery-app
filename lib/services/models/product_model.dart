import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String? name;
  final String? imageUrl;
  final String? price;
  final String? quantity;

  Product(
      {required this.name,
      required this.imageUrl,
      required this.price,
      required this.quantity});

  factory Product.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Product(
        name: data?['productName'],
        imageUrl: data?['imageUrl'],
        price: data?['productPrice'],
        quantity: data?['productQuanyity']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) 'productName': name,
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (price != null) 'productPrice': price,
      if (quantity != null) 'productQuantity': quantity
    };
  }
}
