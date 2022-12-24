import 'package:flutter/material.dart';

import 'package:bakkal_dukkani/models/product.dart';

import '../../../common/widgets/app_bar.dart';
import '../../../constants/global_variables.dart';
import '../../product_details/screens/product_details_screen.dart';
import '../widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  static const String routeName = 'product-list-screen';

  const ProductListScreen({
    Key? key,
    required this.categoryName,
    required this.productList,
  }) : super(key: key);
  final String categoryName;
  final List<Product> productList;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  void navigateToProductDetailsScreen(Product product) {
    Navigator.pushNamed(context, ProductDetailsScreen.routeName,
        arguments: product);
  }

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
            Text(
              widget.categoryName,
              style: GlobalVariables.largeBoldTextStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            widget.productList.isNotEmpty
                ? Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: size.width,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 200,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: widget.productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                              onTap: () => navigateToProductDetailsScreen(
                                  widget.productList[index]),
                              child: ProductItem(
                                product: widget.productList[index],
                                appButtonOnTap: () {},
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: GlobalVariables.primaryColor,
                    ),
                  ),
          ],
        ));
  }
}
