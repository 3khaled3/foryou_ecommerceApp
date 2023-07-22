// ignore_for_file: unused_import, use_build_context_synchronously, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/userCubit/user_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../constant.dart';
import '../../../core/utils/indicator.dart';
import '../../../core/widget/SnakePar.dart';
import '../../../core/widget/arrowAppBar.dart';
import '../../../core/widget/customElevationButtom.dart';
import '../../../core/widget/customTextFaild.dart';
import '../../../core/widget/headertext.dart';
import '../../../mmmmmm.dart';

// ignore: camel_case_types
class forgetPssView extends StatelessWidget {
  const forgetPssView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> Kform = GlobalKey();
    TextEditingController passwordController = TextEditingController();
    var email;
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      return state is Waitting
          ? const Indicator()
          : Scaffold(
              backgroundColor: kPrimaryColor,
              appBar: arrowappbar(onPressed: () {
                GoRouter.of(context).pop();
              }),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: Kform,
                    child: Column(
                      children: [
                        headerText(titel: "Forgot pssword"),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .15,
                        ),
                        const Text(
                            " Please, enter your email address. You will receive a link to create a new password via email."),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 25),
                          child: customTextfaildd(
                            labelText: "Email",
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Email';
                              } else {
                                email = value;
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: customElevationButtom(
                              text: "SEND",
                              onPressed: () async {
                                if (Kform.currentState!.validate()) {
                                  await BlocProvider.of<UserCubit>(context)
                                      .forgetPassword(email);

                                  final state =
                                      BlocProvider.of<UserCubit>(context).state;

                                  if (state is Success) {
                                    showSnackbarMessage(
                                      context,
                                      "Check your mail and resrt password ",
                                      Colors.green,
                                    );
                                  } else if (state is Error) {
                                    final errorMessage = (state).errorMessage;
                                    showSnackbarMessage(
                                        context, errorMessage, Colors.red);
                                  }
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }
}
