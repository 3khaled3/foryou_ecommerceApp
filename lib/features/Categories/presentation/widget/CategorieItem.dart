// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CategorieItem extends StatelessWidget {
  const CategorieItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                height: 100,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "data",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/styles/1.jpg"),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}