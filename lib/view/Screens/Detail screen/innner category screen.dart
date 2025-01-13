import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shopping_app/Model/Category%20model.dart';
import 'package:online_shopping_app/Model/subcategory%20model.dart';
import 'package:online_shopping_app/controller/subcategory%20controller.dart';
import 'package:online_shopping_app/view/Screens/Detail%20screen/widget/SubcategoryTitleWidget.dart';
import 'package:online_shopping_app/view/Screens/Detail%20screen/widget/inner%20Banner%20Widget.dart';
import 'package:online_shopping_app/view/Screens/Detail%20screen/widget/inner%20category%20content%20widget.dart';
import 'package:online_shopping_app/view/Screens/Detail%20screen/widget/inner%20header%20widget.dart';

import '../Nav screens/Account Screen.dart';
import '../Nav screens/Cart Screen.dart';
import '../Nav screens/Category Screen.dart';
import '../Nav screens/Favourite Screen.dart';
import '../Nav screens/Stores Screen.dart';

class InnerCategoryScreen extends StatefulWidget {
  final Category category;

  const InnerCategoryScreen({super.key, required this.category});

  @override
  State<InnerCategoryScreen> createState() => _InnerCategoryScreenState();
}

class _InnerCategoryScreenState extends State<InnerCategoryScreen> {  
  int _pageindex = 0;
  late Future<List<SubcategoryModel>> _subcategories;
  final SubCategoryController _subCategoryController = SubCategoryController();
  //const InnerCategoryScreen({super.key});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subcategories = _subCategoryController
        .getSubcategoriesByCategoryName(widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
   
  final List<Widget> _pages = [
  Innercategorycontentwidget(category: widget.category,),
  const FavouriteScreen(),
  const Categoryscreen(),
  const Storesscreen(),
  const CartScreen(),
   Accountscreen()
  ];
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(MediaQuery.of(context).size.height),
      //   child: InnerHeaderWidget(),
      // ),
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
        body: _pages[_pageindex] );
  }
}
