import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/right_wrong_body.dart';

class RightWrongTestPage extends HookConsumerWidget {
  const RightWrongTestPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const RightWrongTestPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: RightWrong(),
    );
  }
}
