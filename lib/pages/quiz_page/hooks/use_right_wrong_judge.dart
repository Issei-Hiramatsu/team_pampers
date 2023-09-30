import 'package:hooks_riverpod/hooks_riverpod.dart';

StateProvider<bool> didAnswerProvider = StateProvider<bool>((ref) => false);

StateProvider<bool> isCollectProvider = StateProvider<bool>((ref) => false);

void testJudge(WidgetRef ref, int yourAnswer, int correctAnswer) {
  if (yourAnswer == correctAnswer) {
    ref.read(isCollectProvider.notifier).state = true;
  } else {
    ref.read(isCollectProvider.notifier).state = false;
  }
}
