import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shopping_app/controller/Product%20controller.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/widget/product_items_widgets.dart';

import '../../../../Model/Product model.dart';

class Popularproductswidget extends StatefulWidget {
  const Popularproductswidget({super.key});

  @override
  State<Popularproductswidget> createState() => _PopularproductswidgetState();
}

class _PopularproductswidgetState extends State<Popularproductswidget> {

//A Future that will connect the list of popular proucts
late Future<List<Product>> futurePopularproducts;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePopularproducts =ProductController().loadProduct(); 
  } 

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 250,
         width: double.infinity,  
          child: FutureBuilder(
            future: futurePopularproducts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No Products'));
              } else {
                final products = snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero, // Remove grid padding 
                  //physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: products.length, 
             scrollDirection: Axis.horizontal ,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductItemsWidgets(product: product,);
                     },
                );
              }
            },
          ),
        );
  }
}