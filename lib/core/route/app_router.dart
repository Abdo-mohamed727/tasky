import 'package:flutter/material.dart';
import 'package:tasky/core/route/app-routs.dart';
import 'package:tasky/features/auth/presintation/screens/home_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouts.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
