// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/userCubit/user_cubit.dart';
import 'package:foryou/core/utils/routes.dart';
import 'package:go_router/go_router.dart';
import '../../../constant.dart';
import '../../../core/utils/indicator.dart';
import '../../../core/widget/SnakePar.dart';
import '../../../core/widget/arrowAppBar.dart';
import '../../../core/widget/customElevationButtom.dart';
import '../../../core/widget/customTextFaild.dart';
import '../../../core/widget/googlebuttom.dart';
import '../../../core/widget/headertext.dart';
import '../../../core/widget/textbuttom.dart';
import '../../../mmmmmm.dart';

// ignore: camel_case_types
class loginView extends StatelessWidget {
  const loginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emaillController = TextEditingController();
    TextEditingController passwordlController = TextEditingController();
    GlobalKey<FormState> Kform = GlobalKey();
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
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
                          headerText(titel: "Login"),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .1,
                          ),
                          customTextfaildd(
                            labelText: "Email",
                            controller: emaillController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Email';
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
                            controller: passwordlController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Password';
                              } else {
                                BlocProvider.of<UserCubit>(context).password =
                                    value;
                                return null;
                              }
                            },
                          ),
                          textbuttom(
                              text: "Forget Your password?",
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(AppRouter.kforgetPssView);
                              }),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: customElevationButtom(
                                text: "LOGIN",
                                onPressed: () async {
                                  if (Kform.currentState!.validate()) {
                                    await BlocProvider.of<UserCubit>(context)
                                        .login();

                                    final state =
                                        BlocProvider.of<UserCubit>(context)
                                            .state;

                                    if (state is Success) {
                                      showSnackbarMessage(
                                        context,
                                        "Success",
                                        Colors.green,
                                      );
                                      GoRouter.of(context)
                                          .push(AppRouter.kHomeView);
                                    } else if (state is Error) {
                                      final errorMessage = (state).errorMessage;
                                      showSnackbarMessage(
                                          context, errorMessage, Colors.red);
                                    }
                                  }
                                }),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .2,
                          ),
                          const Text("Or login with"),
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
