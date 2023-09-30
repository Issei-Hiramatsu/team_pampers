import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/features/quiz/quiz.dart';
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
