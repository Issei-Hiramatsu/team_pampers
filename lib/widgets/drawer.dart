import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/features/auth/auth.dart';

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
                    onSuccess: () {},
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
