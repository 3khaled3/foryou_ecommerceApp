// ignore_for_file: file_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/ProdactWidget/Bagitem.dart';
import 'package:foryou/core/utils/Cubits/BagCubit/bag_cubit.dart';
import 'package:foryou/features/Bag/presentation/widget/checkoutPronoCode.dart';
import '../../../constant.dart';
import '../../../core/widget/Animate.dart';
import 'widget/BagViewAppBar.dart';
import 'package:flutter/material.dart';

class BagView extends StatelessWidget {
  const BagView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagCubit, BagState>(builder: (context, state) {
      return FutureBuilder(
          future: BlocProvider.of<BagCubit>(context).getBag(context),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const animate(text: " ", image:"assets/animation_shop.json");
            } else {
              final bagList = BlocProvider.of<BagCubit>(context).bagList;
              double? price = 0;
              for (var i = 0; i < bagList.length; i++) {
                price = (price! +
                        (bagList[i]["product"].price) * (bagList[i]["qu"]));
              }
              return Scaffold(
                backgroundColor: kPrimaryColor,
                appBar: BagViewAppBar(),
                body:bagList.isEmpty? const animate(text: 'Bag is Empty',image: "assets/animation_lknfp4bn.json",): Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: bagList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: BagItem(
                                plusonTap: () async {
                                  await BlocProvider.of<BagCubit>(context)
                                      .plus(bagList[index]["product"].id);
                                },
                                minusonTap: () async {
                                  await BlocProvider.of<BagCubit>(context)
                                      .minus(bagList[index]["product"].id);
                                },
                                delonTap: () async {
                                  await BlocProvider.of<BagCubit>(context)
                                      .del(bagList[index]["product"].id);
                                },
                                item: bagList[index]),
                          );
                        },
                      ),
                    ),
                    checkoutPronoCode(prices: price!),
                  ],
                ),
                //
              );
            }
          });
    });
  }
}
