import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/pages/home_page/home_page.dart';
import 'package:team_pampers/pages/sign_in_page/sign_in_page.dart';
import 'package:team_pampers/repositories/auth/auth_repository_impl.dart';
import 'package:team_pampers/widgets/widgets.dart';

class StartUpPage extends HookConsumerWidget {
  const StartUpPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(authUserProvider).when(
            data: (data) =>
                data != null ? const HomePage() : const SignInPage(),
            error: (error, stackTrace) => ErrorPage(
              error: error,
              onTapReload: () => ref.invalidate(authUserProvider),
            ),
            loading: () => const Loading(),
          ),
    );
  }
}
