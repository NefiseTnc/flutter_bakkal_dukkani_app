import 'package:flutter/material.dart';

import 'package:bakkal_dukkani/models/product.dart';

import '../../../common/widgets/app_button.dart';
import '../../../constants/global_variables.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

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
            child: Image.network(
              product.image_url,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            product.name,
            overflow: TextOverflow.ellipsis,
            style: GlobalVariables.mediumTextStyle,
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${product.unit_quantity.toString()} ${product.unit}',
                style: GlobalVariables.smallTextStyle,
              ),
              Text(
                '\$${product.price.toString()}',
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
