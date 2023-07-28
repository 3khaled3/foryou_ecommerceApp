import 'package:flutter/material.dart';
import 'package:foryou/core/widget/customElevationButtom.dart';

// ignore: camel_case_types
class checkoutPronoCode extends StatelessWidget {
  final double prices;
  const checkoutPronoCode({super.key, required this.prices});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.navigate_next),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/coupon1.png',
                      width: 5,
                      height: 4,
                      fit: BoxFit.fill,
                    ),
                  ),
                  hintText: 'UES YOUR PROMO CODE',
                  border: const OutlineInputBorder(),
                ),
              ),
              const Divider(height: 8),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("TOTAL PAYMENT :",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("\$ $prices",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: customElevationButtom(
                      text: "CHECK OUT", onPressed: () {}))
            ],
          ),
        ),
      ],
    );
  }
}
