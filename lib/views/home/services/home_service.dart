import 'package:bakkal_dukkani/models/category.dart';
import 'package:bakkal_dukkani/models/product.dart';
import 'package:bakkal_dukkani/views/home/services/i_home_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeService implements IHomeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Category>> getAllCategories(
      {required BuildContext context}) async {
    List<Category> categories = [];

    try {
      var categoryDoc = await _firestore.collection('categories').get();

      for (var category in categoryDoc.docs) {
        categories.add(Category.fromMap(category.data()));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return categories;
  }

  @override
  Future<List<Product>> getAllProducts({required BuildContext context}) async {
    List<Product> products = [];
    try {
      var productDocs = await _firestore.collection('products').get();
      for (var product in productDocs.docs) {
        products.add(Product.fromMap(product.data()));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return products;
  }
  
 @override
  Future<List<Product>> getProductsByCategory(
      {required String categoryId}) async {
    List<Product> products = [];

    var productDocs = await _firestore
        .collection('products')
        .where('category_id', isEqualTo: categoryId)
        .get();

    for (var product in productDocs.docs) {
      products.add(Product.fromMap(product.data()));
    }

    return products;
  }
}
