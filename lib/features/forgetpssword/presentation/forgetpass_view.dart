import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constant.dart';
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
    
    TextEditingController passwordController = TextEditingController();
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
              headerText(titel: "Forgot pssword"),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .15,
              ),
              const Text(
                  " Please, enter your email address. You will receive a link to create a new password via email."),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 25),
                child: customTextfaildd(labelText: "Email",controller: passwordController),
              ),
              SizedBox(
                width: double.infinity,
                child: customElevationButtom(text: "SEND", onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
