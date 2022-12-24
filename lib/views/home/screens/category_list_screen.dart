import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bakkal_dukkani/views/home/widgets/category_item.dart';
import 'package:bakkal_dukkani/views/home/screens/product_list_screen.dart';

import '../../../common/widgets/app_bar.dart';
import '../../../constants/global_variables.dart';
import '../../../models/category.dart';
import '../../../models/product.dart';
import '../services/i_home_service.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({
    Key? key,
    required this.categories,
  }) : super(key: key);
  static const String routeName = 'category-list-screen';
  final List<Category> categories;

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  void navigateToProductListScreen(
      List<Product> products, String categoryName) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductListScreen(
              categoryName: categoryName, productList: products),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: GlobalVariables.standartBoxShadows),
          child: ListView.builder(
            itemCount: widget.categories.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryItem(
                  text: widget.categories[index].name,
                  padding: 15.0,
                  onTap: () async {
                    List<Product> products =
                        await Provider.of<IHomeService>(context, listen: false)
                            .getProductsByCategory(
                                categoryId: widget.categories[index].id);
                    navigateToProductListScreen(
                        products, widget.categories[index].name);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
