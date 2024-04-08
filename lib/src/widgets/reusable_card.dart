import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({super.key, required this.colour, this.cardChild, this.onPress});

  Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration:
        BoxDecoration(color: colour, borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}