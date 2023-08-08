import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

// Custom text field widget used for taking user input
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    required this.label,
    required this.controller,
    required this.keyboardType,
    this.obscureText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      obscuringCharacter: '•',
      obscureText: obscureText,
      style: const TextStyle(color: ColorConstants.textWhite),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        filled: true,
        labelText: label,
      ),
    );
  }
}
