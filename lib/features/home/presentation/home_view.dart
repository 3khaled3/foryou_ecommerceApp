import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/features/home/presentation/widget/homeCatogrey.dart';
import 'package:foryou/features/home/presentation/widget/titelCatogry.dart';
import 'package:shimmer/shimmer.dart';
import '../../../constant.dart';
import '../../../core/utils/Cubits/cubit/api_cubit.dart';
import 'widget/saleListview.dart';

// ignore: camel_case_types
class homeView extends StatelessWidget {
  const homeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 return   FutureBuilder<void>(
        future: BlocProvider.of<ApiCubit>(context).fetchcategoriesProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey,
                child: Scaffold());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error loading data"),
            );
          } else {
    final categoriesProductmap =
        BlocProvider.of<ApiCubit>(context).categoriesProduct;
    List categorieslist = BlocProvider.of<ApiCubit>(context).categories;
    return  Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          HomeCategory(
              categoriesProductmap: categoriesProductmap,
              categorieslist: categorieslist),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .03,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categoriesProductmap.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  titelcatogrey(
                    titel: categorieslist[index],
                    onPressed: () async {
                      // print("555555555555555555555");
                      // await BlocProvider.of<ApiCubit>(context).fetchcategoriesImage();
                      // print(BlocProvider.of<ApiCubit>(context).categories);
                    },
                  ),
                  saleListView(
                    products: categoriesProductmap["${categorieslist[index]}"],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .01,
                  ),
                ],
              );
            },
          )
        ]),
      ),
    );
  }
});}}
