// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/constant.dart';
import 'package:foryou/core/utils/Cubits/userCubit/user_cubit.dart';
import 'package:foryou/core/widget/customElevationButtom.dart';
import 'package:foryou/mmmmmm.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import '../../../../core/utils/routes.dart';
import '../../../../core/widget/SnakePar.dart';
import '../../../../core/widget/textbuttom.dart';

// ignore: camel_case_types
class passwoedSettingBottomSheetView extends StatelessWidget {
  passwoedSettingBottomSheetView({
    super.key,
  });
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController repitcurrentPasswordController =
        TextEditingController();

    TextEditingController currentPasswordController = TextEditingController();

    TextEditingController oldPasswordController = TextEditingController();

    String? newPss;
    String? confirmPss;
    var box = Hive.box('myBox');
    return Container(
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(40)),
                width: 60,
                height: 6,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Password Change",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 14,
              ),
              customTextfaildd(
                  labelText: "Old Password",
                  controller: oldPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter current password';
                    } else if (box.get('password') != value) {
                      return 'The password you entered is incorrect';
                    } else {
                      return null;
                    }
                    // Add more custom validation logic here if needed
                  }),
              textbuttom(
                  text: "Forget Your password?",
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kforgetPssView);
                  }),
              customTextfaildd(
                  inithialText: "",
                  labelText: "New Password",
                  controller: currentPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter new password';
                    } else {
                      newPss = value;

                      return null;
                    }
                  }),
              const SizedBox(
                height: 14,
              ),
              customTextfaildd(
                  inithialText: "",
                  labelText: "Repeat New Password",
                  controller: repitcurrentPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter new password again';
                    } else if (newPss != value) {
                      return 'Password does not match';
                    } else {
                      confirmPss = value;

                      return null;
                    }
                  }),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                width: double.infinity,
                child: BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                  return customElevationButtom(
                    text: "SAVE PASSWORD",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await BlocProvider.of<UserCubit>(context)
                            .updataPassword(confirmPss!);
                        print("*********************************");
                        try {
                          final state =
                              BlocProvider.of<UserCubit>(context).state;

                          if (state is Success) {
                            showToastMessage(
                              "Password has been updated",
                              Colors.green,
                            );
                          } else if (state is Error) {
                            final errorMessage = (state).errorMessage;
                            showToastMessage(
                              errorMessage,
                              Colors.red,
                            );
                          }
                        } catch (e) {
                          print("============ ${e.toString()}");
                        }
                      }
                    },
                  );
                }),
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
