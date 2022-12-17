// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bakkal_dukkani/constants/global_variables.dart';
import 'package:bakkal_dukkani/views/home/widgets/category_item.dart';
import 'package:bakkal_dukkani/views/home/widgets/product_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        SizedBox(
          width: size.width,
          height: size.height * .24,
          child: _imageSlider(size),
        ),
        _categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text('Sebze'),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 200,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductItem();
                    },
                  ),
                )
              ],
            ),
          ),
        )
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Kategoriler',
            style: GlobalVariables.mediumTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 32,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryItem(text: 'Meyveler & Sebzeler', onTap: () {}),
                CategoryItem(text: 'Kahvaltılıklar', onTap: () {}),
                CategoryItem(text: 'İçecekler', onTap: () {}),
                CategoryItem(text: 'Atıştırmalıklar', onTap: () {}),
                CategoryItem(text: 'Süt Ürünleri', onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
