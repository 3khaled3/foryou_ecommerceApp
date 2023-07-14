// ignore_for_file: file_names

import 'package:foryou/features/CategoriesFind/presentation/widget/FilterBottomsheetview.dart';
import 'package:foryou/features/CategoriesFind/presentation/widget/SortButtomSheet.dart';

import '../../../constant.dart';
import 'widget/BottomSheet.dart';
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
                    onTap: () {
                      showbottomSheet(
                          context: context, widget: filterBottomSheetView());
                    },
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
                  child: GestureDetector(onTap: () {
                    
                     showbottomSheet(
                          context: context, widget: sortBottomSheetView());
                  },
                    child: const Row(
                      children: [
                        Icon(Icons.swap_vert_sharp, color: Colors.black),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Sort",
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
