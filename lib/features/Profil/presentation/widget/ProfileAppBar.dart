// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar PeofileAppBar({required onPressed}) {
  return AppBar(
    actions: [
      IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.output_sharp,
            color: Colors.red,
          ))
    ],
    elevation: .5,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: const Text(
      "My profile",
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
    ),
  );
}
