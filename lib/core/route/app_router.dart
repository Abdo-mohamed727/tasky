import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/di/dependency_ingectiojn.dart';
import 'package:tasky/core/route/app-routs.dart';
import 'package:tasky/features/auth/presintation/cubit/login/login_cubit.dart';
import 'package:tasky/features/auth/presintation/cubit/sign_up/cubit/sign_up_cubit.dart';
import 'package:tasky/features/auth/presintation/screens/login_screen.dart';
import 'package:tasky/features/auth/presintation/screens/register_screen.dart';
import 'package:tasky/features/home_screen/home_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouts.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case AppRouts.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<SignUpCubit>(),
            child: RegisterScreen(),
          ),
        );
      case AppRouts.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
