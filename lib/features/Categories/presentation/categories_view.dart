import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/Apicubit/api_cubit.dart';
import 'package:foryou/core/utils/routes.dart';
import 'package:go_router/go_router.dart';
import '../../../constant.dart';
import '../../../core/widget/customElevationButtom.dart';
import 'widget/CategoriesListView.dart';
import 'widget/appbar.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
            
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
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kallproductsView,extra: "All");
                  },
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
}
