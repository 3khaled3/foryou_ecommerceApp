// ignore: file_names
import 'package:flutter/material.dart';
// ignore: non_constant_identifier_names
AppBar settingsViewAppBar({ required onPressed}) {
  return AppBar(
    leading: IconButton(
        onPressed:  onPressed,
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        )),
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ))
    ],
    elevation: .5,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: const Text(
      "Settings",
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
    ),
  );
}
