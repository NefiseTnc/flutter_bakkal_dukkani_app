import 'package:bakkal_dukkani/models/product.dart';
import 'package:bakkal_dukkani/views/authentication/screens/forgot_password_screen.dart';
import 'package:bakkal_dukkani/views/authentication/screens/login_screen.dart';
import 'package:bakkal_dukkani/views/authentication/screens/sign_up_screen.dart';
import 'package:bakkal_dukkani/views/bottom_navbar/screens/bottom_navbar_screen.dart';
import 'package:bakkal_dukkani/views/category_list/screens/category_list_screen.dart';
import 'package:bakkal_dukkani/views/category_list/screens/product_list_screen.dart';
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
      case BottomNavBarScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const BottomNavBarScreen(),
        );
      case CategoryListScreen.routeName:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const CategoryListScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => const NotFoundPage(),
        );
    }
  }
}
