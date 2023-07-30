// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../constant.dart';

AppBar arrowappbar({required onPressed}) {
  return AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back_ios_new),
        color: Colors.black),
  );
}
