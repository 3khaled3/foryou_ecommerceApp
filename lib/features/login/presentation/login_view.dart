import 'package:flutter/material.dart';
import '../../../constant.dart';
import '../../../core/widget/arrowAppBar.dart';
import '../../../core/widget/customElevationButtom.dart';
import '../../../core/widget/customTextFaild.dart';
import '../../../core/widget/googlebuttom.dart';
import '../../../core/widget/headertext.dart';
import '../../../core/widget/textbuttom.dart';

// ignore: camel_case_types
class loginView extends StatelessWidget {
  const loginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: arrowappbar(onPressed: () {}),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            headerText(titel: "Login"),
            const Spacer(flex: 1),
            customTextfaild(labelText: "Email"),
            const SizedBox(
              height: 10,
            ),
            customTextfaild(labelText: "Password"),
            textbuttom(text: "Forget Your password?", onPressed: () {}),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.infinity,
              child: customElevationButtom(text: "LOGIN", onPressed: () {}),
            ),
            const Spacer(flex: 3),
            const Text("Or login with"),
            googlebuttom(onPressed: () {})
          ],
        ),
      ),
    );
  }
}
