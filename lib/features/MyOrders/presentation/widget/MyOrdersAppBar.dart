import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar MyOrdersAppBar({required onPressed}) {
  return AppBar(
    actions: [
      IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ))
    ],
    elevation: .5,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: const Text(
      "My Orders",
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
    ),
  );
}
