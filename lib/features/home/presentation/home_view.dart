import 'package:flutter/material.dart';
import 'package:foryou/core/widget/rattingRow.dart';
import 'package:foryou/features/home/presentation/widget/homeCatogrey.dart';
import 'package:foryou/features/home/presentation/widget/titelCatogry.dart';
import '../../../constant.dart';

// ignore: camel_case_types
class homeView extends StatelessWidget {
  const homeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const homeCatogrey(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .03,
            ),
            titelcatogrey(
              titel: "Sale",
              supTitel: "Super summer sale",
              onPressed: () {},
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 260,
                    width: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/styles/2.jpg",
                                    height: 184,
                                  ),
                                  RatingRow(
                                    rating: 2,
                                    ratingNum: 22,
                                    iconSize: 16.00,
                                    starColor: Color(0xffFFBA49),
                                  )
                                ],
                              ),
                            ),
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
