import 'package:bmi_calculator/src/methods/styles.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          'MALE',
          style: buildLabelTextStyle(context),
        )
      ],
    );
  }
}
