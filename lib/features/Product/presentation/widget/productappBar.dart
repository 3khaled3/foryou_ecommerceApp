// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar ProductAppBar({required onPressedarrow,required onPressedSearch}) {
  return AppBar(
    leading: IconButton(
        onPressed: onPressedarrow,
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        )),
    actions: [
      IconButton(
          onPressed: onPressedSearch,
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ))
    ],
    elevation: .5,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: const Text(
      "Product",
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
    ),
  );
}
