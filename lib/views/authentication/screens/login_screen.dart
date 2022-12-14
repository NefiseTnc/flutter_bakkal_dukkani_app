import 'package:bakkal_dukkani/views/authentication/screens/sign_up_screen.dart';
import 'package:bakkal_dukkani/views/authentication/services/i_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
  Future<void> signInUser() async {
    IAuthService authService =
        Provider.of<IAuthService>(context, listen: false);
    await authService.signInUser(
        context: context,
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
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
                  controller: _emailController,
                  labelText: 'Email*',
                  iconUrl: 'assets/icons/email.png',
                  validator: (value) {
                    if (!(value!.contains('@')) && value.isEmpty) {
                      return 'Ge??erli bir e-posta adresi girin!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 13,
                ),
                AppTextField(
                  controller: _passwordController,
                  labelText: 'Parola*',
                  iconUrl: 'assets/icons/email.png',
                  validator: (value) {
                    if (!(value!.length > 5) && value.isEmpty) {
                      return 'Parola 5\'ten fazla karakter i??ermelidir!';
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
                      signInUser();
                    }
                  },
                  imageUrl: 'assets/icons/key.png',
                  text: 'Giri?? Yap',
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
                          'Parolay?? Hat??rla',
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
                          'Parolan??z?? m?? unuttunuz?',
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
      ),
    );
  }

  Widget _bottomContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Hen??z bir hesab??n??z yok mu?',
          style: GlobalVariables.mediumTextStyle,
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: navigateToSignUpScreen,
          child: Text(
            'Kay??t Ol',
            style: GlobalVariables.mediumBoldTextStyle.copyWith(
              color: GlobalVariables.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
