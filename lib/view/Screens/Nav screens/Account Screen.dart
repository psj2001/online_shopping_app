import 'package:flutter/material.dart';
import 'package:online_shopping_app/controller/auth%20controller.dart';

class Accountscreen extends StatelessWidget {
  Accountscreen({super.key});
  final Authcontroller _authcontroller = Authcontroller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _authcontroller.signOutUser(context: context);
          },
          child: Text("Sign Out"),
        ),
      ),
    );
  }
}
