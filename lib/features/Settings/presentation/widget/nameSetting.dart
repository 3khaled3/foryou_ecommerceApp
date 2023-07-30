// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/constant.dart';
import 'package:foryou/core/utils/Cubits/userCubit/user_cubit.dart';
import 'package:foryou/core/widget/customElevationButtom.dart';
import 'package:foryou/mmmmmm.dart';

import '../../../../core/widget/SnakePar.dart';

// ignore: camel_case_types
class nameSettingBottomSheetView extends StatelessWidget {
   nameSettingBottomSheetView({super.key});
final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController FullnameController = TextEditingController();
    
    String? newusername;
    return Container(
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
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
                "Personal Information",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 14,
              ),
              customTextfaildd(
                labelText: "Full name",
                controller: FullnameController,
                inithialText:
                    "${FirebaseAuth.instance.currentUser!.displayName}",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter new username';
                  } else {
                    newusername = value;

                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                  width: double.infinity,
                  child: BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      return customElevationButtom(
                        text: "SAVE",
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await BlocProvider.of<UserCubit>(context)
                                .updateDisplayName(newusername!);
                            // final state =
                            //     BlocProvider.of<UserCubit>(context).state;
                            if (state is Success) {
                              showToastMessage(
                                "Username has been updated",
                                Colors.green,
                              );
                            } else if (state is Error) {
                              final errorMessage = (state).errorMessage;
                              showToastMessage(errorMessage, Colors.red);
                            }
                          }
                        });
                    },
                  )),
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
