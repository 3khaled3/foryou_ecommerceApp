// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/ProdactWidget/saleItem.dart';
import 'package:foryou/features/home/data/product.dart';
import 'package:go_router/go_router.dart';
import '../../../constant.dart';
import '../../../core/utils/Cubits/Apicubit/api_cubit.dart';
import 'widget/CategorieFindAppBar.dart';
import 'package:flutter/material.dart';
import 'widget/FilterAndSortRow.dart';
import 'widget/tabstogel.dart';

class CategoriesFindView extends StatelessWidget {
  final String Categorie;
  const CategoriesFindView({Key? key, required this.Categorie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesProductmap =
        BlocProvider.of<ApiCubit>(context).categoriesProduct;
    List categorieslist = BlocProvider.of<ApiCubit>(context).categories;

    List<Product> productlist = [];
    int initial = 0;
    for (var i = 0; i < categoriesProductmap.length; i++) {
      if ("${categorieslist[i]}" == Categorie) {
        initial = i + 1;
        for (var x = 0;
            x < categoriesProductmap["${categorieslist[i]}"].length;
            x++) {
          productlist.add(categoriesProductmap["${categorieslist[i]}"][x]);
        }
      }
    }

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: CategorieFindAppBar(
          titel: Categorie,
          ontapArrow: () {
            GoRouter.of(context).pop();
          }),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            tabstogel(initial: initial),
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
                itemCount: productlist.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      height: 290,
                      width: 170,
                      child: SaleItem(product: productlist[index]));
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
