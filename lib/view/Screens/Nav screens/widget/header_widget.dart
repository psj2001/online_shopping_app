import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.16,
      child: Stack(
        children: [
          Image.asset(
            "assets/searchBanner.jpeg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 48,
            top: 68,
            child: SizedBox(
              height: 50,
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter text',
                  hintStyle: TextStyle(fontSize: 14, color: Color(0xff7f7f7f)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  prefixIcon: Image.asset(
                    "assets/searc1.png",
                    height: 10,
                    width: 10,
                  ),
                  suffixIcon: Image.asset("assets/cam.png",
                     height: 10,
                    width: 10,
                    ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  focusColor: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
              left: 311,
              top: 78,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  child: Ink(
                    width: 31,
                    height: 31,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/bell.png"))),
                  ),
                ),
              )),
          Positioned(
              left: 354,
              top: 78,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  child: Ink(
                    width: 31,
                    height: 31,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/message.png"))),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
