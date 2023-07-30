// ignore_for_file: file_names, camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:foryou/core/utils/indicator.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/routes.dart';

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

    return GestureDetector(
        onTap: () {
          GoRouter.of(context)
              .push(AppRouter.kallproductsView, extra: categorieslist[i]);
        },
        child: Container(
            height: MediaQuery.of(context).size.height * 0.29,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: CachedNetworkImage(
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              buildCircleIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageUrl: categoriesProductmap["${categorieslist[i]}"][0]
                          .thumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.29,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff575757).withOpacity(0),
                          const Color(0xff000000),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: const SizedBox(
                        height: double.infinity, width: double.infinity),
                  ),
                ),
                Positioned.fill(
                  left: 20,
                  top: MediaQuery.of(context).size.height * 0.22,
                  child: Text(
                    categorieslist[i],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                )
              ],
            )));
  }
}
