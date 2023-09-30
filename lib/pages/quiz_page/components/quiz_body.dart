import 'package:flutter/material.dart';
import 'package:team_pampers/pages/quiz_page/components/quiz_select_widget.dart';

class QuizPageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
      Container(
        margin: const EdgeInsets.all(10),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 150),
            Text("Q1"),
            SizedBox(height: 40),
            Text("株式会社ゆめみはどの産業分野で事業を展開していますか？"),
            Text("a) 飲食業"),
            Text("b)インターネットサービス"),
            Text("c)自転車製造"),
            Text("d)建設業"),
            SizedBox(height: 480),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                QuizSelectWidget(text: "A"),
                QuizSelectWidget(text: "B"),
                QuizSelectWidget(text: "C"),
                QuizSelectWidget(text: "D"),
              ],
            )
          ],
        ),
      ),
      ]
    );
  }
}