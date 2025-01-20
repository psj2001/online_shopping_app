import 'package:flutter/material.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/widget/banner%20widget.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/widget/header_widget.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/widget/reusable_text_widget.dart';

import 'widget/CategoryWidget.dart';
import 'widget/PopularProductsWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          HeaderWidget(),
          BannerWidget(),
          Categorywidget(),
          ReusableTextWidget(title: 'Popular Products',subtitle: 'view all',),
          Popularproductswidget() 
          ],
        ),
      ),
    );
  }
}
 