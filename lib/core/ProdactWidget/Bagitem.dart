import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../widget/CustomcircleIconButtom.dart';


// ignore: camel_case_types
class BagItem extends StatelessWidget {
  const BagItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          child: Container(
            width: double.infinity,
            height: 104,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20)), 
                  child: Image.asset(
                    "assets/styles/1.jpg",
                    fit: BoxFit.cover,
                    height: 104,
                    width: 104,
                  ),
                ),
               const SizedBox(width:11 ,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("shirt",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Prand",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 11)),
                      const Text("\$ 198.00",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          circleIconButtom(icon: LineIcons.plus, onTap: () {  },),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("5",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14)),
                          const SizedBox(
                            width: 10,
                          ), circleIconButtom(icon: LineIcons.minus, onTap: () {  },),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Color.fromARGB(111, 0, 0, 0),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

