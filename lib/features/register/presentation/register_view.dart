import 'package:flutter/material.dart';
import '../../../constant.dart';
import '../../../core/widget/arrowAppBar.dart';
import '../../../core/widget/customElevationButtom.dart';
import '../../../core/widget/customTextFaild.dart';
import '../../../core/widget/googlebuttom.dart';
import '../../../core/widget/headertext.dart';
import '../../../core/widget/textbuttom.dart';

// ignore: camel_case_types
class registerView extends StatelessWidget {
  const registerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: arrowappbar(onPressed: () {}),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              headerText(titel: "Sign up"),
              SizedBox(height: MediaQuery.sizeOf(context).height*.1,),
              customTextfaild(labelText: "Name"),
              const SizedBox(
                height: 10,
              ),
              customTextfaild(labelText: "Email"),
              const SizedBox(
                height: 10,
              ),
              customTextfaild(labelText: "Password"),
              textbuttom(text: "Already have an account?", onPressed: () {}),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: customElevationButtom(text: "SIGN UP", onPressed: () {}),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height*.12,),
              const Text("Or sign up with"),
              googlebuttom(onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
