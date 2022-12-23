import 'package:bakkal_dukkani/models/product.dart';
import 'package:bakkal_dukkani/views/search_product/services/i_search_product_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchProductService implements ISearchProductService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<Product>> searchProducts({
    required BuildContext context,
    required String searchString,
  }) async {
    List<Product> productList = [];

   try {
      var productDoc = await _firebaseFirestore.collection('products').get();

    for (var product in productDoc.docs) {
      productList.add(Product.fromMap(product.data()));
    }

    productList = productList
        .where((element) =>
            element.name.toLowerCase().contains(searchString.toLowerCase()))
        .toList(); 
   } catch (e) {
     debugPrint(e.toString()); 
   }

    return productList;
  }
}
