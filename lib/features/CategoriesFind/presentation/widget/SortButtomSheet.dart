// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:foryou/core/widget/customElevationButtom.dart';
import 'package:toggle_switch/toggle_switch.dart';

// ignore: camel_case_types
class sortBottomSheetView extends StatelessWidget {
  const sortBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Text(
            "Sort by",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ToggleSwitch(
            cornerRadius: 0,
            centerText: false,
            borderWidth: 0,
            radiusStyle: false,
            dividerColor: const Color.fromARGB(0, 0, 0, 0),
            activeFgColor: Colors.white,
            inactiveFgColor: Colors.black,
            isVertical: true,
            minWidth: 150.0,
            inactiveBgColor: Colors.white,
            initialLabelIndex: 2,
            activeBgColors: const [
              [
                Colors.red,
              ],
              [
                Colors.red,
              ],
              [
                Colors.red,
              ],
              [
                Colors.red,
              ],
              [
                Colors.red,
              ],
            ],
            labels: const [
              'Popular',
              'Newest',
              'Customer review',
              'Price: lowest to high',
              'Price: highest to low'
            ],
            onToggle: (index) {
              print('switched to: $index');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: SizedBox(
              width: double.infinity,
              child: customElevationButtom(text: "Apply", onPressed: () {})),
        ),
      ],
    );
  }
}
