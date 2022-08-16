import 'package:drawer_routing/buy_product.dart';
import 'package:drawer_routing/info_page.dart';
import 'package:drawer_routing/home_page.dart';
import 'package:drawer_routing/product_image_slider.dart';
import 'package:drawer_routing/product_page.dart';
import 'package:drawer_routing/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,

        // Just for IOS
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS
            ? Colors.blueAccent
            : null,
      ),
      home: Home(),
      routes: {
        homePageRoute: ((context) => Home()),
        productPageRoute: (context) => ProductPage(),
        infoPageRoute: (context) => Information(),
        // imageSliderRoute: (context) => ImageSlider()
      },
    );
  }
}
