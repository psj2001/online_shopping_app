import 'package:flutter/material.dart';
import 'package:online_shopping_app/view/Screens/authentication%20screens/login%20sreen.dart';
import 'package:online_shopping_app/view/Screens/main%20screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online shopping',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Mainscreen(),
    );
  }
}
