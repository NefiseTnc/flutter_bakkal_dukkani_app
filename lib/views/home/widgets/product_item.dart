import 'package:flutter/material.dart';

import '../../../common/widgets/app_button.dart';
import '../../../constants/global_variables.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.2),
          blurRadius: 5,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(.2),
          blurRadius: 5,
        ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Image.asset(
              'assets/images/product_item_img1.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Kırmızı Biber(Taze)',
            style: GlobalVariables.mediumTextStyle,
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '250 gr',
                style: GlobalVariables.smallTextStyle,
              ),
              Text(
                '\$35',
                style: GlobalVariables.mediumBoldTextStyle,
              )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          AppButton(
            onTap: () {},
            color: GlobalVariables.primaryColor,
            borderColor: GlobalVariables.primaryColor,
            text: 'Sepete ekle',
            textStyle: GlobalVariables.mediumBoldTextStyle
                .copyWith(color: Colors.white),
            imageUrl: 'assets/icons/basket.png',
            padding: 5,
          ),
          const SizedBox(
            height: 7,
          ),
        ],
      ),
    );
  }
}
