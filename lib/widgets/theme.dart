import 'package:clot/Home%20screens/homescreen.dart';
import 'package:clot/utils/store.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart'; //

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

        return Container(
          key: ValueKey(widget.productId),
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            color: Colors.white54,
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              state.productStatus == StoreRequest.requestInProgress
                  ? SizedBox(
                      height:
                          MediaQuery.of(context).size.height > 1000 ? 180 : 140,
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: Shimmer.fromColors(
                        // Fix Problem 1: Add the missing import statement
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade200,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Image.network(
                        widget.productimage,
                        height: MediaQuery.of(context).size.height > 1000
                            ? 180
                            : 140,
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
                            inFavorite ? Ionicons.heart : Ionicons.heart,
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

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          const Icon(
            Ionicons.search,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<BottomNavigationBarItem> bottomNavBarItems =
    const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(
      Ionicons.home,
      size: 20,
    ),
    activeIcon: Icon(
      Ionicons.home,
      size: 20,
    ),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Ionicons.receipt_outline,
      size: 20,
    ),
    label: 'Orders',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Ionicons.notifications_outline,
      size: 20,
    ),
    label: 'Notifications',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Ionicons.person_outline,
      size: 20,
    ),
    label: 'Profile',
  ),
];

const List<Widget> bottomNavScreen = <Widget>[
  Homescreen(),
  // OrdersScreen(),
  // NotificationsScreen(),
  // ProfileScreen(),
];

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoreBloc>(
      create: (_) => StoreBloc(),
      child: BlocConsumer<StoreBloc, StoreState>(
        listener: (context, state) => {},
        builder: (context, state) {
          return Scaffold(
            body: bottomNavScreen.elementAt(state.tabIndex),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black26,
                    width: 0.5,
                  ),
                ),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(0, -1), // Shadow position
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                child: BottomNavigationBar(
                  items: bottomNavBarItems,
                  currentIndex: state.tabIndex,
                  onTap: (index) {
                    context.read<StoreBloc>().add(TabChange(tabIndex: index));
                  },
                  selectedItemColor: AppColors.white,
                  unselectedItemColor: AppColors.grey,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: AppColors.primary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
