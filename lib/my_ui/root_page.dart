import 'package:Bloem/my_ui/screens/cart_page.dart';
import 'package:Bloem/my_ui/screens/favorite_page.dart';
import 'package:Bloem/my_ui/screens/home_page.dart';
import 'package:Bloem/my_ui/screens/notification_screen.dart';
import 'package:Bloem/my_ui/screens/profile_page.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'models/flowers.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Flower> favorites = [];
  List<Flower> myCart = [];

  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions() {
    return [
      const HomePage(),
      FavoritePage(
        favoritedFlowers: favorites,
      ),
      CartPage(
        addedToCartFlowers: myCart,
      ),
      const ProfilePage(),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Color.fromRGBO(218, 207, 113, 1),
                fontFamily: 'NunitoSans',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(
                        builder: (context) => new NotificationPage()),
                    (route) => false);
              },
              icon: Icon(Icons.notifications),
              color: Color.fromRGBO(218, 207, 113, 1),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: Color.fromRGBO(33, 50, 68, 1),
          splashColor: Color.fromRGBO(218, 207, 113, 1),
          activeColor: Color.fromRGBO(218, 207, 113, 1),
          inactiveColor: Color.fromRGBO(218, 207, 113, .5),
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              final List<Flower> favoritedPlants = Flower.getFavoritedFlower();
              final List<Flower> addedToCartPlants = Flower.addedToCartFlower();

              favorites = favoritedPlants;
              myCart = addedToCartPlants.toSet().toList();
            });
          }),
    );
  }
}
