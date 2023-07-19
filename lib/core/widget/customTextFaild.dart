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
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          validator: validator,
          initialValue: initialValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: labelText,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(0, 76, 175, 79),
              ),
            ),
            labelStyle: const TextStyle(color: Colors.grey),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
