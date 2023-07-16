import 'package:flutter/material.dart';
import 'package:foryou/features/Product/presentation/widget/PeoductappBar.dart';
import 'package:foryou/features/home/presentation/widget/homeCatogrey.dart';
import 'package:foryou/features/home/presentation/widget/titelCatogry.dart';
import '../../../constant.dart';
import 'widget/saleListview.dart';

// ignore: camel_case_types
class productView extends StatelessWidget {
  const productView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: ProductAppBar(onPressed: (){}),
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
              titel: "You can also like this",
              supTitel: "",
              onPressed: () {},
            ),
            saleListView(),
          ],
        ),
      ),
    );
  }
}
