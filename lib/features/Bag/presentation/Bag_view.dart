// ignore_for_file: file_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/ProdactWidget/Bagitem.dart';
import 'package:foryou/core/utils/Cubits/BagCubit/bag_cubit.dart';
import 'package:foryou/core/utils/indicator.dart';
import 'package:foryou/features/Bag/presentation/widget/checkoutPronoCode.dart';
import '../../../constant.dart';
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
              return buildCircleIndicator();
            } else {
              final bagList = BlocProvider.of<BagCubit>(context).bagList;
              print(
                  "*********************************************************************");
              return Scaffold(
                backgroundColor: kPrimaryColor,
                appBar: BagViewAppBar(),
                body: Column(
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
                                minusonTap: () {},
                                delonTap: () {},
                                item: bagList[index]),
                          );
                        },
                      ),
                    ),
                    const checkoutPronoCode(),
                  ],
                ),
                //
              );
            }
          });
    });
  }
}
