import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/pages/home_page/home_page.dart';
import 'package:team_pampers/pages/result_page/result_animation.dart';

import '../../widgets/custom_button.dart';

class ResultPage extends HookConsumerWidget {
  const ResultPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ResultPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 144),
              Text("5/5",style:TextStyle(fontSize: 64,fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(left: 120.0),
                child: Text("正解",style:TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 48),
              ResultAnimation(),
              SizedBox(height: 48),
              Text("全問正解！すごい",style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 48),

              SizedBox(
                height: 50,
                child: CustomButton(
                  text: "ホーム画面に戻る",
                  icon: Icons.home,
                  onPressed: () => Navigator.pushAndRemoveUntil(
                      context, HomePage.route(), (route) => false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
