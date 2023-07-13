import 'package:flutter/material.dart';
import 'package:foryou/features/home/presentation/widget/homeCatogrey.dart';
import 'package:foryou/features/home/presentation/widget/titelCatogry.dart';
import '../../../constant.dart';
import 'widget/saleListview.dart';

// ignore: camel_case_types
class homeView extends StatelessWidget {
  const homeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const homeCatogrey(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .03,
            ),
            titelcatogrey(
              titel: "Sale",
              supTitel: "Super summer sale",
              onPressed: () {},
            ),
            saleListView(),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
