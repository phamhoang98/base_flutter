import 'package:base_flutter/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // LOGIN
      case Routes.login:
        return AppNavigator.push(BlocProvider(
          create: (context) => LoginBloc(),
          child: const LoginScreen(),
        ));
      // HOME
      case Routes.home:
        return AppNavigator.push(const HomeScreen());
      // DEFAULT
      default:
        return AppNavigator.push(BlocProvider(
          create: (context) => LoginBloc(),
          child: const LoginScreen(),
        ));
    }
  }
}
