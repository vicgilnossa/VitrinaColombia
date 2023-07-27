import 'package:flutter/material.dart';
import 'package:vitrina_colombia/screens/detail_screen.dart';
import 'package:vitrina_colombia/screens/home_screen.dart';
import 'package:vitrina_colombia/screens/welcome_screen.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String home = 'home';
  static const String detail = 'detail';

  static final Map<String, WidgetBuilder> routes = {
    welcome: (context) => const WelcomeScreen(),
    home: (context) => const HomeScreen(),
    detail: (context) => const DetailScreen(),
  };
}
