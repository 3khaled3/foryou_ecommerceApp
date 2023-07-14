
import 'package:flutter/material.dart';
import 'package:foryou/features/home/presentation/widget/saleItem.dart';

class saleListView extends StatelessWidget {
  const saleListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 290,
            width: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return saleItem();
              },
            ),
          ),
        ),
      ],
    );
  }
}