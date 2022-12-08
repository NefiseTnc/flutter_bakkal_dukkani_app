import 'package:flutter/material.dart';

import 'package:bakkal_dukkani/constants/global_variables.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String iconUrl;
  final String labelText;
  final String? Function(String?)? validator;
  const AppTextField({
    Key? key,
    required this.controller,
    required this.iconUrl,
    required this.labelText,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 37,
      width: size.width,
      child: TextFormField(
        controller: controller,
        validator: validator,
        cursorColor: GlobalVariables.secondaryColor,
        style: GlobalVariables.mediumTextStyle,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: GlobalVariables.mediumBoldTextStyle
              .copyWith(color: GlobalVariables.secondaryColor),
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: Image.asset(iconUrl),
          errorStyle: GlobalVariables.smallBoldTextStyle
              .copyWith(color: GlobalVariables.errorColor, height: .2),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: GlobalVariables.secondaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(
                30,
              ),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: GlobalVariables.secondaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(
                30,
              ),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: GlobalVariables.errorColor),
            borderRadius: BorderRadius.all(
              Radius.circular(
                30,
              ),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: GlobalVariables.errorColor),
            borderRadius: BorderRadius.all(
              Radius.circular(
                30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
