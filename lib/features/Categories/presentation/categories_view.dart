import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/Apicubit/api_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../constant.dart';
import '../../../core/widget/customElevationButtom.dart';
import 'widget/CategoriesListView.dart';
import 'widget/appbar.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return FutureBuilder<void>(
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
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: Categoriesappbar(onPressed: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: customElevationButtom(
                  text: "VIEW ALL ITEMS",
                  onPressed: () {},
                ),
              ),
               CategoriesListView(  categoriesProductmap: categoriesProductmap,
              categorieslist: categorieslist),
            ],
          ),
        ),
      ),
    );
  }
});}}
