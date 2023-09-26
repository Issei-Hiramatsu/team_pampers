import 'package:flutter/material.dart';
import 'package:team_pampers/utils/utils.dart';

extension ContextExtension on BuildContext {
  double get deviceWidth => MediaQuery.of(this).size.width;
  double get deviceHeight => MediaQuery.of(this).size.height;
  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;
  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;
  TextStyle get h1 => Theme.of(this).textTheme.displayLarge!;
  TextStyle get h2 => Theme.of(this).textTheme.displayMedium!;
  TextStyle get h3 => Theme.of(this).textTheme.displaySmall!;
  TextStyle get h4 => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get h5 => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get h6 => Theme.of(this).textTheme.titleLarge!;
  TextStyle get subtitleStyle => Theme.of(this).textTheme.titleMedium!;
  TextStyle get bodyStyle => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get smallStyle => Theme.of(this).textTheme.bodySmall!;

  void showSnackBar(
    String text, {
    Color? backgroundColor,
    Duration duration = const Duration(milliseconds: 1500),
    VoidCallback? onTap,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    String closeLabel = '閉じる',
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor ?? const Color(0xFF323232),
        content: Text(text),
        behavior: behavior,
        duration: duration,
      ),
    );
  }

  /// Exception 起点でスナックバーを表示する。
  /// Dart の Exception 型の場合は toString() 冒頭を取り除いて
  /// 差し支えのないメッセージに置換しておく。
  void showSnackBarByException(
    Exception e, {
    Color? backgroundColor,
    Duration duration = const Duration(milliseconds: 1500),
    VoidCallback? onTap,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    String closeLabel = '閉じる',
  }) {
    final message = e.toString();
    return showSnackBar(
      message.ifIsEmpty(generalExceptionMessage),
      backgroundColor: backgroundColor,
      duration: duration,
      onTap: onTap,
      behavior: behavior,
      closeLabel: closeLabel,
    );
  }
}
