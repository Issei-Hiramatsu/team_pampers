import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/features/quiz/quiz.dart';
import 'package:team_pampers/features/user/user.dart';
import 'package:team_pampers/pages/home_page/home_page.dart';
import 'package:team_pampers/pages/result_page/result_animation.dart';
import 'package:team_pampers/widgets/widgets.dart';

class ResultPage extends HookConsumerWidget {
  const ResultPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ResultPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final correctCount = ref.watch(correctCountProvider.notifier).state;
    final quizJudgeList = ref.watch(quizJudgeListProvider.notifier).state;
    final resultText = ref.watch(resultTextProvider.notifier).state;
    ref
        .watch(updateUserDataProvider)
        .call(score: correctCount * 20, onSuccess: () {});

    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "5/$correctCount",
                style:
                    const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 120.0),
                child: Text("正解", style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: ResultAnimation(quizJudgeList: quizJudgeList),
              ),
              Text(resultText, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 48),
              SizedBox(
                height: 50,
                child: CustomButton(
                  text: "ホーム画面に戻る",
                  icon: Icons.home,
                  onPressed: () {
                    ref.read(quizJudgeListProvider.notifier).state = [];
                    Navigator.pushAndRemoveUntil(
                      context,
                      HomePage.route(),
                      (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
