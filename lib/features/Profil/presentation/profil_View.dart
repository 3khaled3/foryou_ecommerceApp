import 'package:flutter/material.dart';
import 'package:foryou/features/Profil/presentation/widget/ProfileButtoms.dart';
import '../../../constant.dart';

// ignore: camel_case_types
class ProfilView extends StatelessWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
           
            SafeArea(child: profileButtoms(title: "Payment methods", Suptitle: "Visa  **34",onPressed:(){})),
             profileButtoms(title: "My orders",Suptitle: "Already have 12 orders", onPressed:(){}),
             profileButtoms(title: "Shipping addresses",Suptitle: "3 ddresses", onPressed:(){}),
             profileButtoms(title: "My reviews",Suptitle: "Reviews for 4 items", onPressed:(){}),
             profileButtoms(title: "Settings",Suptitle: " password", onPressed:(){}),
          ],
        ),
      ),
    );
  }
}
