import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:team_pampers/pages/quiz_page/hooks/use_test_judge.dart';

class RightWrongSelectButton extends StatelessWidget {
  final String text;
  const RightWrongSelectButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final didAnswer = useState(false);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Center(
          //ここに画像を入れる
          child: ElevatedButton(
            onPressed: didAnswer.value
                ? null
                : () {
                    testJudge(2, 2) ? print("正解") : print("不正解");
                    didAnswer.value = true;
                  },
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
