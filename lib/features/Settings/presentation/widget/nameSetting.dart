// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:foryou/constant.dart';
import 'package:foryou/core/widget/customElevationButtom.dart';
import 'package:foryou/core/widget/customTextFaild.dart';

// ignore: camel_case_types
class nameSettingBottomSheetView extends StatelessWidget {
  const nameSettingBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController FullnameController = TextEditingController();
    return Container(
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  color: Colors.grey, borderRadius: BorderRadius.circular(40)),
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
            // customTextfaild(labelText: "Full name",controller: FullnameController),
            const SizedBox(
              height: 14,
            ),

            SizedBox(
                width: double.infinity,
                child: customElevationButtom(text: "SAVE", onPressed: () {})),
            const SizedBox(
              height: 14,
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
