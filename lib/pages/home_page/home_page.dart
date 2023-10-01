import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/pages/home_page/components/home_components.dart';
import 'package:team_pampers/pages/profile_page/profile_page.dart';
import 'package:team_pampers/pages/ranking_page/ranking_page.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:team_pampers/pages/quiz_page/quiz_page.dart';
import 'package:team_pampers/widgets/widgets.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(iconTheme: const IconThemeData(
          size: 40  //アイコンの大きさ
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'XXXXテスト',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  const SizedBox(
                    width: 8,
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 32,
                      child: HomeDropDownButton(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                      height: 80,
                      child: CustomButton(
                        onPressed: (){
                          Navigator.push(context, QuizPage.route()
                        );}, text: Text('スタート'),
                      ))
                  .animate(onPlay: (controller) => controller.repeat())
                  .shimmer(delay: 4000.ms, duration: 1800.ms)
                  .shake(hz: 4, curve: Curves.easeInOutCubic)
                  .scale(
                    begin: const Offset(1, 1),
                    end: const Offset(1.1, 1.1),
                    duration: 600.ms,
                  )
                  .then(delay: 600.ms)
                  .scale(
                    begin: const Offset(1, 1),
                    end: const Offset(1 / 1.1, 1 / 1.1),
                  ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: CustomButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            ProfilePage.route(),
                          );
                        },
                        icon: Icons.person_outline,
                        text:Text('プロフィール'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: CustomButton(
                        onPressed: () {
                          Navigator.push(context, RankingPage.route());
                        },
                        icon: Icons.emoji_events_outlined,
                        text: Text('ランキング'),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
