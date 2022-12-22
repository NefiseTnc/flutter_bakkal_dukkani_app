import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bakkal_dukkani/views/home/widgets/category_item.dart';
import 'package:bakkal_dukkani/views/home/screens/product_list_screen.dart';

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
      appBar: _appBar(),
      body: Padding(
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
      title: const Text(
        'Kategoriler',
        style: TextStyle(
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
