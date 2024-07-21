import 'package:flutter/material.dart';
import 'package:flutter_application/Ecommerce/Categorypage.dart';
import 'package:flutter_application/Ecommerce/HomePage.dart';

import 'Cart.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final pagecontroller = PageController();
  int _selectedIndex = 0;
  List<Widget> items = [
    HomePageWidget(),
    CategoryWidget(),
    CartWidget(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            pagecontroller.jumpToPage(index);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_grocery_store), label: "Cart"),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF4e7861),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,

      ),
      body: PageView(
        controller: pagecontroller,
        children: items,
      ),
    );
  }
}
