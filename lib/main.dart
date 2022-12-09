import 'package:firebase_core/firebase_core.dart';
import '/router/router.dart';
import 'package:flutter/material.dart';
import 'constants/global_variables.dart';
import 'firebase_options.dart';
import 'views/authentication/screens/welcome_screen.dart';

Future<void> main() async {
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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
      home: const WelcomeScreen(),
      onGenerateRoute: ((settings) => AppRouter.onGenerateRoute(settings)),
    );
  }
}
