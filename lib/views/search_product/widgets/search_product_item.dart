import 'package:flutter/material.dart';

import '../../../common/widgets/app_button.dart';
import '../../../constants/global_variables.dart';
import '../../../models/product.dart';

class SearchProductItem extends StatelessWidget {
  const SearchProductItem({
    Key? key,
    required this.product,
    required this.appButtonOnTap,
  }) : super(key: key);

  final Product product;
  final VoidCallback appButtonOnTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      width: size.width,
      height: size.height * .12,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: GlobalVariables.standartBoxShadows,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: size.width * .2, child: Image.network(product.image_url)),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: size.width * .35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: GlobalVariables.largeTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${product.unit_quantity.toString()} ${product.unit}',
                  style: GlobalVariables.mediumTextStyle,
                ),
                Text(
                  '\$${product.price}',
                  style: GlobalVariables.largeBoldTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          AppButton(
            onTap: appButtonOnTap,
            color: GlobalVariables.primaryColor,
            borderColor: GlobalVariables.primaryColor,
            text: 'Sepete ekle',
            textStyle: GlobalVariables.mediumBoldTextStyle
                .copyWith(color: Colors.white),
            imageUrl: 'assets/icons/basket.png',
            padding: 8.0,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
