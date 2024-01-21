import 'package:clot/utils/store.dart';
import 'package:clot/widgets/theme.dart';
import 'package:flutter/material.dart';

import 'views.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreBloc(),
      child: Scaffold(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                    style: IconButton.styleFrom(
                        backgroundColor: AppColors.primary),
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
        body: const SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                MySearchBar(),
                HomeScreenLoading(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
