import 'package:bakkal_dukkani/constants/global_variables.dart';
import 'package:bakkal_dukkani/views/category_list/screens/category_list_screen.dart';
import 'package:bakkal_dukkani/views/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);
  static const String routeName = 'bottom-navbar-screen';

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  var _currentIndex = 0;

  List pages = const [
    HomeScreen(),
    CategoryListScreen(),
    Scaffold(
      body: Center(
        child: Text('Arama'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('Hesabım'),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: pages[_currentIndex],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: Image.asset('assets/icons/bars.png'),
      backgroundColor: Colors.white,
      elevation: .5,
      centerTitle: true,
      title: RichText(
        text: const TextSpan(children: [
          TextSpan(
            text: 'Bakkal ',
            style: TextStyle(color: GlobalVariables.textColor, fontSize: 22),
          ),
          TextSpan(
            text: 'Dükkanı',
            style: TextStyle(color: GlobalVariables.primaryColor, fontSize: 22),
          ),
        ]),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/icons/cart.png',
                      color: GlobalVariables.secondaryColor,
                    )),
              ),
              Positioned(
                top: 7,
                right: 15,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: GlobalVariables.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('0',
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        fixedColor: GlobalVariables.textColor,
        unselectedItemColor: GlobalVariables.textColor,
        selectedLabelStyle: GlobalVariables.smallTextStyle,
        unselectedLabelStyle: GlobalVariables.smallTextStyle,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset('assets/icons/home.png')),
            label: 'AnaSayfa',
          ),
          BottomNavigationBarItem(
            icon: Container(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset('assets/icons/category.png')),
            label: 'Kategoriler',
          ),
          BottomNavigationBarItem(
            icon: Container(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset('assets/icons/search.png')),
            label: 'Arama',
          ),
          BottomNavigationBarItem(
            icon: Container(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset('assets/icons/account.png')),
            label: 'Hesabım',
          )
        ]);
  }
}
