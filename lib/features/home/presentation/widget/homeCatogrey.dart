import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:foryou/core/utils/indicator.dart';
import 'package:image_card/image_card.dart';

class HomeCategory extends StatelessWidget {
  final List categorieslist;
  final Map categoriesProductmap;
  const HomeCategory({
    super.key,
    required this.categorieslist,
    required this.categoriesProductmap,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [];
    for (var i = 0; i < categorieslist.length; i++) {
      items.add(homeCard(
        categoriesProductmap: categoriesProductmap,
        categorieslist: categorieslist,
        i: i,
      ));
    }

    return SafeArea(
      child: CarouselSlider(
        items: items,
        options: CarouselOptions(
          autoPlay: true,
          height: MediaQuery.of(context).size.height * .29,
          onPageChanged: (index, reason) {},
        ),
      ),
    );
  }
}

class homeCard extends StatelessWidget {
  const homeCard({
    super.key,
    required this.categoriesProductmap,
    required this.categorieslist,
    required this.i,
  });

  final Map categoriesProductmap;
  final List categorieslist;
  final int i;

  @override
  Widget build(BuildContext context) {
    if (!categoriesProductmap.containsKey(categorieslist[i])) {
      return buildCircleIndicator();
    }

    return TransparentImageCard(
      height: MediaQuery.of(context).size.height * .29,
      width: MediaQuery.of(context).size.width,
      imageProvider: CachedNetworkImageProvider(
          categoriesProductmap["${categorieslist[i]}"][0].thumbnail),
      title: Text(
        categorieslist[i],
        style: const TextStyle(
          color: Color.fromARGB(0, 255, 255, 255),
          fontWeight: FontWeight.bold,
          fontSize: 34,
        ),
      ),
      description: Text(
        categorieslist[i],
        style: const TextStyle(
          color: Color.fromARGB(0, 255, 255, 255),
          fontWeight: FontWeight.bold,
          fontSize: 34,
        ),
      ),
      footer: Text(
        categorieslist[i],
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 34,
        ),
      ),
    );
  }
}
