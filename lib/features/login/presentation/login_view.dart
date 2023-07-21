import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/cubit/user_cubit.dart';
import 'package:foryou/core/utils/routes.dart';
import 'package:go_router/go_router.dart';
import '../../../constant.dart';
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
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: arrowappbar(onPressed: () {
            GoRouter.of(context).pop();
          }),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  headerText(titel: "Login"),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .1,
                  ),
                  customTextfaildd(labelText: "Email",controller: emaillController),
                  const SizedBox(
                    height: 10,
                  ),
                  customTextfaildd(labelText: "Password",controller: passwordlController),
                  textbuttom(
                      text: "Forget Your password?",
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kforgetPssView);
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child:
                        customElevationButtom(text: "LOGIN", onPressed: () {}),
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
        );
      },
    );
  }
}
