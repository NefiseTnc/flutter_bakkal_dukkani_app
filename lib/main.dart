import 'package:bakkal_dukkani/views/authentication/screens/welcome_screen.dart';
import 'package:bakkal_dukkani/views/bottom_navbar/screens/bottom_navbar_screen.dart';
import 'package:bakkal_dukkani/views/home/services/home_service.dart';
import 'package:bakkal_dukkani/views/home/services/i_home_service.dart';
import 'package:bakkal_dukkani/views/search_product/services/i_search_product_service.dart';
import 'package:bakkal_dukkani/views/search_product/services/search_product_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bakkal_dukkani/providers/user_provider.dart';
import 'package:bakkal_dukkani/views/authentication/services/auth_service.dart';
import 'package:bakkal_dukkani/views/authentication/services/i_auth_service.dart';
import '/router/router.dart';
import 'constants/global_variables.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences pref = await SharedPreferences.getInstance();
  var user = pref.getBool('user-state') ?? false;

  runApp(MyApp(
    isUser: user,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    required this.isUser,
  }) : super(key: key);
  final bool isUser;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IAuthService>(
          create: (context) => FirebaseAuthService(),
        ),
        Provider<IHomeService>(
          create: (context) => HomeService(),
        ),
        Provider<ISearchProductService>(
          create: (context) => SearchProductService(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Bakkal Dükkanı',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        ),
        home:
            widget.isUser ? const BottomNavBarScreen() : const WelcomeScreen(),
        onGenerateRoute: ((settings) => AppRouter.onGenerateRoute(settings)),
      ),
    );
  }
}
