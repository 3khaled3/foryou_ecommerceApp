import 'package:flutter/material.dart';
import '../../../constant.dart';
import '../../../core/widget/customElevationButtom.dart';


class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      // appBar:,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: customElevationButtom(
                  text: "VIEW ALL ITEMS",
                  onPressed: () {},
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}

