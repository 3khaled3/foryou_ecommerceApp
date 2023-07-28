import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foryou/core/utils/Cubits/BagCubit/bag_cubit.dart';
import 'package:foryou/core/utils/indicator.dart';
import 'package:foryou/core/widget/customElevationButtom.dart';
import 'package:foryou/core/widget/rattingRow.dart';
import 'package:foryou/features/Product/presentation/widget/productImage.dart';
import 'package:foryou/features/Product/presentation/widget/productappBar.dart';
import 'package:foryou/features/Product/presentation/widget/titelCatogry.dart';
import 'package:go_router/go_router.dart';
import '../../../constant.dart';
import '../../home/data/product.dart';
import 'widget/saleListview.dart';

// ignore: camel_case_types
class productView extends StatelessWidget {
  final Product product;
  const productView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductAppBar(
          onPressedarrow: () => context.pop(), onPressedSearch: () {}),
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  productImage(images: product.images),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  ListTile(
                    title: Text(product.title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 24)),
                    subtitle: Text(product.brand,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 11)),
                    trailing: Text("\$ ${product.price}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 24)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: RatingRow(
                        rating: product.rating.toInt(),
                        ratingNum: product.stock,
                        iconSize: 18),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(product.description,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 11)),
                    ),
                  ),
                  titelcatogrey(
                    titel: "You can also like this",
                    onPressed: () {},
                  ),
                  saleListView(category: product.category),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: double.infinity,
                  child: BlocBuilder<BagCubit, BagState>(
                    builder: (context, state) {
                      return state is Waittingg? buildCircleIndicator(): customElevationButtom(
                          text: "ADD TO CART",
                          onPressed: () async {
                            await BlocProvider.of<BagCubit>(context)
                                .addToBag(product.id , context);
                          });
                    },
                  ))),
        ],
      ),
    );
  }
}
