import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: GlobalVariables.backgroundColor,
          border: Border.all(color: GlobalVariables.primaryColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: GlobalVariables.mediumBoldTextStyle,
        ),
      ),
    );
  }
}
