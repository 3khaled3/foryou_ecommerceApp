// ignore_for_file: file_names
import 'package:foryou/core/ProdactWidget/Bagitem.dart';
import 'package:foryou/features/Bag/presentation/widget/checkoutPronoCode.dart';
import '../../../constant.dart';
import 'widget/BagViewAppBar.dart';
import 'package:flutter/material.dart';

class BagView extends StatelessWidget {
  const BagView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: BagViewAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: BagItem(),
                );
              },
            ),
          ),
          checkoutPronoCode(),
        ],
      ),
      //
    );
  }
}
