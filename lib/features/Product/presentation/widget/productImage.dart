import 'package:flutter/material.dart';

class productImage extends StatelessWidget {
  const productImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .5,
        child: Image.asset(
          "assets/styles/1.jpg",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
