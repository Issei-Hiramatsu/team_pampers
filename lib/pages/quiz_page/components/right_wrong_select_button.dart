import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/pages/quiz_page/hooks/use_right_wrong_judge.dart';

class RightWrongSelectButton extends ConsumerWidget {
  final String text;
  const RightWrongSelectButton({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final didAnswer = ref.watch(didAnswerProvider);
    final isCollect = ref.watch(isCollectProvider);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Center(
          //ここに画像を入れる
          child: ElevatedButton(
            onPressed: didAnswer
                ? null
                : () {
                    ref.read(didAnswerProvider.notifier).state = true;
                    testJudge(ref, 2, 2);
                    isCollect ? print("正解") : print("不正解");
                  },
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
