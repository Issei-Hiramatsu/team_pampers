import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class ResultAnimation extends HookWidget {
  const ResultAnimation({
    super.key,
    required this.quizJudgeList,
  });
  final List<bool> quizJudgeList;

  @override
  Widget build(BuildContext context) {
    final AnimationController mistakeController = useAnimationController();

    // 3つのアニメーションをランダムに表示する
    final AnimationController collectController =
        useAnimationController(duration: const Duration(milliseconds: 3000));
    final AnimationController collectController2 =
        useAnimationController(duration: const Duration(milliseconds: 4000));
    final AnimationController collectController3 =
        useAnimationController(duration: const Duration(milliseconds: 4500));
    final AnimationController collectController4 =
        useAnimationController(duration: const Duration(milliseconds: 5000));
    final AnimationController collectController5 =
        useAnimationController(duration: const Duration(milliseconds: 6000));
    List<AnimationController> animationControllerList = [
      collectController,
      collectController2,
      collectController3,
      collectController4,
      collectController5
    ];
    collectController.forward();
    collectController2.forward();
    collectController3.forward();
    collectController4.forward();
    collectController5.forward();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: quizJudgeList
          .map(
            (isCorrect) => Lottie.network(
              'https://assets1.lottiefiles.com/packages/lf20_ADzN7G.json',
              width: 60,
              height: 60,
              controller: isCorrect
                  ? (animationControllerList.toList()..shuffle()).first
                  : mistakeController,
              options: LottieOptions(enableMergePaths: true),
            ),
          )
          .toList(),
    );
  }
}
