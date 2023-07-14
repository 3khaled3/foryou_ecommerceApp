import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import '../../../constant.dart';
import '../../../core/widget/customElevationButtom.dart';
import 'widget/CategorieFindAppBar.dart';
import 'widget/tabstogel.dart';

class CategoriesFindView extends StatelessWidget {
  const CategoriesFindView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: CategorieFindAppBar(),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [tabstogel()],
        ),
      ),
    );
  }
}
