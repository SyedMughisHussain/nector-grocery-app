import 'package:flutter/material.dart';
import 'package:nector_app/utils/colors.dart';

class CartItem extends StatefulWidget {
  const CartItem(this.pImage, this.pPrice, this.pName, this.pquantity,
      {super.key});

  final String pImage;
  final String pPrice;
  final String pquantity;
  final String pName;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(widget.pImage, fit: BoxFit.cover),
      title: Text(
        widget.pName,
        style: const TextStyle(color: AppColors.blackColor),
      ),
      trailing: Text(widget.pPrice,
          style: const TextStyle(color: AppColors.blackColor)),
    );
  }
}
