import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/features/user/user.dart';
import 'package:team_pampers/pages/ranking_page/components/ranking_card.dart';
import 'package:team_pampers/pages/sign_in_page/sign_in_page.dart';
import 'package:team_pampers/widgets/widgets.dart';

class RankingPage extends HookConsumerWidget {
  const RankingPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const RankingPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchUsers = ref.watch(fetchUsersDataProvider);
    return fetchUsers.when(
      data: (users) => users != null
          ? Scaffold(
              appBar: AppBar(
              ),
              body: Center(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    final user = users[index];
                    return SizedBox(
                      height: 72,
                      child: RankingCard(
                        number: index+1,
                        imageUrl: user.imageUrl ?? '',
                        userName: user.userName ?? '',
                        score: user.score ?? 1,
                      ),
                    );
                  },
                ),
              ),
            )
          : SignInPage(),
      error: (error, stackTrace) => ErrorPage(
        error: error,
        onTapReload: () => ref.invalidate(fetchUserDataProvider),
      ),
      loading: () => const Loading(),
    );
  }
}
