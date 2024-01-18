import 'package:Clot/utils/colors.dart';
import 'package:Clot/widgets/button.dart';
import 'package:Clot/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.productId,
      required this.productimage,
      required this.productName,
      required this.price});

  final String productId;
  final String productimage;
  final String productName;
  final double price;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(widget.productId),
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            widget.productimage,
            height: MediaQuery.of(context).size.height * 0.22,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: const BoxDecoration(
              color: AppColors.grey,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: widget.productName, fontSize: 17),
                const SizedBox(height: 8),
                Row(
                  children: [
                    TextWidget(
                        text: '\$${widget.price}',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    const Spacer(),
                    const Icon(
                      Ionicons.heart_outline,
                      color: AppColors.black,
                      size: 20,
                    ),
                  ],
                ),
                MyButton(onPressed: () {}, text: 'Add to Cart'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
