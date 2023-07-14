
  import 'package:flutter/material.dart';

Future<dynamic> showbottomSheet(BuildContext context) {
    return showModalBottomSheet<dynamic>(
                      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        var container = Container(
                          // height: MediaQuery.of(context).size.height*.6,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 30, 30, 30),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0))),
                          child: Container(
                            color: Colors.black,
                            height: MediaQuery.sizeOf(context).height,
                            child: Text("ascac"),
                          ),
                        );
                        return container;
                      },
                    );
  }