import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final Color borderColor;
  final String? imageUrl;
  final String text;
  final TextStyle textStyle;

  const AppButton({
    Key? key,
    required this.onTap,
    required this.color,
    required this.borderColor,
    this.imageUrl,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: color,
            border: Border.all(
              color: borderColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageUrl != null ? Image.asset(imageUrl!) : const SizedBox(),
              const SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: textStyle,
              ),
            ],
          )),
    );
  }
}
