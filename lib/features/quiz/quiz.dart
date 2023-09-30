import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/models/quiz_data.dart';
import 'package:team_pampers/repositories/quiz/quiz_repository_impl.dart';
import 'package:team_pampers/utils/utils.dart';
import 'package:team_pampers/widgets/widgets.dart';

final isCorrectProvider = StateProvider.autoDispose<bool>((ref) => false);

final didAnswerProvider = StateProvider.autoDispose<bool>((ref) => false);

final fetchQuizProvider = FutureProvider.autoDispose<List<QuizData>>(
  (ref) async {
    final read = ref.read;
    try {
      final response = await read(quizRepositoryImplProvider).fetchQuiz();
      debugPrint('クイズを取得しました');
      return response;
    } on AppException catch (e) {
      debugPrint('クイズ取得エラー: $e');
      rethrow;
    }
  },
);

final jadgeQuizProvider = StateProvider.autoDispose<
    Future<bool> Function({
      required String answer,
      required String selectedAnswer,
    })>(
  (ref) => ({
    required answer,
    required selectedAnswer,
  }) async {
    final read = ref.read;
    try {
      read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      if (answer == selectedAnswer) {
        debugPrint('正解');
        return true;
      } else {
        debugPrint('不正解');
        return false;
      }
    } on AppException catch (e) {
      debugPrint('クイズ判定エラー: $e');
      rethrow;
    } finally {
      read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  },
);
