import 'package:bakkal_dukkani/constants/global_variables.dart';
import 'package:flutter/material.dart';

void showSnackbar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: GlobalVariables.mediumBoldTextStyle.copyWith(color: Colors.white),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.black,
  ));
}
