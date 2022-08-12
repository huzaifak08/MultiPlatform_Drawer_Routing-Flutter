import 'package:drawer_routing/home.dart';
import 'package:drawer_routing/page1.dart';
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
      home: const Home(),
      routes: {
        homePageRoute: ((context) => Home()),
        page01Route: (context) => Page01(),
      },
    );
  }
}
