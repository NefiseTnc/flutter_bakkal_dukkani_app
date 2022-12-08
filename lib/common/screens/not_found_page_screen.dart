import 'package:flutter/material.dart';
import '../../constants/global_variables.dart';
import '../widgets/app_button.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/warning.png',
            width: 250,
            height: 250,
          ),
          const SizedBox(
            height: 55,
          ),
          const Text(
            'Sayfa Bulunamadı..',
            style: TextStyle(
                color: GlobalVariables.textColor2,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 55,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: AppButton(
              onTap: () {
                Navigator.pop(context);
              },
              color: GlobalVariables.primaryColor,
              borderColor: GlobalVariables.primaryColor,
              text: 'Geri Dön',
              textStyle: GlobalVariables.largeBoldTextStyle
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
