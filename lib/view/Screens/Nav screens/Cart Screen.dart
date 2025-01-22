import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shopping_app/provider/Cart%20Provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartData = ref.watch(cartprovider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 118,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/cartb.png',
                  ),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                left: 322,
                top: 52,
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {print("object==>>$cartData");
                      },
                      icon: Badge.count(
                        count: cartData.length,
                        child: Image.asset(
                          'assets/not.png',
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),   Positioned(
                left: 61,
                top: 51, 
                child: Text("My Cart",
                style: GoogleFonts.lato(color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                  ),)
              ),
            ],
          ),
        ), 
      ),
      body: Column(
        children: [
          Center(
            child: Text("Cart Screen"),
          ),
        ],
      ),
    );
  }
}
