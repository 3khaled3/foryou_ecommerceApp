// ignore_for_file: file_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/ProdactWidget/saleItem.dart';
import 'package:foryou/core/utils/Cubits/FavCubit/fav_cubit.dart';
import 'package:foryou/core/widget/Animate.dart';
import '../../../constant.dart';
import '../../../core/utils/indicator.dart';
import 'widget/favoriteViewAppBar.dart';
import 'package:flutter/material.dart';
import 'widget/FilterAndSortRow.dart';
import 'widget/tabstogel.dart';

// ignore: camel_case_types
class favoriteView extends StatelessWidget {
  const favoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(builder: (context, state) {
      context.read<FavCubit>().updatafavList(context);
      return state is Waitting
          ? buildCircleIndicator()
          : Scaffold(
              backgroundColor: kPrimaryColor,
              appBar: FavoriteViewAppBar(),
              body: context.read<FavCubit>().favList.isEmpty
                  ? const animate(
                      text: 'Favourites is Empty',
                      image: "assets/animat.json",
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const tabstogel(),
                          const FilterAndSortRow(),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 250,
                                      mainAxisExtent: 285,
                                      childAspectRatio: 3 / 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  context.read<FavCubit>().favList.length,
                              itemBuilder: (context, index) {
                                return SaleItem(
                                    product: context
                                        .read<FavCubit>()
                                        .favList[index]["product"]);
                                //
                              },
                            ),
                          )
                        ],
                      ),
                    ),
            );
    });
  }
}
