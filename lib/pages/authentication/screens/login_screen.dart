import 'package:bakkal_dukkani/pages/authentication/screens/sign_up_screen.dart';
import 'package:bakkal_dukkani/pages/authentication/screens/welcome_screen.dart';
import 'package:bakkal_dukkani/pages/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/app_textfield.dart';
import '../../../constants/global_variables.dart';
import 'forgot_password_screen.dart';
import '../../../common/widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool _isCheckPassword = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void navigateToForgotPasswordScreen() {
    Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
  }

  void navigateToSignUpScreen() {
    Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
  }

  void navigateToHomeScreen() {
    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routeName, (route) => false);
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 35,
              ),
              AppTextField(
                controller: _emailController,
                labelText: 'Email*',
                iconUrl: 'assets/icons/email.png',
              ),
              const SizedBox(
                height: 13,
              ),
              AppTextField(
                controller: _emailController,
                labelText: 'Parola*',
                iconUrl: 'assets/icons/email.png',
              ),
              const SizedBox(
                height: 13,
              ),
              AppButton(
                onTap: navigateToHomeScreen,
                imageUrl: 'assets/icons/key.png',
                text: 'Giriş Yap',
                textStyle: GlobalVariables.mediumBoldTextStyle.copyWith(
                  color: Colors.white,
                ),
                color: GlobalVariables.primaryColor,
                borderColor: GlobalVariables.primaryColor,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                        height: 15,
                        child: Checkbox(
                          side: const BorderSide(
                              color: GlobalVariables.secondaryColor),
                          value: _isCheckPassword,
                          onChanged: (value) {
                            setState(() {
                              _isCheckPassword = value!;
                            });
                          },
                          activeColor: GlobalVariables.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Parolayı Hatırla',
                        style: GlobalVariables.mediumTextStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: navigateToForgotPasswordScreen,
                      child: Text(
                        'Parolanızı mı unuttunuz?',
                        overflow: TextOverflow.ellipsis,
                        style: GlobalVariables.mediumTextStyle
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 22,
              ),
            ],
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
