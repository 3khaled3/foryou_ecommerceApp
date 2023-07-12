import 'package:flutter/material.dart';

import '../../../core/widget/customTextFaild.dart';

class loginView extends StatelessWidget {
  const loginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      // backgroundColor: Color.fromARGB(255, 195, 75, 75),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfff9f9f9),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
                ),
              ],
            ),
            customTextfaild(labelText: "Email"),
            SizedBox(
              height: 10,
            ),
            customTextfaild(labelText: "Password"),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "Forget Your password?",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.transparent,
                    ),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
  onPressed: () {},
  child: Text(
    "LOGIN",
    style: TextStyle(fontWeight: FontWeight.w500),
  ),
  style: ButtonStyle(
    padding: MaterialStateProperty.all(EdgeInsets.all(14)),
    backgroundColor: MaterialStateProperty.all(
      Color(0xffDB3022),
    ),
    elevation: MaterialStateProperty.all(0),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
)
,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
