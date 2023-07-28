// ignore_for_file: file_names
import '../../../constant.dart';
import 'widget/favoriteViewAppBar.dart';
import 'package:flutter/material.dart';
import 'widget/FilterAndSortRow.dart';
import 'widget/tabstogel.dart';

class favoriteView extends StatelessWidget {
  const favoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: FavoriteViewAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const tabstogel(),
            const FilterAndSortRow(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    mainAxisExtent: 285,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  // return saleItem();
                  //
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
