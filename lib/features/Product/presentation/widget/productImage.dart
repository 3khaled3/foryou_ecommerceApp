// ignore_for_file: file_names, camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../constant.dart';
import '../../../../core/utils/indicator.dart';

class productImage extends StatelessWidget {
  final List<String> images;

  const productImage({
    required this.images,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final List<Widget> ImageSliders = images
        .map((item) => Container(color:Colors.grey[200] ,
          child: CachedNetworkImage(
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
                imageUrl: item,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    buildCircleIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
        ))
        .toList();

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
