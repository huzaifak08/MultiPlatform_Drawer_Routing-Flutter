import 'dart:ui';

import 'package:flutter/material.dart';

class Page01 extends StatefulWidget {
  const Page01({Key? key}) : super(key: key);

  @override
  State<Page01> createState() => _Page01State();
}

class _Page01State extends State<Page01> {
  final List<String> items =
      List<String>.generate(40, (index) => 'Item ${index + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 01'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            // width: 100,
            child: ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  child: Text(items[index]),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(05)),
                  color: Colors.amber,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
