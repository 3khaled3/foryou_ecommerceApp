 import 'package:flutter/material.dart';

ElevatedButton customElevationButtom({required text,required onPressed}) {
    return ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xffDB3022),
                ),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child:  Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            );
  }

