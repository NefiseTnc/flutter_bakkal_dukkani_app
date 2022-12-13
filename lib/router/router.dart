import 'package:bakkal_dukkani/views/authentication/screens/forgot_password_screen.dart';
import 'package:bakkal_dukkani/views/authentication/screens/login_screen.dart';
import 'package:bakkal_dukkani/views/authentication/screens/sign_up_screen.dart';
import 'package:bakkal_dukkani/views/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../common/screens/not_found_page_screen.dart';
import '../views/authentication/screens/welcome_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case WelcomeScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const WelcomeScreen(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const LoginScreen(),
        );
      case SignUpScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const SignUpScreen(),
        );
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const ForgotPasswordScreen(),
        );

      case HomeScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const NotFoundPage(),
        );
    }
  }
}
