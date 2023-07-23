import 'package:flutter/material.dart';
import 'package:foryou/core/widget/CustomcircleIconButtom.dart';
import 'package:foryou/features/home/data/product.dart';
import '../widget/rattingRow.dart';

class SaleItem extends StatelessWidget {
  final Product product;

  const SaleItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 4, left: 4),
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
                    child: Image.network(
                      product
                          .thumbnail, // Replace with the actual thumbnail URL
                      width: 162,
                      height: 184,
                      fit: BoxFit.cover,
                    ),
                  ),
                  RatingRow(
                    rating: product.rating.toInt(),
                    ratingNum: 100, // Replace with the actual number of ratings
                    iconSize: 18.00,
                  ),
                  Text(
                    product.brand,
                    style: TextStyle(
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
                          "${product.price}\$", // Replace with the actual price of the product
                          style: TextStyle(
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
    );
  }
}
