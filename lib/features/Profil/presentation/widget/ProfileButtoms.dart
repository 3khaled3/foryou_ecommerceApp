// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class profileButtoms extends StatelessWidget {
  final String title;
  final String Suptitle;
  final VoidCallback onPressed;

  const profileButtoms({
    super.key,
    required this.title,
    required this.Suptitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        // color: Colors.white,
        child: InkWell(
      onTap: onPressed,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          Suptitle,
        ),
        subtitleTextStyle: const TextStyle(
            color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w400),
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.black,
        ),
      ),
    ));
  }
}
