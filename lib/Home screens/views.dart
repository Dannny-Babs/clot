import 'package:clot/utils/store.dart';

import 'package:clot/widgets/theme.dart';
import 'package:flutter/material.dart';

class HomeScreenLoading extends StatefulWidget {
  const HomeScreenLoading({super.key});

  @override
  State<HomeScreenLoading> createState() => _HomeScreenLoadingState();
}

class _HomeScreenLoadingState extends State<HomeScreenLoading> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreBloc, StoreState>(
      builder: (context, state) {
        if (state.productStatus == StoreRequest.requestInProgress) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Chill, your network slow die...',
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          );
        }
        if (state.productStatus == StoreRequest.requestFailure) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Text('Something went wrong',
                    style: TextStyle(fontSize: 18)),
                const SizedBox(height: 55),
                MyButton(
                    onPressed: () =>
                        context.read<StoreBloc>().add(StoreProductRequested()),
                    text: 'Try Again',
                    fontSize: 18,
                    color: Colors.red),
              ],
            ),
          );
        }
        if (state.productStatus == StoreRequest.unknown) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Ionicons.cart_sharp,
                    size: 25,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'No products found',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 35),
                MyButton(
                    onPressed: () =>
                        context.read<StoreBloc>().add(StoreProductRequested()),
                    text: 'Try Again',
                    fontSize: 18),
              ],
            ),
          );
        }
        //  (state.productStatus == StoreRequest.requestSuccess)
        return Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio:
                    MediaQuery.of(context).size.width > 600 ? 0.68 : 0.62,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  productId: state.products[index].id,
                  productimage: state.products[index].image,
                  productName: state.products[index].title,
                  price: state.products[index].price,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
