import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/pages/quiz_page/components/right_wrong_select_button.dart';

class RightWrongBody extends HookConsumerWidget {
  const RightWrongBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 150),
            Text("Q1"),
            SizedBox(height: 40),
            Text("AかBか"),
            Spacer(),
            Row(
              children: [
                RightWrongSelectButton(text: "A"),
                RightWrongSelectButton(text: "B"),
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
