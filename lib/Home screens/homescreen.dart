import 'package:Clot/utils/colors.dart';
import 'package:Clot/utils/store.dart';
import 'package:Clot/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => StoreBloc(), child: const HomeScreenLoading());
  }
}

class HomeScreenLoading extends StatefulWidget {
  const HomeScreenLoading({super.key});

  @override
  State<HomeScreenLoading> createState() => _HomeScreenLoadingState();
}

class _HomeScreenLoadingState extends State<HomeScreenLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          margin: const EdgeInsets.only(top: 12),
          child: AppBar(
            automaticallyImplyLeading: false, // Remove the back arrow
            title: Row(
              children: [
                Image.asset(
                  'assets/images/user.png',
                  height: 45,
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Men ',
                        style: GoogleFonts.dmSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(Ionicons.chevron_down, size: 18),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  padding: const EdgeInsets.all(12),
                  style:
                      IconButton.styleFrom(backgroundColor: AppColors.primary),
                  icon: const Icon(
                    Ionicons.cart_outline,
                    size: 18,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                )
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<StoreBloc, StoreState>(
        builder: (context, state) {
          if (state.productStatus == StoreRequest.requestInProgress) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Chill, your network slow die...'),
                ],
              ),
            );
          }
          if (state.productStatus == StoreRequest.requestFailure) {
            return Padding(
              padding: const EdgeInsets.symmetric(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Something went wrong'),
                  MyButton(
                      onPressed: () => context
                          .read<StoreBloc>()
                          .add(StoreProductRequested()),
                      text: 'Try Again'),
                ],
              ),
            );
          }
          if (state.productStatus == StoreRequest.unknown) {
            return Padding(
              padding: const EdgeInsets.symmetric(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Ionicons.cloud_offline_outline,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('No products found'),
                 const SizedBox(height: 5),
                  MyButton(
                      onPressed: () => context
                          .read<StoreBloc>()
                          .add(StoreProductRequested()),
                      text: 'Try Again'),
                ],
              ),
            );
          }
          //  (state.productStatus == StoreRequest.requestSuccess) 
          return const Text('Success');
        },
      ),
    );
  }
}
