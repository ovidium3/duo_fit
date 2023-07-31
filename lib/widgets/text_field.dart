import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

// Custom text field widget used for taking user input
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.label,
    this.obscureText = false,
    required this.controller,
    required this.keyboardType,
    super.key,
  });

  final String label;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;

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
