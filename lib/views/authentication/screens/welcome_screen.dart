import 'package:bakkal_dukkani/views/authentication/screens/login_screen.dart';
import 'package:bakkal_dukkani/views/authentication/screens/sign_up_screen.dart';

import '/common/widgets/app_button.dart';
import '/constants/global_variables.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'welcome-screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void navigateToLoginScreen() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void navigateToSignUpScreen() {
    Navigator.pushNamed(context, SignUpScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: _header(size),
          ),
          Positioned(
            top: size.height * .30,
            right: 0,
            left: 0,
            child: _content(size),
          )
        ],
      ),
    );
  }

  Widget _header(Size size) {
    return Container(
      width: size.width,
      height: size.height * .35,
      color: GlobalVariables.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo-bag.png'),
          const SizedBox(
            height: 15,
          ),
          RichText(
            text: const TextSpan(
              text: 'Bakkal',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: 'Dükkanı',
                    style: TextStyle(color: GlobalVariables.textColor2))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Container(
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 9,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 35,
              ),
              Image.asset('assets/images/logo.png'),
              const SizedBox(
                height: 25,
              ),
              AppButton(
                onTap: navigateToLoginScreen,
                imageUrl: 'assets/icons/key_yellow.png',
                text: 'Giriş Yap',
                textStyle: GlobalVariables.mediumBoldTextStyle.copyWith(
                  color: GlobalVariables.primaryColor,
                ),
                color: Colors.white,
                borderColor: const Color(0xFF707070),
              ),
              const SizedBox(
                height: 15,
              ),
              AppButton(
                onTap: navigateToSignUpScreen,
                imageUrl: 'assets/icons/user-plus.png',
                text: 'Kayıt Ol',
                textStyle: GlobalVariables.mediumBoldTextStyle.copyWith(
                  color: Colors.white,
                ),
                color: GlobalVariables.primaryColor,
                borderColor: GlobalVariables.primaryColor,
              ),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
