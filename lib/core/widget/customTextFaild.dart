// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class customTextfaild extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const customTextfaild({
    super.key,
    required this.labelText,
    this.initialValue = "",
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Stack(
      children: [
        TextFormField(
          controller: _controller,
          validator: validator,
          initialValue: initialValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white),
            ),
            filled: true,
            fillColor: Colors.white,
            labelText: labelText,
            contentPadding:
                const EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 8),
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
        Positioned(bottom: 0, height: 0, child: Text("data"))
      ],
    );
  }
}
