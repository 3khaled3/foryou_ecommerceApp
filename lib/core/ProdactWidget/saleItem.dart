// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:foryou/core/utils/indicator.dart';
import 'package:foryou/core/utils/routes.dart';
import 'package:foryou/core/widget/CustomcircleIconButtom.dart';
import 'package:foryou/features/home/data/product.dart';
import 'package:go_router/go_router.dart';
import '../widget/rattingRow.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SaleItem extends StatelessWidget {
  final Product product;

  const SaleItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 4, left: 4),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kproductView, extra: product);
        },
        child: Stack(
          children: [
            Container(
              width: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 162,
                      height: 184,
                      imageUrl: product.thumbnail,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              buildCircleIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )),
                    RatingRow(
                      rating: product.rating.toInt(),
                      ratingNum: product.stock,
                      iconSize: 18.00,
                    ),
                    Text(
                      product.brand,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 16,
                          child: Text(
                            "${product.price}\$",
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                left: 131,
                height: 370,
                child: circleIconButtom(
                    icon: Icons.favorite_border_rounded, onTap: () {})),
            Positioned(
              left: 13,
              top: 13,
              child: Container(
                width: 40,
                height: 24,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "-${product.discountPercentage.toInt()}%",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
