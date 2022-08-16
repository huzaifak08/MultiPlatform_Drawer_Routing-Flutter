import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:async';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider({Key? key, required this.JImage}) : super(key: key);

  final JImage;

  @override
  State<ImageSlider> createState() => _ImageSliderState(JImage: JImage);
}

class _ImageSliderState extends State<ImageSlider> {
  _ImageSliderState({Key? key, required this.JImage});

  final JImage;
  int activeIndex = 0;

  final urlImages = [
    'https://images.priceoye.pk/apple-iphone-13-pro-max-pakistan-priceoye-qgwvt.jpg',
    'https://static-01.daraz.pk/p/c910b4b1e5342c62ba6955e9df34a0e0.png',
    'https://leronza.com/wp-content/uploads/2021/07/leronza-24k-gold-iphone-13-pro-elite-1.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Slider'),
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: JImage.length,
              options: CarouselOptions(
                height: 400,
                // autoPlay: true,
                // autoPlayInterval: Duration(seconds: 5),
                // reverse: true,
                // viewportFraction: 1,  // show only one image at a time
                enlargeCenterPage:
                    true, // The current image will slighty become bigger than others.
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                pageSnapping:
                    true, // scroll with  fingers manually (recommended -> true)
                enableInfiniteScroll: false,

                // For dots:
                onPageChanged: (index, reason) => setState(() {
                  activeIndex = index;
                }),
              ),
              itemBuilder: (context, index, realIndex) {
                // final urlImage = urlImages[index];

                return Container(
                  // color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Image.network(
                    JImage.toString(),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            AnimatedSmoothIndicator(
                activeIndex: activeIndex, count: JImage.length)
          ],
        ),
      ),
    );
  }
}
