import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/widgets/app_colors.dart';
import 'package:flutter_ecommerce_app/pages/cart_page.dart';
import 'package:flutter_ecommerce_app/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    Center(
      child: Text("Catalog 404, estamos trabajando para usted"),
    ),
    CartPage(),
    Center(
      child: Text("Catalog 404, estamos trabajando para usted"),
    ),
    Center(
      child: Text("Catalog 404, estamos trabajando para usted"),
    ),
  ];

  void onItemTapped(int i) {
    setState(() {
      selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: AppColor.black,
        unselectedItemColor: AppColor.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.white,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: AppColor.green,
            ),
            icon: Icon(
              Icons.home,
              color: AppColor.black,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.search,
              color: AppColor.green,
            ),
            icon: Icon(
              Icons.search,
              color: AppColor.black,
            ),
            label: "Catalog",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.shopping_bag_outlined,
              color: AppColor.green,
            ),
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: AppColor.black,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.favorite_border,
              color: AppColor.green,
            ),
            icon: Icon(
              Icons.favorite_border,
              color: AppColor.black,
            ),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: AppColor.green,
            ),
            icon: Icon(
              Icons.person,
              color: AppColor.black,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
