import 'package:flutter/material.dart';
import 'package:foryou/features/MyOrders/presentation/widget/BuildTapBar.dart';
import '../../../constant.dart';


// ignore: camel_case_types
class MyOrdersView extends StatelessWidget {
  const MyOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .03,
            ),
            BuildTabBar()
            
          ],
        ),
      ),
    );
  }
}
