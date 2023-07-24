import 'package:flutter/material.dart';

class IamTitle extends StatelessWidget {
  const IamTitle({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      "I'm \n$text",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
