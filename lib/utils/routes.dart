import 'package:clot/utils/store.dart';
import 'package:clot/widgets/theme.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<StoreBloc>.value(
            value: StoreBloc(),
            child: const MyBottomNavBar(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/images/2_404 Error.png",
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      bottom: 70,
                      left: 30,
                      right: 30,
                      child: MyButton(
                          onPressed: () {}, text: "Go Home".toUpperCase()))
                ],
              ),
            ));
  }
}
