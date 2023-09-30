import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_data.freezed.dart';
part 'quiz_data.g.dart';

@freezed
abstract class QuizData with _$QuizData {
  const factory QuizData({
    required String id,
    required String description,
    required List<String> answers,
    required String currentAnswer,
    required String category,
  }) = _QuizData;

  factory QuizData.fromJson(Map<String, dynamic> json) =>
      _$QuizDataFromJson(json);
}
