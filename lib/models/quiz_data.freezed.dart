// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizData _$QuizDataFromJson(Map<String, dynamic> json) {
  return _QuizData.fromJson(json);
}

/// @nodoc
mixin _$QuizData {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;
  String get currentAnswer => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizDataCopyWith<QuizData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizDataCopyWith<$Res> {
  factory $QuizDataCopyWith(QuizData value, $Res Function(QuizData) then) =
      _$QuizDataCopyWithImpl<$Res, QuizData>;
  @useResult
  $Res call(
      {String id,
      String description,
      List<String> answers,
      String currentAnswer,
      String category});
}

/// @nodoc
class _$QuizDataCopyWithImpl<$Res, $Val extends QuizData>
    implements $QuizDataCopyWith<$Res> {
  _$QuizDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? answers = null,
    Object? currentAnswer = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentAnswer: null == currentAnswer
          ? _value.currentAnswer
          : currentAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizDataCopyWith<$Res> implements $QuizDataCopyWith<$Res> {
  factory _$$_QuizDataCopyWith(
          _$_QuizData value, $Res Function(_$_QuizData) then) =
      __$$_QuizDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String description,
      List<String> answers,
      String currentAnswer,
      String category});
}

/// @nodoc
class __$$_QuizDataCopyWithImpl<$Res>
    extends _$QuizDataCopyWithImpl<$Res, _$_QuizData>
    implements _$$_QuizDataCopyWith<$Res> {
  __$$_QuizDataCopyWithImpl(
      _$_QuizData _value, $Res Function(_$_QuizData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? answers = null,
    Object? currentAnswer = null,
    Object? category = null,
  }) {
    return _then(_$_QuizData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentAnswer: null == currentAnswer
          ? _value.currentAnswer
          : currentAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizData implements _QuizData {
  const _$_QuizData(
      {required this.id,
      required this.description,
      required final List<String> answers,
      required this.currentAnswer,
      required this.category})
      : _answers = answers;

  factory _$_QuizData.fromJson(Map<String, dynamic> json) =>
      _$$_QuizDataFromJson(json);

  @override
  final String id;
  @override
  final String description;
  final List<String> _answers;
  @override
  List<String> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final String currentAnswer;
  @override
  final String category;

  @override
  String toString() {
    return 'QuizData(id: $id, description: $description, answers: $answers, currentAnswer: $currentAnswer, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.currentAnswer, currentAnswer) ||
                other.currentAnswer == currentAnswer) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, description,
      const DeepCollectionEquality().hash(_answers), currentAnswer, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizDataCopyWith<_$_QuizData> get copyWith =>
      __$$_QuizDataCopyWithImpl<_$_QuizData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizDataToJson(
      this,
    );
  }
}

abstract class _QuizData implements QuizData {
  const factory _QuizData(
      {required final String id,
      required final String description,
      required final List<String> answers,
      required final String currentAnswer,
      required final String category}) = _$_QuizData;

  factory _QuizData.fromJson(Map<String, dynamic> json) = _$_QuizData.fromJson;

  @override
  String get id;
  @override
  String get description;
  @override
  List<String> get answers;
  @override
  String get currentAnswer;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_QuizDataCopyWith<_$_QuizData> get copyWith =>
      throw _privateConstructorUsedError;
}
