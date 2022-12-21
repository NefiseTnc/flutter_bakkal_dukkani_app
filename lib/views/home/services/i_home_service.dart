import 'package:bakkal_dukkani/models/category.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/product.dart';

abstract class IHomeService {
  Future<List<Category>> getAllCategories({required BuildContext context});
  Future<List<Product>> getAllProducts({required BuildContext context});
  Future<List<Product>> getProductsByCategory({required String categoryId});
}
