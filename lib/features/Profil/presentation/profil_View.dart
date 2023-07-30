import 'package:flutter/material.dart';
import 'package:foryou/core/utils/routes.dart';
import 'package:go_router/go_router.dart';
import '../../../constant.dart';
import 'widget/ProfileAppBar.dart';
import 'widget/ProfileButtoms.dart';
import 'widget/ProfileInfo.dart';

// ignore: camel_case_types
class ProfilView extends StatelessWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PeofileAppBar(onPressed: () {}),
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const UserInformation(),
            profileButtoms(
                title: "My orders",
                Suptitle: "Already have 12 orders",
                onPressed: () {}),
            profileButtoms(
                title: "Shipping addresses",
                Suptitle: "3 ddresses",
                onPressed: () {}),
            profileButtoms(
                title: "Payment methods",
                Suptitle: "Visa  **34",
                onPressed: () {}),
            profileButtoms(
                title: "My reviews",
                Suptitle: "Reviews for 4 items",
                onPressed: () {}),
            profileButtoms(
                title: "Settings",
                Suptitle: " password & UserName",
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSettingsView);
                }),
          ],
        ),
      ),
    );
  }
}
