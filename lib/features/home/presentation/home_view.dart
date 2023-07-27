import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/Apicubit/api_cubit.dart';
import 'package:foryou/core/utils/indicator.dart';
import 'package:foryou/features/home/presentation/widget/homeCatogrey.dart';
import 'package:foryou/features/home/presentation/widget/titelCatogry.dart';
import '../../../constant.dart';
import 'widget/saleListview.dart';

// ignore: camel_case_types
class homeView extends StatelessWidget {
  const homeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
            final categoriesProductmap =
                BlocProvider.of<ApiCubit>(context).categoriesProduct;
            List categorieslist = BlocProvider.of<ApiCubit>(context).categories;
            if (categoriesProductmap.isEmpty||categorieslist.isEmpty) {
      // Return a placeholder or an empty container, or handle the situation accordingly
      return Indicator();
    }else 
            
            return Scaffold(
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
             
                            },
                          ),
                          saleListView(
                            products: categoriesProductmap[
                                "${categorieslist[index]}"],
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
        }
        // );
//   }
// }
