// ignore_for_file: file_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/userCubit/user_cubit.dart';
import 'package:foryou/features/Settings/presentation/widget/PasswordSettings.dart';
import 'package:go_router/go_router.dart';
import '../../../constant.dart';
import '../../../core/utils/indicator.dart';
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
        appBar: settingsViewAppBar(
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        body: Column(
          children: [
            SettingsButtoms(
                title: "Personal Information",
                Suptitle: "Edit user name",
                onPressed: () {
                  showbottomSheet(
                      context: context,
                      widget: BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                        {
                          if (state is Waitting) {
                            return buildCircleIndicator();
                          } else {
                            return nameSettingBottomSheetView();
                          }
                        }
                      }));
                }),
            SettingsButtoms(
                title: "Password",
                Suptitle: "Password Setting",
                onPressed: () {
                  showbottomSheet(
                      context: context,
                      widget: BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                        {
                          if (state is Waitting) {
                            return buildCircleIndicator();
                          } else {
                            return passwoedSettingBottomSheetView();
                          }
                        }
                      }));
                }),
          ],
        ));
  }
}
