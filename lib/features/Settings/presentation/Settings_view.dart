// ignore_for_file: file_names
import 'package:foryou/core/ProdactWidget/saleItem.dart';
import '../../../constant.dart';
import 'widget/favoriteViewAppBar.dart';
import 'package:flutter/material.dart';
import 'widget/FilterAndSortRow.dart';
import 'widget/Buttom.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: FavoriteViewAppBar(),
      body: Column(
      children: [
SettingsButtoms(title: "Personal Information", Suptitle: "Name, Date of Birth", onPressed: (){}),
SettingsButtoms(title: "Password", Suptitle: "Password Setting", onPressed: (){}),
      ],
    )
    );
  }
}
