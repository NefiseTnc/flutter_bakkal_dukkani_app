import 'package:flutter/material.dart';

import 'package:bakkal_dukkani/models/product.dart';

import '../../../constants/global_variables.dart';
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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [
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
                            child: ProductItem(
                              product: widget.productList[index],
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

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: .5,
      centerTitle: true,
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: GlobalVariables.primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Text(
        widget.categoryName,
        style: const TextStyle(
            color: GlobalVariables.textColor, fontWeight: FontWeight.normal),
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
}
