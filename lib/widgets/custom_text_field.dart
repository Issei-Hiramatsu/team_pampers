import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
        this.keybordType,
        required this.onChanged,
        required this.controller,
        required this.labelText,
        required this.icon,
        })
      : super(key: key);

  final void Function(String)? onChanged;
  final TextEditingController controller;
  final TextInputType? keybordType;
  final String labelText;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
          keyboardType: keybordType,
          onChanged: onChanged,
          decoration: InputDecoration(
            icon: icon,
            labelText: labelText
              ),
        );
  }
}