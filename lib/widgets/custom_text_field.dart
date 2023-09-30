import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.labelText,
    this.textInputAction,
    this.focusNode,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.icon,
  });
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool obscureText;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final String labelText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      autofocus: autofocus,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        icon: Icon(icon),
      ),
    );
  }
}
