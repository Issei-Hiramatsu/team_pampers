import 'package:flutter/material.dart';

class RightWrongSelectButton extends StatelessWidget {
  final String text;
  const RightWrongSelectButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Center(
          //ここに画像を入れる
          child: ElevatedButton(
            onPressed: () {},
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
