// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../../../../core/widget/customElevationButtom.dart';

class MyOrdersItem extends StatelessWidget {
  const MyOrdersItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 164,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: .001,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order 1947034",
                  style: BlackText(),
                ),
                Text("05-12-2019", style: greytext()),
              ],
            ),
            Row(
              children: [
                Text(
                  "Tracking number:",
                  style: greytext(),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "IW3475453455",
                  style: BlackText(),
                ),
              ],
            ),
            Row(
              children: [
                Text("Quantity:", style: greytext()),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "3",
                  style: BlackText(),
                ),
                const Spacer(),
                Text("Total Amount:", style: greytext()),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "51\$",
                  style: BlackText(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 100,
                    child: customElevationButtom(
                      text: "Details",
                      onPressed: () {},
                      buttomColor: Colors.grey,
                      textColor: Colors.white,
                    )),
                const Text(
                  "Delivered",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle BlackText() {
    return const TextStyle(
        color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14);
  }

  TextStyle greytext() {
    return const TextStyle(
        color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 14);
  }
}
