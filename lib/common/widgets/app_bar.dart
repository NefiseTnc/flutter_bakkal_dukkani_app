import 'package:flutter/material.dart';
import '../../constants/global_variables.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: GlobalVariables.primaryColor,
      ),
    ),
    backgroundColor: Colors.white,
    elevation: .5,
    centerTitle: true,
    title: RichText(
      text: const TextSpan(children: [
        TextSpan(
          text: 'Bakkal ',
          style: TextStyle(color: GlobalVariables.textColor, fontSize: 22),
        ),
        TextSpan(
          text: 'Dükkanı',
          style: TextStyle(color: GlobalVariables.primaryColor, fontSize: 22),
        ),
      ]),
    ),
    actions: [
      Container(
        padding: const EdgeInsets.all(5.0),
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.notifications,
                    color: GlobalVariables.secondaryColor,
                  )),
            ),
            Positioned(
              top: 13,
              right: 7,
              child: Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: GlobalVariables.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(right: 5.0),
        child: Icon(
          Icons.account_circle_rounded,
          color: GlobalVariables.secondaryColor,
        ),
      )
    ],
  );
}
