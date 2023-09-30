import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/features/quiz/quiz.dart';
import 'package:team_pampers/pages/quiz_page/components/judge_right_wrong_animation.dart';
import 'package:team_pampers/pages/quiz_page/components/quiz_components.dart';
import 'package:team_pampers/widgets/widgets.dart';

class QuizPage extends HookConsumerWidget {
  const QuizPage({
    super.key,
    this.index,
  });
  final int? index;

  static Route<dynamic> route({int? index}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => QuizPage(
        index: index,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const quizAlphabet = ['a', 'b', 'c', 'd'];
    final fetchQuiz = ref.watch(fetchQuizProvider);
    final questionIndex = ref.watch(questionIndexProvider.notifier).state;
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
                      Text("Q$questionIndex"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(quizList[index ?? 0].description),
                      ),
                      Column(
                        children: quizList[index ?? 0]
                            .answers
                            .asMap()
                            .entries
                            .map((answer) {
                          final answerIndex = answer.key;
                          final answerValue = answer.value;
                          return QuizSelectWidget(
                            text: '${quizAlphabet[answerIndex]} $answerValue',
                            answer: answerValue,
                            currentAnswer: quizList[index ?? 0].currentAnswer,
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
