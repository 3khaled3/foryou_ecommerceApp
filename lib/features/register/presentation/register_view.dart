import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/cubit/user_cubit.dart';
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
        return Scaffold(
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
                    customTextfaildd(controller: nameController,
                      labelText: "Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else {
                          BlocProvider.of<UserCubit>(context).password = value;
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextfaildd(labelText: "Email",controller: emailController),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextfaildd(labelText: "Password",controller: passwordController),
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
                          onPressed: () {
                            if (Kform.currentState!.validate()) {}
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
