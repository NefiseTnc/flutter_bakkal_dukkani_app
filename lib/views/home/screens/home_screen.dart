import 'package:bakkal_dukkani/constants/global_variables.dart';
import 'package:bakkal_dukkani/models/category.dart';
import 'package:bakkal_dukkani/models/product.dart';
import 'package:bakkal_dukkani/views/home/screens/category_list_screen.dart';
import 'package:bakkal_dukkani/views/home/screens/product_list_screen.dart';
import 'package:bakkal_dukkani/views/home/services/i_home_service.dart';
import 'package:bakkal_dukkani/views/home/widgets/category_item.dart';
import 'package:bakkal_dukkani/views/home/widgets/product_item.dart';
import 'package:bakkal_dukkani/views/product_details/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categories = [];
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    getCategories();
    getProducts();
  }

  void getCategories() async {
    categories = await Provider.of<IHomeService>(context, listen: false)
        .getAllCategories(context: context);
    setState(() {});
  }

  void getProducts() async {
    products = await Provider.of<IHomeService>(context, listen: false)
        .getAllProducts(context: context);
    setState(() {});
  }

  void navigateCategoryListScreen(List<Category> categories) {
    Navigator.pushNamed(context, CategoryListScreen.routeName,
        arguments: categories);
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

  void navigateToProductDetailsScreen(Product product) {
    Navigator.pushNamed(context, ProductDetailsScreen.routeName,
        arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: size.width,
          height: size.height * .24,
          child: _imageSlider(size),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: categories.isNotEmpty
              ? _categories()
              : const LinearProgressIndicator(
                  color: GlobalVariables.primaryColor,
                ),
        ),
        products.isNotEmpty
            ? Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _productList()),
              )
            : const Padding(
                padding: EdgeInsets.all(25.0),
                child: Center(
                  child: CircularProgressIndicator(
                    color: GlobalVariables.primaryColor,
                  ),
                ),
              ),
      ]),
    );
  }

  Widget _imageSlider(Size size) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: size.width,
            height: size.height * .3,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: size.width,
                  margin: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'assets/images/top_image.png',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 75,
          right: 25,
          child: Column(
            children: const [
              Text('Taze Gıdalar Satın Alın',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              Text(
                'Daha iyi hissedin',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                    color: GlobalVariables.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: GlobalVariables.primaryColor)),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white)),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white)),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Kategoriler',
              style: GlobalVariables.mediumTextStyle,
            ),
            GestureDetector(
              onTap: () {
                navigateCategoryListScreen(categories);
              },
              child: const Text(
                'Hepsini Gör',
                style: GlobalVariables.mediumTextStyle,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 32,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CategoryItem(
                    text: categories[index].name,
                    onTap: () async {
                      List<Product> products = await Provider.of<IHomeService>(
                              context,
                              listen: false)
                          .getProductsByCategory(
                              categoryId: categories[index].id);

                      navigateToProductListScreen(
                          products, categories[index].name);
                    }),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _productList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        const Text('Tüm Ürünler'),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: GestureDetector(
                  onTap: () {
                    navigateToProductDetailsScreen(products[index]);
                  },
                  child: ProductItem(
                    product: products[index],
                    appButtonOnTap: () {},
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
