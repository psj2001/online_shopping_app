import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Model/Product model.dart';

class ProductItemsWidgets extends StatelessWidget {
  final Product product;
  ProductItemsWidgets({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            //  width: 150,
            decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(24)),
            child: Stack(
              children: [
                Container(
                     height: 170,
                    width: 170,
                  child: Image.network(
                    product.image[0],
                    height: 130, 
                    width: 130,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 2,
                  child: Image.asset(
                    'assets/love.png',
                    height: 26,
                    width: 26,
                  ),
                ),
                  Positioned(
                  bottom: 0, 
                  right: 0,
                  child: Image.asset(
                    'assets/cart.png',
                    height: 26,
                    width: 26,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8,),
          Text(product.productName,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.roboto(
            fontSize: 13,
           color: Color(0xFF212121),
           fontWeight: FontWeight.bold,
           
          ),),
           SizedBox(height: 8,),
          Text(product.category,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.roboto(
            fontSize: 13,
           color: Colors.grey,
           fontWeight: FontWeight.bold,
           
          ),),
          
        ],  
      ),
    );
  }
}
