import 'package:flutter/material.dart';
import 'package:nector_app/utils/colors.dart';

class CartItem extends StatefulWidget {
  const CartItem(
      this.onPressed, this.pImage, this.pPrice, this.pName, this.pquantity,
      {super.key});

  final Function onPressed;
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
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(5),
      height: 80,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(
        children: [
          Image.network(
            widget.pImage,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.pName,
                style: const TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                widget.pquantity,
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              )
            ],
          ),
          const SizedBox(
            width: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => widget.onPressed(),
                  icon: const Icon(
                    Icons.delete,
                  )),
              Text(
                '\$${widget.pPrice}',
                style: const TextStyle(color: AppColors.blackColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
