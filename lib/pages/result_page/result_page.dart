import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/pages/result_page/result_animation.dart';


class ResultPage extends HookConsumerWidget {
  const ResultPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ResultPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body:
      Column(
        children: [
          SizedBox(height: 50,),
          ResultAnimation(),
        ],
      ),
    );
  }
}
