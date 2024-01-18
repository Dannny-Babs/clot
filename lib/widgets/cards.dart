import 'package:Clot/utils/colors.dart';
import 'package:Clot/utils/store.dart';
import 'package:Clot/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:ionicons/ionicons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Clot/storebloc/bloc/store_bloc.dart'; // Add the missing import statement for StoreBloc

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.productId,
      required this.productimage,
      required this.productName,
      required this.price});

  final int productId;
  final String productimage;
  final String productName;
  final double price;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  void _addtoCart(int cartIds) {
    context.read<StoreBloc>().add(StoreProductAddedCart(cartIds));
  }

  void _removefromCart(int cartIds) {
    context.read<StoreBloc>().add(StoreProductRemovedCart(cartIds));
  }

  void _favorite(int productId) {
    context.read<StoreBloc>().add(StoreProductFavorite(productId));
  }

  void _unfavorite(int productId) {
    context.read<StoreBloc>().add(StoreProductUnFavorite(productId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreBloc, StoreState>(
      builder: (context, state) {
        final inCart = state.cartIds.contains(widget.productId);
        final inFavorite = state.favoriteIds.contains(widget.productId);
        //final inCart = state.cartIds?.contains(widget.productId) ?? false;
        return Container(
          key: ValueKey(widget.productId),
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Image.network(
                  widget.productimage,
                  height: MediaQuery.of(context).size.height > 1000 ? 180 : 140,
                ),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: const BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: GoogleFonts.dmSans(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        TextWidget(
                            text: '\$${widget.price}',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            inFavorite
                                ? _unfavorite(widget.productId)
                                : _favorite(widget.productId);
                          },
                          child: Icon(
                            inFavorite
                                ? Ionicons.heart
                                : Ionicons.heart_outline,
                            color: inFavorite ? Colors.red : AppColors.black,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        inCart
                            ? _removefromCart(widget.productId)
                            : _addtoCart(widget.productId);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:
                            inCart ? AppColors.grey : AppColors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                                color: inCart
                                    ? AppColors.black
                                    : AppColors.primary)),
                      ),
                      child: inCart
                          ? Center(
                              child: TextWidget(
                                text: 'Remove from cart',
                                fontSize: 15,
                                color: AppColors.black,
                              ),
                            )
                          : Center(
                              child: TextWidget(
                                text: 'Add to cart',
                                fontSize: 15,
                                color: AppColors.white,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
