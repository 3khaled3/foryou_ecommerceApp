import 'package:flutter/material.dart';

Padding googlebuttom({required onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
        backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(255, 255, 255, 255),
        ),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Image.asset(
        "assets/google.jpg",
        width: 30,
      ),
    ),
  );
}
