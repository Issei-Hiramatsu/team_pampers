import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/features/user/user.dart';
import 'package:team_pampers/pages/profile_page/components/profile_components.dart';
import 'package:team_pampers/pages/sign_in_page/sign_in_page.dart';
import 'package:team_pampers/utils/utils.dart';
import 'package:team_pampers/widgets/widgets.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ProfilePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchUser = ref.watch(fetchUserDataProvider);
    return fetchUser.when(
      data: (user) => user != null
          ? Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileImageAvator(
                      imageUrl: user.imageUrl,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      '@${user.userName}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: context.deviceWidth * 0.5,
                      child: CustomButton(
                        onPressed: () {},
                        text: 'ランキング',
                        icon: Icons.emoji_events_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SignInPage(),
      error: (error, stackTrace) => ErrorPage(
        error: error,
        onTapReload: () => ref.invalidate(fetchUserDataProvider),
      ),
      loading: () => const Loading(),
    );
  }
}
