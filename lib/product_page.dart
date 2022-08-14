import 'dart:async' show Future;
import 'dart:convert';

import 'package:drawer_routing/buy_product.dart';
import 'package:drawer_routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
        title: Text('Products'),
      ),
      body: Column(
        children: [
          Container(
            height: 210,
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var name = data[index]['name'];
                var model = data[index]['model'];
                var location = data[index]['location'];
                var image = data[index]['image'];
                var description = data[index]['description'];
                var price = data[index]['price'];
                return Card(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        child: Image.network(image),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(name),
                          Text(model),
                          Text(location),
                          // Divider(
                          //   thickness: 10,
                          //   color: Colors.black,
                          // ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BuyProduct(
                                            image: image,
                                            description: description,
                                            price: price,
                                          )));
                            },
                            child: Text('$price \$'),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 500,
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
                var description = data[index]['description'];
                var price = data[index]['price'];
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
                      // trailing: Text(location),
                      trailing: Text(
                        "${price} \$",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BuyProduct(
                                      image: image,
                                      description: description,
                                      price: price,
                                    )));
                      },
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
