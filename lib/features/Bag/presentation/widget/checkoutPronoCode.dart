import 'package:flutter/material.dart';
import 'package:foryou/core/widget/customElevationButtom.dart';

// ignore: camel_case_types
class checkoutPronoCode extends StatelessWidget {
  const checkoutPronoCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 8,
                offset: Offset(4, 8),
              ),
            ],
          ),
          child: Padding(
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TOTAL PAYMENT :",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text("\$ 198.00",
                        style: TextStyle(
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
        ),
      ),
    );
  }
}
