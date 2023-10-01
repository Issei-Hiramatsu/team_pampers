import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
        required this.onPressed,
        required this.text,
        this.icon,
      });

  final VoidCallback onPressed;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}
