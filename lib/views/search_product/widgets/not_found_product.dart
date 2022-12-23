import 'package:flutter/material.dart';

class NotFoundProduct extends StatelessWidget {
  const NotFoundProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/not_found_product.png'),
          const Text('Aranan ürün bulunamadı.Tekrar Deneyin'),
        ],
      ),
    );
  }
}
