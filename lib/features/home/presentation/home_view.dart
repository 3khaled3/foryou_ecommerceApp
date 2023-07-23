import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/features/home/presentation/widget/homeCatogrey.dart';
import 'package:foryou/features/home/presentation/widget/titelCatogry.dart';
import '../../../constant.dart';
import '../../../core/utils/Cubits/cubit/api_cubit.dart';
import 'widget/saleListview.dart';

class homeView extends StatelessWidget {
  const homeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const homeCatogrey(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .03,
          ),
          Expanded(
            child: FutureBuilder<void>(
              future:
                  BlocProvider.of<ApiCubit>(context).fetchcategoriesProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error loading data"),
                  );
                } else {
                  final a =
                      BlocProvider.of<ApiCubit>(context).categoriesProduct;
                  List b = BlocProvider.of<ApiCubit>(context).categories;
                  print(b);

                  return ListView.builder(
                    itemCount: a.length,
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      print("------------------------------${b[index]}");
                      print(BlocProvider.of<ApiCubit>(context)
                          .categoriesProduct["${b[index]}"][1]
                          .title);
                      return Column(
                        children: [
                          titelcatogrey(
                            titel: b[index],
                            onPressed: () async {
                              // print("555555555555555555555");
                              // await BlocProvider.of<ApiCubit>(context).fetchcategoriesImage();
                              // print(BlocProvider.of<ApiCubit>(context).categories);
                            },
                          ),
                          saleListView(
                            products: BlocProvider.of<ApiCubit>(context)
                                .categoriesProduct["${b[index]}"],
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
