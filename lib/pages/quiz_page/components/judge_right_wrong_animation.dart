import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/features/quiz/quiz.dart';
import 'package:team_pampers/pages/home_page/home_page.dart';
import 'package:team_pampers/pages/quiz_page/quiz_page.dart';
import 'package:team_pampers/utils/gen/assets.gen.dart';

class JudgeRightWrongAnimation extends ConsumerWidget {
  const JudgeRightWrongAnimation({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final didAnswer = ref.watch(didAnswerProvider);
    final isCollect = ref.watch(isCorrectProvider);
    final questionIndex = ref.watch(questionIndexProvider.notifier).state;
    if (didAnswer) {
      Future.delayed(const Duration(seconds: 2), () {
        if (questionIndex == 5) {
          Navigator.pushAndRemoveUntil(
            context,
            HomePage.route(),
            (_) => false,
          );
        } else {
          ref.watch(questionIndexProvider.notifier).state++;
          Navigator.pushAndRemoveUntil(
            context,
            QuizPage.route(index: questionIndex),
            (_) => false,
          );
        }
        ref.read(didAnswerProvider.notifier).state = false;
      });
    }

    return Stack(
      children: [
        didAnswer
            ? isCollect
                ? Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      heightFactor: 0.5,
                      child: Image.asset(Assets.images.greenCircle.path),
                    ),
                  )
                : Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      heightFactor: 0.5,
                      child: Image.asset(Assets.images.redCross.path),
                    ),
                  )
            : Container(),
        child,
      ],
    );
  }
}
