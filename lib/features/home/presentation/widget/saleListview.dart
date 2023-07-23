import 'package:flutter/material.dart';
import 'package:foryou/core/ProdactWidget/saleItem.dart';

import '../../data/product.dart';

class saleListView extends StatelessWidget {
   final List<Product> products;
  const saleListView({required this.products
    
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
              physics: const BouncingScrollPhysics(),
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SaleItem(product:products[index] ,);
              },
            ),
          ),
        ),
      ],
    );
  }
}
