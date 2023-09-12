import 'package:digiteca/pallete.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const CustomButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.brown.shade500,
            borderRadius: BorderRadius.circular(9)),
        child: Center(
          child: Text(
            text,
            style: kHead,
          ),
        ),
      ),
    );
  }
}
