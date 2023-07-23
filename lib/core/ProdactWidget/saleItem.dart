import 'package:flutter/material.dart';
import 'package:foryou/core/widget/CustomcircleIconButtom.dart';
import '../widget/rattingRow.dart';

class saleItem extends StatelessWidget {
  const saleItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 4, left: 4),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/styles/2.jpg",
                      width: 162,
                      height: 184,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const RatingRow(
                    rating: 2,
                    ratingNum: 100,
                    iconSize: 18.00,
                  ),
                  const Text(
                    "Prand",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                        fontWeight: FontWeight.normal),
                  ),
                  const Text(
                    "Sport Dress",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const Row(
                    children: [
                      // SizedBox(
                      //   height: 16,
                      //   child:
                      // ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      SizedBox(
                        height: 16,
                        child: Text(
                          "16\$",
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
              child: const Center(
                child: Text(
                  "-15%",
                  style: TextStyle(
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
