import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.text,
    required this.onTap,
    this.padding,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding == null
            ? const EdgeInsets.all(5.0)
            : EdgeInsets.all(padding!),
        decoration: BoxDecoration(
          color: GlobalVariables.backgroundColor,
          border: Border.all(color: GlobalVariables.primaryColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GlobalVariables.mediumBoldTextStyle,
        ),
      ),
    );
  }
}
