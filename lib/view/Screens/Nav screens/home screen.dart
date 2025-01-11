import 'package:flutter/material.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/widget/banner%20widget.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/widget/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          HeaderWidget(),
          BannerWidget(),
          ],
        ),
      ),
    );
  }
}
 