import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:online_shopping_app/Model/user.dart';
import 'package:http/http.dart' as http;
import 'package:online_shopping_app/services/Manage%20http%20response.dart';
import 'package:online_shopping_app/utils/global%20variable%20.dart';
import 'package:online_shopping_app/view/Screens/authentication%20screens/login%20sreen.dart';
import 'package:online_shopping_app/view/Screens/main%20screen.dart';

class Authcontroller {
  Future<void> signUpUser({
    required context,
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          fullName: fullName,
          email: email,
          state: '',
          city: '',
          locality: '',
          password: password,
          token: '');
      http.Response response = await http.post(Uri.parse('$uri/api/signup'),
          body: user
              .tojson(), //Convert the user object to json for the request body.
          headers: <String, String>{
            //Set the headers for the request.
            "Content-Type":
                "application/json; charset=UTF-8", //Specify the content type as json.
          });
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          showSnackbar(context, 'Account has bee created For you');
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return Loginsreen();
            },
          ));
        },
      );
    } catch (e) {
      log('$e');
    }
  }

  //Sign in api
  Future<void> SigninUser({
    required context,
    required String email,
    required String password,
  }) async {
    try {
      // Log input data
      log('Signing in with Email: $email, Password: $password');

      http.Response response = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
      );

      // Log the response
      log('Response Status: ${response.statusCode}');
      log('Response Body: ${response.body}');

      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Mainscreen()),
              (route) => false);
          showSnackbar(context, 'Successfully signed in!');
        },
      );
    } catch (e) {
      log('Error: $e');
      showSnackbar(context, 'An error occurred. Please try again.');
    }
  }
}
