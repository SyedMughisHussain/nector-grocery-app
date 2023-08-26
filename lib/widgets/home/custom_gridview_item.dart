import 'package:flutter/material.dart';
import 'package:nector_app/utils/colors.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem(
      this.pName, this.pPrice, this.imageUrl, this.pQuantity,
      {super.key});
  //final String title;
  final String pName;
  final String pQuantity;
  final String pPrice;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 206, 204, 204)),
            borderRadius: BorderRadius.circular(25)),
        height: 250,
        width: 165,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 60,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pName,
                        style: const TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        pQuantity,
                        style: const TextStyle(
                          color: AppColors.darkGreyColor,
                        ),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  '\$$pPrice',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  mini: true,
                  elevation: 0,
                  backgroundColor: AppColors.splashBackgroundColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
