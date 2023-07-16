import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class productImage extends StatelessWidget {
  const productImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return productimages(context, ImageSliders);
  }
}

CarouselSlider productimages(BuildContext context, imageSliders) {
  return CarouselSlider(
    items: imageSliders,
    options: CarouselOptions(
        height: MediaQuery.sizeOf(context).height * .5,
        onPageChanged: (index, reason) {}),
  );
}

final List<String> imgList = [
  'assets/styles/1.jpg',
  'assets/styles/2.jpg',
  'assets/styles/3.jpg',
  'assets/styles/4.jpg',
];

final List<Widget> ImageSliders = imgList
    .map((item) => Container(
          child: Image.asset(
            item,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ))
    .toList();
