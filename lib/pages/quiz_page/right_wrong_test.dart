import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/pages/quiz_page/components/judge_right_wrong_animation.dart';
import 'package:team_pampers/pages/quiz_page/components/quiz_components.dart';

class RightWrongTestPage extends HookConsumerWidget {
  const RightWrongTestPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const RightWrongTestPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: JudgeRightWrongAnimation(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 150),
                  Text("Q1"),
                  SizedBox(height: 40),
                  Text("AかBか"),
                  Spacer(),
                  Row(
                    children: [
                      QuizSelectWidget(
                          text: "A", answer: 'A', currentAnswer: 'A'),
                      QuizSelectWidget(
                          text: "B", answer: 'B', currentAnswer: 'A'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
