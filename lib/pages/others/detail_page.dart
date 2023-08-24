import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  var _product;
  DetailPage(this._product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_product['productName']),
      ),
    );
  }
}
