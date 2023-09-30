import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/features/quiz/quiz.dart';
import 'package:team_pampers/pages/quiz_page/components/judge_right_wrong_animation.dart';
import 'package:team_pampers/pages/quiz_page/components/quiz_components.dart';
import 'package:team_pampers/widgets/widgets.dart';

class QuizPage extends HookConsumerWidget {
  const QuizPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const QuizPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const quizAlphabet = ['a', 'b', 'c', 'd'];
    final fetchQuiz = ref.watch(fetchQuizProvider);
    return Scaffold(
      body: JudgeRightWrongAnimation(
        child: Column(
          children: [
            fetchQuiz.when(
              data: (quizList) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 150),
                      const Text("Q1"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(quizList[1].description),
                      ),
                      Column(
                        children:
                            quizList[1].answers.asMap().entries.map((answer) {
                          final index = answer.key;
                          final answerValue = answer.value;
                          return QuizSelectWidget(
                            text: '${quizAlphabet[index]} $answerValue',
                            answer: answerValue,
                            currentAnswer: quizList[1].currentAnswer,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) => ErrorPage(
                error: error,
                onTapReload: () => ref.invalidate(fetchQuizProvider),
              ),
              loading: () => const Loading(),
            ),
          ],
        ),
      ),
    );
  }
}
