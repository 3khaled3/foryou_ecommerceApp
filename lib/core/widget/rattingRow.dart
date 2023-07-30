// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  final int rating;
  final double iconSize;
  final int ratingNum;

  const RatingRow({
    super.key,
    required this.rating,
    required this.ratingNum,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            if (index < rating) {
              return Icon(
                Icons.star,
                color: const Color(0xffFFBA49),
                size: iconSize,
              );
            } else {
              return Icon(
                Icons.star_border,
                color: const Color(0xffFFBA49),
                size: iconSize,
              );
            }
          }),
        ),
        Text(
          "($ratingNum)",
          style: const TextStyle(
              color: Colors.grey, fontSize: 11, fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
