import 'package:flutter/material.dart';

Row headerText({required titel}) {
  return Row(
    children: [
      Text(
        titel,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
      ),
    ],
  );
}
