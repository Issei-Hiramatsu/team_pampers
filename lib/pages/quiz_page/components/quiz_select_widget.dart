import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/features/quiz/quiz.dart';

class QuizSelectWidget extends HookConsumerWidget {
  const QuizSelectWidget({
    super.key,
    this.color,
    required this.text,
    required this.answer,
    required this.currentAnswer,
  });
  final Color? color;
  final String text;
  final String answer;
  final String currentAnswer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final didAnswer = ref.watch(didAnswerProvider);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: didAnswer
              ? answer == currentAnswer
                  ? Colors.green
                  : Colors.red
              : null,
        ),
        onPressed: didAnswer
            ? () {}
            : () async {
                ref.read(didAnswerProvider.notifier).state = true;
                final isCorrect = await ref.read(jadgeQuizProvider).call(
                      answer: currentAnswer,
                      selectedAnswer: answer,
                    );
                ref.read(isCorrectProvider.notifier).state = isCorrect;
              },
        child: Text(text),
      ),
    );
  }
}
