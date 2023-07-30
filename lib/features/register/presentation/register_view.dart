// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/userCubit/user_cubit.dart';
import 'package:foryou/core/utils/indicator.dart';
import 'package:foryou/core/widget/SnakePar.dart';
import 'package:go_router/go_router.dart';
import '../../../constant.dart';
import '../../../core/utils/routes.dart';
import '../../../core/widget/arrowAppBar.dart';
import '../../../core/widget/customElevationButtom.dart';
import '../../../core/widget/customTextFaild.dart';
import '../../../core/widget/googlebuttom.dart';
import '../../../core/widget/headertext.dart';
import '../../../core/widget/textbuttom.dart';
import '../../../mmmmmm.dart';

// ignore: camel_case_types
class registerView extends StatelessWidget {
  const registerView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    GlobalKey<FormState> Kform = GlobalKey();
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return state is Waitting
            ? const Indicator()
            : Scaffold(
                backgroundColor: kPrimaryColor,
                appBar: arrowappbar(onPressed: () {}),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: Kform,
                      child: Column(
                        children: [
                          headerText(titel: "Sign up"),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .1,
                          ),
                          customTextfaildd(
                            controller: nameController,
                            labelText: "Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              } else {
                                BlocProvider.of<UserCubit>(context).userName =
                                    value;
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          customTextfaildd(
                            labelText: "Email",
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter  Email';
                              } else {
                                BlocProvider.of<UserCubit>(context)
                                    .emailAddress = value;
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          customTextfaildd(
                            labelText: "Password",
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              } else {
                                BlocProvider.of<UserCubit>(context).password =
                                    value;
                                return null;
                              }
                            },
                          ),
                          textbuttom(
                              text: "Already have an account?",
                              onPressed: () {
                                GoRouter.of(context).push(AppRouter.kloginview);
                              }),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: customElevationButtom(
                                text: "SIGN UP",
                                onPressed: () async {
                                  if (Kform.currentState!.validate()) {
                                    await BlocProvider.of<UserCubit>(context)
                                        .createAccountAndSendEmailVerification();

                                    final state =
                                        BlocProvider.of<UserCubit>(context)
                                            .state;

                                    if (state is Success) {
                                     showToastMessage(
                                        "Check your mail and Verifiy your account",
                                        Colors.green,
                                      );
                                    } else if (state is Error) {
                                      final errorMessage = (state).errorMessage;
                                      showToastMessage(errorMessage, Colors.red);
                                    }
                                  }
                                }),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .12,
                          ),
                          const Text("Or sign up with"),
                          googlebuttom(onPressed: () {})
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
