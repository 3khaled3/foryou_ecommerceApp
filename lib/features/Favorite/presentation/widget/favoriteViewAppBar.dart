// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar FavoriteViewAppBar() {
  return AppBar(
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
      "favorite",
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
    ),
  );
}
