import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../hooks/use_right_wrong_judge.dart';

class JudgeRightWrongAnimation extends ConsumerWidget {
  const JudgeRightWrongAnimation({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final didAnswer = ref.watch(didAnswerProvider);
    final isCollect = ref.watch(isCollectProvider);
    return Stack(
      children: [
        didAnswer
            ? isCollect
                ? Center(child: Image.asset('images/green_circle.png'))
                : Center(child: Image.asset('images/red_cross.png'))
            : Container(),
        child,
      ],
    );
  }
}
