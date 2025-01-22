import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shopping_app/provider/Cart%20Provider.dart';
import 'package:online_shopping_app/services/Manage%20http%20response.dart';

import '../../../Model/Product model.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});
  @override
  ProductDetailsScreenState createState() => ProductDetailsScreenState();
}

class ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = ref.read(cartprovider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Detail Screen",
          style:
              GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Container(
            width: 260,
            height: 275,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  top: 50,
                  child: Container(
                    height: 260,
                    width: 260,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: const Color(0XFFD8DDFF),
                        borderRadius: BorderRadius.circular(134)),
                  ),
                ),
                Positioned(
                    left: 22,
                    top: 0,
                    child: Container(
                      width: 216,
                      height: 274,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: const Color(0xFF9CA8FF),
                          borderRadius: BorderRadius.circular(14)),
                      child: SizedBox(
                        height: 300,
                        child: PageView.builder(
                            itemCount: widget.product.image.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Image.network(
                                widget.product.image[index],
                                width: 198,
                                height: 225,
                              );
                            }),
                      ),
                    ))
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.productName,
                  style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: Color(0xFF3C55Ef)),
                ),
                Text(
                  "\$${widget.product.productPrice}",
                  style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: Color(0xFF3C55Ef)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.product.category,
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About",
                  style: GoogleFonts.lato(
                      fontSize: 17,
                      letterSpacing: 1.7,
                      color: Color(0xFF363330)),
                ),
                Text(
                  widget.product.description,
                  style: GoogleFonts.mochiyPopOne(letterSpacing: 1.6),
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(18.0),
        child: InkWell(
          onTap: () {
            cartProvider.addProductToCart(
                productName: widget.product.productName,
                productPrice: widget.product.productPrice,
                category: widget.product.category,
                image: widget.product.image,
                vendorId: widget.product.vendorId,
                productQuantity: widget.product.quantity,
                quantity: 1,
                productId: widget.product.id,
                description: widget.product.description,
                fullName: widget.product.fullName);
            showSnackbar(context,
                "Item ${widget.product.productName} has been added to Cart");
          },
          child: Container(
            width: 386,
            height: 46,
            //  clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Color(0xFF3B54EE),
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                'ADD TO CART',
                style: GoogleFonts.mochiyPopOne(
                    color: Colors.white, letterSpacing: 1.6),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
