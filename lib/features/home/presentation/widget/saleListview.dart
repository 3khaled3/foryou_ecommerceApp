// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/ProdactWidget/saleItem.dart';
import '../../../../core/utils/Cubits/FavCubit/fav_cubit.dart';
import '../../data/product.dart';

class saleListView extends StatelessWidget {
  final List<Product> products;
  const saleListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    // final favlist = BlocProvider.of<FavCubit>(context).favList;
    // List<Map<String, dynamic>> productmap = []; // Initialize as a List

    // for (var x = 0; x < products.length; x++) {
    //   bool fav = false;
    //   for (var i = 0; i < favlist.length; i++) {
    //     if (products[x].id == favlist[i]["product"].id) {
    //       fav = true;
    //       break;
    //     }
    //   }
    //   // Add each product's information as a map to the productmap list
    //   productmap.add({
    //     "product": products[x],
    //     "fav": fav,
    //   });
    // }

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
                return SaleItem(
                  product: products[index]
                  // ["product"], // Access the "product" key
                  // fav: productmap[index]["fav"], // Access the "fav" key
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

