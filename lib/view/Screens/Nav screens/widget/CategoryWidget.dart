import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shopping_app/Model/Category%20model.dart';
import 'package:online_shopping_app/controller/category%20controller.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/widget/reusable_text_widget.dart';

class Categorywidget extends StatefulWidget {
  const Categorywidget({super.key});

  @override
  State<Categorywidget> createState() => _CategorywidgetState();
}

class _CategorywidgetState extends State<Categorywidget> {
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = CategoryController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReusableTextWidget(title: "Categories", subtitle: "View all"),
        Container(
          padding: EdgeInsets.zero, // Ensure no additional padding
          margin: EdgeInsets.zero, // Ensure no additional margin
          child: FutureBuilder(
            future: futureCategories,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No Categories'));
              } else {
                final categories = snapshot.data!;
                return GridView.builder(
                  padding: EdgeInsets.zero, // Remove grid padding
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Container(
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center content
                        children: [
                          Image.network(
                            category.image,
                            height: 47,
                            width: 47,
                          ),
                          Text(
                            category.name,
                            style:
                                GoogleFonts.quicksand(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
