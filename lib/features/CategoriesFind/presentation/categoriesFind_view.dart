// ignore_for_file: file_names

import '../../../constant.dart';
import 'widget/CategorieFindAppBar.dart';
import 'package:flutter/material.dart';
import 'widget/tabstogel.dart';

class CategoriesFindView extends StatelessWidget {
  const CategoriesFindView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: CategorieFindAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const tabstogel(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.filter_list, color: Colors.black),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Filters",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11)),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    child: const Row(
                      children: [
                        Icon(Icons.swap_vert_sharp, color: Colors.black),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Filters",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
