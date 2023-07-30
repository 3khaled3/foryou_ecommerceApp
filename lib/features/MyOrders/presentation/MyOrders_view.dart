// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:foryou/features/MyOrders/presentation/widget/MyOrdersAppBar.dart';

import '../../../constant.dart';
import 'widget/BuildTapBar.dart';

// ignore: camel_case_types
class MyOrdersView extends StatelessWidget {
  const MyOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyOrdersAppBar(onPressed: () {}),
      backgroundColor: kPrimaryColor,
      body: const Column(
        children: [Expanded(child: BuildTabBar())],
      ),
    );
  }
}
