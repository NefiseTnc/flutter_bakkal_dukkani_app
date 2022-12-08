import 'package:bakkal_dukkani/common/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/app_button.dart';
import '../../../constants/global_variables.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = 'sign-up-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _userName;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _userName = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _userName.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
              children: [_content(size), _bottomContent()],
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
                controller: _userName,
                labelText: 'Ad Soyad',
                iconUrl: 'assets/icons/email.png',
              ),
              const SizedBox(
                height: 13,
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
                onTap: () {},
                imageUrl: 'assets/icons/user-plus.png',
                text: 'Kayıt ol',
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      'Zaten hesabınız var mı?',
                      overflow: TextOverflow.ellipsis,
                      style: GlobalVariables.mediumTextStyle,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Giriş Yap',
                    style: GlobalVariables.mediumBoldTextStyle.copyWith(
                      color: GlobalVariables.primaryColor,
                    ),
                  ),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'veya',
          style: GlobalVariables.mediumTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/google.png'),
            Image.asset('assets/icons/facebook.png'),
            const Text(
              'ile kayıt olun.',
              style: GlobalVariables.mediumTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
