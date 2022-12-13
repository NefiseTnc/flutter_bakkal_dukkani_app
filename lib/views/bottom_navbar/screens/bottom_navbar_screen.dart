import 'package:bakkal_dukkani/constants/global_variables.dart';
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
    Scaffold(
      body: Center(
        child: Text('Siparişlerim'),
      ),
    ),
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
      actions: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/icons/cart.png')),
            ),
            Positioned(
              top: 15,
              right: 18,
              child: Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: GlobalVariables.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '0',
                    style: GlobalVariables.xSmallBoldTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
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
                child: Image.asset('assets/icons/orders.png')),
            label: 'Siparişlerim',
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
