import 'package:bakkal_dukkani/views/search_product/services/i_search_product_service.dart';
import 'package:bakkal_dukkani/views/search_product/widgets/not_found_product.dart';
import 'package:flutter/material.dart';

import 'package:bakkal_dukkani/constants/global_variables.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../widgets/search_product_item.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({Key? key}) : super(key: key);
  static const String routeName = 'search-product-screen';

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  List<Product> searchProductList = [];
  bool isNotFoundProduct = false;

  late TextEditingController _queryStringController;

  @override
  void initState() {
    super.initState();
    _queryStringController = TextEditingController();
    searchProducts('');
  }

  @override
  void dispose() {
    _queryStringController.dispose();
    super.dispose();
  }

  Future<void> searchProducts(String searchString) async {
    searchProductList = await context
        .read<ISearchProductService>()
        .searchProducts(context: context, searchString: searchString);

    if (searchProductList.isEmpty) {
      isNotFoundProduct = true;
    } else {
      isNotFoundProduct = false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height * .1,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: TextField(
            controller: _queryStringController,
            onChanged: (value) {
              searchProducts(value.trim());
            },
            cursorColor: GlobalVariables.primaryColor,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
              prefixIcon: Image.asset('assets/icons/search.png'),
              hintText: 'Ürün ismi giriniz',
              filled: true,
              fillColor: GlobalVariables.primaryColor.withOpacity(.22),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: GlobalVariables.primaryColor)),
            ),
          ),
        ),
        isNotFoundProduct
            ? const NotFoundProduct()
            : Expanded(
                child: ListView.builder(
                  itemCount: searchProductList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SearchProductItem(
                        product: searchProductList[index],
                        appButtonOnTap: () {},
                      ),
                    );
                  },
                ),
              )
      ],
    );
  }
}
