// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class filterBottomSheetView extends StatelessWidget {
  const filterBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 14,
          ),
          // Slider(value: value, onChanged: onChanged)

          
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
        ],
      );
  }
}