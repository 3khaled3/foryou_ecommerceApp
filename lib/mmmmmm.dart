// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class customTextfaildd extends StatelessWidget {
  final String labelText;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final String inithialText;
  final String? Function(String?)? validator;
  const customTextfaildd({
    Key? key,
    required this.labelText,
    required this.controller,
    this.onChanged,
    this.validator,
    this.inithialText="",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
controller.text = inithialText;
    return SizedBox(
      // height: 60,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller,
                validator: validator,
                onChanged: onChanged,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(
                      top: 16, left: 12, right: 12, bottom: 33),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  labelStyle: const TextStyle(color: Colors.grey),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 11, left: 4, right: 4),
              child: TextFormField(
                controller: controller,
                // validator: validator,
                onChanged: onChanged,

                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 12, right: 12),
                  enabledBorder: const OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  // fillColor: Colors.yellow,
                  labelText: labelText,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  labelStyle: const TextStyle(color: Colors.grey),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



















// class customSettingTextfaild extends StatelessWidget {
//    final String labelText;
//   final Function(String)? onChanged;
//   final String inithialText;
//   final String? Function(String?)? validator;
//   const customSettingTextfaild({
//     Key? key,
//     required this.labelText,
//     this.onChanged,
//     this.validator,
//     this.inithialText="",
//   }) : super(key: key);


//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(initialValue: inithialText,
//                 validator: validator,
//                 onChanged: onChanged,

//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.only(left: 12, right: 12),
//                   enabledBorder: const OutlineInputBorder(
//                     // borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   // fillColor: Colors.yellow,
//                   labelText: labelText,
//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Colors.red),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Colors.white),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: const BorderSide(color: Colors.white),
//                   ),
//                   labelStyle: const TextStyle(color: Colors.grey),
//                   floatingLabelBehavior: FloatingLabelBehavior.auto,
//                 ),
//               ) ;
//   }
// }