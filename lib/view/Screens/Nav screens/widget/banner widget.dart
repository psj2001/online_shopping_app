import 'package:flutter/material.dart';
import 'package:online_shopping_app/Model/Banner%20model.dart';

import '../../../../controller/Banner Controller.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {

  //A Future that will hold the list of banner from the  API
  late Future<List<BannerModel>> futureBanners;

    @override
  void initState() {
    super.initState();
    futureBanners = BannerController().loadBanners();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          //color: Color(0xFFF7F7F7F),
          borderRadius: BorderRadius.circular(4)
        ),
        width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: futureBanners,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No Banners'),
            );
          } else {
            final banners = snapshot.data!; 
            return PageView.builder(
            
              itemBuilder: (BuildContext context, int index) {
                final banner = banners[index];
                return Image.network(
                  banner.image,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high
                  );
              },
              itemCount: banners.length,
            );
          }
        }),),
    );
  }
}
