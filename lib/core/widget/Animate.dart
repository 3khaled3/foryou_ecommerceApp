// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class animate extends StatelessWidget {
  final String text;
  final String image;
  const animate({super.key, required this.text,required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.white,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Spacer(flex: 2),
          Lottie.asset(image),
          Spacer(),
           Text(
            text,
            style: const TextStyle(fontSize: 30, fontFamily: 'Pacifico'),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
