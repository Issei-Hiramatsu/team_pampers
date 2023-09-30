import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/quiz_body.dart';

class QuizPage extends HookConsumerWidget {
  const QuizPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const QuizPage(),
    );
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: QuizPageBody(),
    );
  }
}
