import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/features/auth/auth.dart';
import 'package:team_pampers/pages/sign_in_page/sign_in_page.dart';

class CustomDrawer extends HookConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            onTap: () {
              ref.read(signOutProvider).call(
                onSuccess: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    SignInPage.route(),
                    (_) => false,
                  );
                },
              );
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              'ログアウト',
            ),
          ),
        ],
      ),
    );
  }
}
