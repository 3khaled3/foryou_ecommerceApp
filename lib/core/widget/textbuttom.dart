 import 'package:flutter/material.dart';

Row textbuttom({required text,required onPressed}) {
    return Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                child:  Row(
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
  }