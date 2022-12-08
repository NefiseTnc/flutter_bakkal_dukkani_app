import 'package:flutter/material.dart';

class GlobalVariables {
  //  COLORS
  static const backgroundColor = Color(0xFFFCFCFC);
  static const primaryColor = Color(0xFFFFBD2E);
  static const secondaryColor = Color(0xFF707070);
  static const textColor = Color(0xFF646464);
  static const textColor2 = Color(0xFF303030);
  static const errorColor = Color(0xFFD9534F);

  //TextStyle
  static const xSmallTextStyle = TextStyle(fontSize: 10, color: textColor);
  static const xSmallBoldTextStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: textColor);

  static const smallTextStyle = TextStyle(fontSize: 11, color: textColor);
  static const smallBoldTextStyle =
      TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: textColor);

  static const mediumTextStyle = TextStyle(fontSize: 12, color: textColor);
  static const mediumBoldTextStyle =
      TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: textColor);

  static const largeTextStyle = TextStyle(fontSize: 14, color: textColor);
  static const largeBoldTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textColor);
}
