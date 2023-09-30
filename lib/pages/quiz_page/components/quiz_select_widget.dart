import 'package:flutter/material.dart';
import 'package:team_pampers/utils/utils.dart';

class QuizSelectWidget extends StatelessWidget {
  final String text;
  const QuizSelectWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
        height: context.deviceHeight*0.09,
        width: context.deviceWidth*0.18,
        child: Center(child: Text(text))
      ),
      onTap: () {},
    );
  }
}