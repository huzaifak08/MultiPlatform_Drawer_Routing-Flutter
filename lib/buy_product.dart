import 'package:flutter/material.dart';

class BuyProduct extends StatelessWidget {
  var image, description, price;
  BuyProduct(
      {Key? key,
      required this.image,
      required this.description,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add to Cart'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 400,
            // color: Colors.red,
            child: Image.network(image),
          ),
          Text(
            'Product Description',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Transaction Successfull $price Paid')));
              Navigator.of(context).pop();
            },
            child: Text('Buy $price'),
          )
        ],
      ),
    );
  }
}
