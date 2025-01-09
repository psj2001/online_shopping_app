import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shopping_app/controller/auth%20controller.dart';
import 'package:online_shopping_app/utils/AppColors.dart';
import 'package:online_shopping_app/utils/widget/Advanced%20Button.dart';
import 'package:online_shopping_app/view/Screens/authentication%20screens/Register%20screen.dart';

class Loginsreen extends StatefulWidget {
  @override
  State<Loginsreen> createState() => _LoginsreenState();
}

class _LoginsreenState extends State<Loginsreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  final Authcontroller _authcontroller = Authcontroller();

  late String email;

  late String password;
  bool isLoading = false;
  loginUser() async {
    setState(() {
      isLoading = true;
    });
    await _authcontroller.SigninUser(
            context: context, email: email, password: password)
        .whenComplete(() {
      setState(() {
        _formkey.currentState!.reset();
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primaryscaffoldcolor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login Your Account",
                    style: GoogleFonts.getFont(
                      'Lato',
                      fontSize: 23,
                      letterSpacing: 0.2,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.primarytextxolor,
                    ),
                  ),
                  Text(
                    "To Explore the world exclusives",
                    style: GoogleFonts.getFont(
                      'Lato',
                      fontSize: 14,
                      letterSpacing: 0.2,
                      fontWeight: FontWeight.bold,
                      color: Color(
                        0xFF0d120e,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/Illustration.png',
                    width: 200,
                    height: 200,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email",
                      style: GoogleFonts.getFont(
                        'Nunito Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: 'Enter your email',
                        labelStyle: GoogleFonts.getFont(
                          'Nunito Sans',
                          letterSpacing: 0.1,
                          fontSize: 14,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/email.png",
                            width: 10,
                            height: 10,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Password",
                      style: GoogleFonts.getFont(
                        'Nunito Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: 'Enter your password',
                        labelStyle: GoogleFonts.getFont(
                          'Nunito Sans',
                          letterSpacing: 0.1,
                          fontSize: 14,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/password.png",
                            width: 10,
                            height: 10,
                          ),
                        ),
                        suffixIcon: Icon(Icons.visibility)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : AdvancedButton(
                          onPress: () async {
                            print(email);
                            print(password);
                            if (_formkey.currentState!.validate()) {
                              loginUser();
                            } else {
                              print("Failed");
                            }
                          },
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Need an Account ?",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return RegisterScreen();
                            },
                          ));
                        },
                        child: Text(
                          " Sign up",
                          style: GoogleFonts.roboto(
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
