// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'CategorieItem.dart';

class CategoriesListView extends StatelessWidget {
  final List categorieslist;
  final Map categoriesProductmap;
  const CategoriesListView(
      {super.key,
      required this.categorieslist,
      required this.categoriesProductmap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categoriesProductmap.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: CategorieItem(
            imageUrl:
                categoriesProductmap["${categorieslist[index]}"][1].thumbnail,
            Categorie: categorieslist[index],
          ),
        );
      },
    );
  }
}
