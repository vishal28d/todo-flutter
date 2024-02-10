// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
   MyButton( {super.key, required this.text, required this.onPressed});
  final String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: Theme.of(context).primaryColor,
    );
  }
}