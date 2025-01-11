import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shopping_app/Model/Category%20model.dart';
import 'package:online_shopping_app/controller/category%20controller.dart';
import 'package:online_shopping_app/view/Screens/Nav%20screens/widget/header_widget.dart';

class Categoryscreen extends StatefulWidget {
  const Categoryscreen({super.key});

  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen> {
  late Future<List<Category>> futureCategories;
  Category? _selectedCategory;

  @override
  void initState() {
    super.initState();
    futureCategories = CategoryController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height),
        child: HeaderWidget(),
      ),
      body: Row(
        children: [
          //Lesft side dispaly Category
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey.shade200,
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
                    return ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final Category = categories[index];
                          return ListTile(
                            title: Text(
                              "${Category.name}",
                              style: GoogleFonts.quicksand(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: _selectedCategory == Category
                                      ? Colors.blue
                                      : Colors.black),
                            ),
                            onTap: () {
                              setState(() {
                                _selectedCategory = Category;
                              });
                            },
                          );
                        });
                  }
                },
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: _selectedCategory != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _selectedCategory!.name,
                          style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.7,
                          ),
                        ),
                      ),
                      Container(height: 150,decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(_selectedCategory!.banner),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        ),
                      ),)
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
