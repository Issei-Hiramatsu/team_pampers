// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizData _$$_QuizDataFromJson(Map<String, dynamic> json) => _$_QuizData(
      id: json['id'] as String,
      description: json['description'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      currentAnswer: json['currentAnswer'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_QuizDataToJson(_$_QuizData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'answers': instance.answers,
      'currentAnswer': instance.currentAnswer,
      'category': instance.category,
    };
