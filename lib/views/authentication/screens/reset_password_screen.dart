import 'package:bakkal_dukkani/common/widgets/app_textfield.dart';
import 'package:bakkal_dukkani/constants/utils.dart';
import 'package:bakkal_dukkani/views/authentication/screens/login_screen.dart';
import 'package:bakkal_dukkani/views/authentication/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/app_button.dart';
import '../../../constants/global_variables.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);
  static const String routeName = 'reset-password-screen';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _passwordController;
  late TextEditingController _passwordAgainController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _passwordAgainController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordAgainController.dispose();
    super.dispose();
  }

  void navigateToSignUpScreen() {
    Navigator.popAndPushNamed(context, SignUpScreen.routeName);
  }

  void navigateToLoginScreen() {
    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -25,
            child: Container(
              width: size.width * .5,
              height: size.width * .5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: GlobalVariables.primaryColor,
              ),
            ),
          ),
          Positioned(
            top: -100,
            left: 125,
            child: Container(
              width: size.width * .5,
              height: size.width * .4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: GlobalVariables.primaryColor.withOpacity(.5),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Image.asset('assets/images/logo.png'),
          ),
          Positioned(
            top: size.height * .39,
            right: 0,
            left: 0,
            child: Column(
              children: [
                _content(size),
                const SizedBox(
                  height: 15,
                ),
                _bottomContent()
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 35,
                ),
                AppTextField(
                  controller: _passwordController,
                  labelText: 'Yeni Parola*',
                  iconUrl: 'assets/icons/lock.png',
                  validator: (value) {
                    if (!(value!.length > 5) && value.isEmpty) {
                      return 'Parola 5\'ten fazla karakter içermelidir!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 13,
                ),
                AppTextField(
                  controller: _passwordAgainController,
                  labelText: 'Parolanızı tekrar yazınız*',
                  iconUrl: 'assets/icons/lock.png',
                  validator: (value) {
                    if (!(value!.length > 5) && value.isEmpty) {
                      return 'Parola 5\'ten fazla karakter içermelidir!';
                    }
                    if (!(value == _passwordController.text)) {
                      return 'Parola birbirine eşit olmalı!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 13,
                ),
                AppButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      showSnackbar(
                          context: context, message: 'Parola değiştirildi');
                      navigateToLoginScreen();
                    }
                  },
                  imageUrl: 'assets/icons/sender.png',
                  text: 'Gönder',
                  textStyle: GlobalVariables.mediumBoldTextStyle.copyWith(
                    color: Colors.white,
                  ),
                  color: GlobalVariables.primaryColor,
                  borderColor: GlobalVariables.primaryColor,
                ),
                const SizedBox(
                  height: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Henüz bir hesabınız yok mu?',
          style: GlobalVariables.mediumTextStyle,
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: navigateToSignUpScreen,
          child: Text(
            'Kayıt Ol',
            style: GlobalVariables.mediumBoldTextStyle.copyWith(
              color: GlobalVariables.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
