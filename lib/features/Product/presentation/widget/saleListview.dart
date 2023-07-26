import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/ProdactWidget/saleItem.dart';
import 'package:foryou/core/utils/Cubits/cubit/api_cubit.dart';


class saleListView extends StatelessWidget {
  final String category;
  const saleListView({
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final products= BlocProvider.of<ApiCubit>(context).categoriesProduct;
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 290,
            width: 170,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount:products[category].length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SaleItem(product: products[category][index],);
              },
            ),
          ),
        ),
      ],
    );
  }
}
