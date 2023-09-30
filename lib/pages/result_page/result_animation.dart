import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class ResultAnimation extends HookWidget {
  const ResultAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    final List durationList = [
      const Duration(seconds: 2),
      const Duration(seconds: 3),
      const Duration(seconds: 5),
    ];

    final AnimationController mistakeController = useAnimationController();
    final AnimationController collectController =
        useAnimationController(duration: durationList[0]);
    final AnimationController collectController2 =
        useAnimationController(duration: durationList[1]);
    final AnimationController collectController3 =
        useAnimationController(duration: durationList[2]);

    collectController.forward();
    collectController2.forward();
    collectController3.forward();
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Lottie.network(
        'https://assets1.lottiefiles.com/packages/lf20_ADzN7G.json',
        width: 60,
        height: 60,
        controller: true ? collectController : mistakeController,
        addRepaintBoundary: false,
        options: LottieOptions(enableMergePaths: true),
      ),
      Lottie.network(
        'https://assets1.lottiefiles.com/packages/lf20_ADzN7G.json',
        width: 60,
        height: 60,
        controller: true ? collectController2 : mistakeController,
      ),
      Lottie.network(
        'https://assets1.lottiefiles.com/packages/lf20_ADzN7G.json',
        width: 60,
        height: 60,
        controller: true ? collectController3 : mistakeController,
      ),
      Lottie.network(
        'https://assets1.lottiefiles.com/packages/lf20_ADzN7G.json',
        animate: false,
        width: 60,
        height: 60,
        controller: true ? collectController : mistakeController,
        options: LottieOptions(enableMergePaths: true),
      ),
      Lottie.network(
        'https://assets1.lottiefiles.com/packages/lf20_ADzN7G.json',
        width: 60,
        height: 60,
        controller: true ? collectController2 : mistakeController,
        options: LottieOptions(enableMergePaths: true),
      ),
    ]);
  }
}
