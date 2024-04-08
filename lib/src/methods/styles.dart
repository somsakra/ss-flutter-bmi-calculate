import 'package:flutter/material.dart';

TextStyle buildLabelTextStyle(BuildContext context) {
  return TextStyle(
      fontSize: 20.0, color: Theme.of(context).colorScheme.onPrimary);
}

TextStyle buildNumberTextStyle(BuildContext context) {
  return TextStyle(
      fontSize: 50.0,
      fontWeight: FontWeight.w900,
      color: Theme.of(context).colorScheme.onPrimary);
}

