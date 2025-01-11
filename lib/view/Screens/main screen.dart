import 'package:flutter/material.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/Account%20Screen.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/Cart%20Screen.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/Category%20Screen.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/Favourite%20Screen.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/Stores%20Screen.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/home%20screen.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _pageindex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const FavouriteScreen(),
   const Categoryscreen(),
    const Storesscreen(),
    const CartScreen(),
    const Accountscreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                _pageindex = value;
              });
            },
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            currentIndex: _pageindex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/home.png",
                  width: 25,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/love.png",
                  width: 25,
                ),
                label: 'Favourite',
              ),
               BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/mart.png",
                  width: 25,
                ),
                label: 'Store',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/cart.png",
                  width: 25,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/profile.png",
                  width: 25,
                ),
                label: 'Account',
              ),
            ]),
        body: _pages[_pageindex]);
  }
}
