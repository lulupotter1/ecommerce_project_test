import 'package:ecommerce_project/presentation/detail_screen.dart';
import 'package:ecommerce_project/presentation/main_screen.dart';
import 'package:ecommerce_project/presentation/my_cart_screen.dart';
import 'package:flutter/material.dart';

abstract class Constants {
  static const mainScreenUrl = 'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175';
  static const detailScreenUrl = 'https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5';
  static const myCartScreenUrl = 'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149';

  static const appTitle = 'Ecommerce';

  static Map<String, Widget Function(BuildContext)> appRoutes = {
    'MainScreen': (context) => const MainScreen(),
    'DetailScreen': (context) => const DetailScreen(),
    'MyCartScreen': (context) => const MyCartScreen(),
  };

  static List<String> mainCircleAssetNames = [
    'phone_white.svg',
    'computer_gray.svg',
    'health_gray.svg',
    'books_gray.svg',
    'books_gray.svg',
  ];

  static List<String> mainAssetNames = [
    'Phones',
    'Computer',
    'Health',
    'Books',
    'Books',
  ];
}

abstract class AppRoutesString {
  static const String routeToMainScreen = 'MainScreen';
  static const String routeToDetailScreen = 'DetailScreen';
  static const String routeToMyCartScreen = 'MyCartScreen';
}
