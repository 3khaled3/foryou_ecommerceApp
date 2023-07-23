// ignore_for_file: file_names
import 'package:foryou/core/ProdactWidget/saleItem.dart';
import '../../../constant.dart';
import 'widget/CategorieFindAppBar.dart';
import 'package:flutter/material.dart';
import 'widget/FilterAndSortRow.dart';
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
            const FilterAndSortRow(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    mainAxisExtent: 300,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  // return SaleItem();
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
