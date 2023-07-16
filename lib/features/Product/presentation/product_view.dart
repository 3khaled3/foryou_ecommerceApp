import 'package:flutter/material.dart';
import 'package:foryou/core/widget/customElevationButtom.dart';
import 'package:foryou/core/widget/rattingRow.dart';
import 'package:foryou/features/Product/presentation/widget/productImage.dart';
import 'package:foryou/features/Product/presentation/widget/productappBar.dart';
import 'package:foryou/features/Product/presentation/widget/titelCatogry.dart';
import '../../../constant.dart';
import 'widget/saleListview.dart';

// ignore: camel_case_types
class productView extends StatelessWidget {
  const productView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductAppBar(onPressed: () {}),
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const productImage(),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .03,
                  ),
                  
                  ListTile(
                    title: Text("H&M",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 24)),
                    subtitle: Text("Short black dress",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 11)),
                            trailing:  Text("\$19.99",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 24)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: RatingRow(rating: 4, ratingNum: 10, iconSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text("Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 11)),
                  ),
                  titelcatogrey(
                    titel: "You can also like this",
                    onPressed: () {},
                  ),
                  saleListView(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: customElevationButtom(
                    text: "ADD TO CART", onPressed: () {})),
          ),
        ],
      ),
    );
  }
}
