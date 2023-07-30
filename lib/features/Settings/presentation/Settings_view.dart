// ignore_for_file: file_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/userCubit/user_cubit.dart';
import 'package:foryou/features/Settings/presentation/widget/PasswordSettings.dart';
import '../../../constant.dart';
import '../../../core/widget/BottomSheet.dart';
import 'widget/favoriteViewAppBar.dart';
import 'package:flutter/material.dart';
import 'widget/nameSetting.dart';
import 'widget/Buttom.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: settingsViewAppBar(),
        body: Column(
          children: [
            SettingsButtoms(
                title: "Personal Information",
                Suptitle: "Name, Date of Birth",
                onPressed: () {
                  showbottomSheet(
                      context: context,
                      widget: nameSettingBottomSheetView());
                }),
            SettingsButtoms(
                title: "Password",
                Suptitle: "Password Setting",
                onPressed: () {
                  showbottomSheet(
                      context: context,
                      widget: passwoedSettingBottomSheetView());
                }),
          ],
        ));
  }
}
