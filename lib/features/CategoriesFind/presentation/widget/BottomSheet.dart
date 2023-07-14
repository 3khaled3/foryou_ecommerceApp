
  import 'package:flutter/material.dart';
import 'package:foryou/features/CategoriesFind/presentation/widget/FilterBottomsheetview.dart';

Future<dynamic> showbottomSheet(BuildContext context) {
    return showModalBottomSheet<dynamic>(
                      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        var container = Container(
                          // height: MediaQuery.of(context).size.height*.6,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0))),
                          child: filterBottomSheetView(),
                        );
                        return container;
                      },
                    );
  }