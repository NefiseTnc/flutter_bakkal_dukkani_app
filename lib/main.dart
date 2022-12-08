import 'package:bakkal_dukkani/views/authentication/screens/reset_password_screen.dart';

import '/router/router.dart';
import 'package:flutter/material.dart';
import 'constants/global_variables.dart';
import 'views/authentication/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bakkal Dükkanı',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
      ),
      home: const ResetPasswordScreen(),
      onGenerateRoute: ((settings) => AppRouter.onGenerateRoute(settings)),
    );
  }
}
