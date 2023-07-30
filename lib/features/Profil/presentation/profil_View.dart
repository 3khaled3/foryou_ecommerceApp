// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/userCubit/user_cubit.dart';
import 'package:foryou/core/utils/routes.dart';
import 'package:go_router/go_router.dart';
import '../../../constant.dart';
import '../../../core/widget/SnakePar.dart';
import 'widget/ProfileAppBar.dart';
import 'widget/ProfileButtoms.dart';
import 'widget/ProfileInfo.dart';

// ignore: camel_case_types
class ProfilView extends StatelessWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PeofileAppBar(onPressed: () async {
        await BlocProvider.of<UserCubit>(context).signOut();
        final state = BlocProvider.of<UserCubit>(context).state;
        if (state is Success) {
          GoRouter.of(context).pushReplacement(AppRouter.kregisterView);
        } else if (state is Error) {
          final errorMessage = (state).errorMessage;
          showToastMessage(errorMessage, Colors.red);
        }
      }),
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
