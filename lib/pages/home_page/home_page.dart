import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/pages/home_page/components/home_button.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:team_pampers/pages/quiz_page/quiz_page.dart';
import 'package:team_pampers/widgets/drawer.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
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
              SizedBox(
                      height: 80,
                      child: HomePageButton(
                          onPressed: () {
                            Navigator.push(context, QuizPage.route());
                          },
                          text: 'START'))
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
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: HomePageButton(
                        onPressed: () {},
                        icon: Icons.person_outline,
                        text: 'Profile',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: HomePageButton(
                        onPressed: () {},
                        icon: Icons.emoji_events_outlined,
                        text: 'Ranking',
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
