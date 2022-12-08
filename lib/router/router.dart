import 'package:bakkal_dukkani/pages/authentication/screens/forgot_password_screen.dart';
import 'package:bakkal_dukkani/pages/authentication/screens/login_screen.dart';
import 'package:bakkal_dukkani/pages/authentication/screens/reset_password_screen.dart';
import 'package:bakkal_dukkani/pages/authentication/screens/sign_up_screen.dart';
import 'package:bakkal_dukkani/pages/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../common/screens/not_found_page_screen.dart';
import '../pages/authentication/screens/welcome_screen.dart';

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
      case ResetPasswordScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const ResetPasswordScreen(),
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
