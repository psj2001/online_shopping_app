import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shopping_app/Model/Category%20model.dart';
import 'package:online_shopping_app/Model/Product%20model.dart';
import 'package:online_shopping_app/Model/subcategory%20model.dart';
import 'package:online_shopping_app/controller/Product%20controller.dart';
import 'package:online_shopping_app/controller/subcategory%20controller.dart';
import 'package:online_shopping_app/view/Screens/Detail%20screen/widget/SubcategoryTitleWidget.dart';
import 'package:online_shopping_app/view/Screens/Detail%20screen/widget/inner%20Banner%20Widget.dart';
import 'package:online_shopping_app/view/Screens/Detail%20screen/widget/inner%20header%20widget.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/widget/product_items_widgets.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/widget/reusable_text_widget.dart';

//Innercategorycontentwidget

class Innercategorycontentwidget extends StatefulWidget {
  final Category category;

  const Innercategorycontentwidget({super.key, required this.category});

  @override
  State<Innercategorycontentwidget> createState() => _InnerCategoryScreenState();
}

class _InnerCategoryScreenState extends State<Innercategorycontentwidget> {
  late Future<List<SubcategoryModel>> _subcategories;
   late Future<List<Product>> _futureproducts;
  final SubCategoryController _subCategoryController = SubCategoryController();
  //const InnerCategoryScreen({super.key});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subcategories = _subCategoryController
        .getSubcategoriesByCategoryName(widget.category.name);
    _futureproducts = ProductController().loadProductByCategory(widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height),
        child: InnerHeaderWidget(),
      ),
      body: Column(
        children: [
          InnerBannerWidget(image: widget.category.banner),
          Center(
            child: Text(
              "Shop by Categories",
              style: GoogleFonts.quando(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                letterSpacing: 1.7,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.zero, // Ensure no additional padding
            margin: EdgeInsets.zero, // Ensure no additional margin
            child: FutureBuilder(
              future: _subcategories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Sub categories'));
                } else {
                  final subcategories = snapshot.data!;
              
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                        children: List.generate(
                            (subcategories.length / 7).ceil(), (setIndex) {
                      //for each row, Calculate the starting and ending indices
                      final start = setIndex * 7;
                      final end = (setIndex + 1) * 7;

                      //Create a padding widget to add spacing around the row
                      return Padding(
                        padding: const EdgeInsets.all(8.9),
                        child: Row(
                          children: subcategories
                              .sublist(
                                  start,
                                  end > subcategories.length
                                      ? subcategories.length
                                      : end)
                              .map((subcategory) => Subcategorytitlewidget(
                               // image: '',
                                image: subcategory.image,
                                  title: subcategory.subCategoryName))
                              .toList(),
                        ),
                      );
                    })),
                  );
                }
              },
            ),
          ),
          ReusableTextWidget(title: 'Popular Product', subtitle: 'View All'),
          SizedBox(
        height: 250,
         width: double.infinity,  
          child: FutureBuilder(
            future: _futureproducts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No Products under this category'));
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
        )
        ],
      ),
    );
  }
}
