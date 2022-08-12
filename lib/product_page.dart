import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page01 extends StatefulWidget {
  const Page01({Key? key}) : super(key: key);

  @override
  State<Page01> createState() => _Page01State();
}

class _Page01State extends State<Page01> {
  final List<String> items =
      List<String>.generate(40, (index) => 'Item ${index + 1}');

  List data = [];

  Future<String> loadJSONData() async {
    var jsonText = await rootBundle.loadString('assets/shop.json');
    setState(() {
      data = json.decode(jsonText);
    });
    return 'Success';
  }

  @override
  void initState() {
    super.initState();
    this.loadJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 01'),
      ),
      body: Column(
        children: [
          Container(
            height: 180,
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var name = data[index]['name'];
                var model = data[index]['model'];
                var location = data[index]['location'];
                var image = data[index]['image'];
                return Card(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        child: Image.network(image),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(name),
                            Text(model),
                            Text(location),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 530,
            // color: Colors.red,
            // height: double.infinity,
            // width: 100,
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                var name = data[index]['name'];
                var model = data[index]['model'];
                var location = data[index]['location'];
                var image = data[index]['image'];
                return Container(
                  // color: Color.fromRGBO(255, 235, 59, 1),
                  height: 80,
                  child: Card(
                    child: ListTile(
                      leading: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                      title: Text(name),
                      subtitle: Text(model),
                      trailing: Text(location),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
