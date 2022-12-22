import 'package:bakkal_dukkani/common/widgets/category_item.dart';
import 'package:bakkal_dukkani/views/category_list/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/category.dart';
import '../../../models/product.dart';
import '../../home/services/i_home_service.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({Key? key}) : super(key: key);
  static const String routeName = 'category-list-screen';

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  void getCategories() async {
    categories = await Provider.of<IHomeService>(context, listen: false)
        .getAllCategories(context: context);
    setState(() {});
  }

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 5,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 5,
            ),
          ],
        ),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CategoryItem(
                text: categories[index].name,
                padding: 15.0,
                onTap: () async {
                  List<Product> products =
                      await Provider.of<IHomeService>(context, listen: false)
                          .getProductsByCategory(
                              categoryId: categories[index].id);
                  navigateToProductListScreen(products, categories[index].name);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
