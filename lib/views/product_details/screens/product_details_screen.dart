import 'package:bakkal_dukkani/common/widgets/app_bar.dart';
import 'package:bakkal_dukkani/common/widgets/app_button.dart';
import 'package:bakkal_dukkani/constants/global_variables.dart';
import 'package:flutter/material.dart';

import 'package:bakkal_dukkani/models/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = 'product-details-screen';

  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            width: size.width,
            height: size.height * .2,
            color: Colors.white,
            child: Image.network(
              widget.product.image_url,
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: GlobalVariables.standartBoxShadows,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: GlobalVariables.largeBoldTextStyle
                        .copyWith(fontSize: 18),
                    overflow: TextOverflow.clip,
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: GlobalVariables.largeBoldTextStyle
                        .copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Ürün Açıklaması : ',
                    style: GlobalVariables.largeBoldTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.product.description,
                    style: GlobalVariables.mediumTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: AppButton(
                      onTap: () {},
                      color: GlobalVariables.primaryColor,
                      borderColor: GlobalVariables.primaryColor,
                      text: 'Sepete ekle',
                      imageUrl: 'assets/icons/basket.png',
                      textStyle: GlobalVariables.largeBoldTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
