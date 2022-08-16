import 'package:drawer_routing/product_image_slider.dart';
import 'package:drawer_routing/product_page.dart';
import 'package:drawer_routing/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class BuyProduct extends StatelessWidget {
  var name, image, description, price;
  final JImage;

  BuyProduct({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.JImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Link Buttons:
    TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 15);
    TextStyle linkStyle = TextStyle(
        color: Colors.blue, fontSize: 15, decoration: TextDecoration.underline);

    // Yes Button for Alert Dialog:
    Widget yesButton = TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Transaction Successfull, $price \$ Paid')));
          Navigator.of(context).popAndPushNamed(productPageRoute);
        },
        child: Text('OK'));

    // Cancel Button For Alert Dialog:
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Cancel'));

    return Scaffold(
      appBar: AppBar(
        title: Text('Add to Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            RichText(
              text: TextSpan(
                style: defaultStyle,
                children: <TextSpan>[
                  TextSpan(text: 'Want to see more photos?'),
                  TextSpan(
                      text: ' Click Here',
                      style: linkStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Click Here Clicked');

                          // Navigator.of(context)
                          //     .popAndPushNamed(imageSliderRoute);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageSlider(
                                  JImage: JImage,
                                ),
                              ));
                        })
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Alert Dialog:
                AlertDialog alert = AlertDialog(
                  title: Text('Transaction Confirmation!'),
                  content: Text('Are you sure you want to Pay to buy $name?'),
                  actions: [cancelButton, yesButton],
                );

                showDialog(
                  context: context,
                  builder: (context) => alert,
                );

                // Navigator.of(context).pop();
              },
              child: Text('Buy Product $price \$'),
            )
          ],
        ),
      ),
    );
  }
}
