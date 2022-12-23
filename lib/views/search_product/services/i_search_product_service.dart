import 'package:bakkal_dukkani/models/product.dart';
import 'package:flutter/material.dart';

abstract class ISearchProductService {
  Future<List<Product>> searchProducts({
    required BuildContext context,
    required String searchString,
  });
}
