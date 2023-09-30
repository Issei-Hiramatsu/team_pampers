import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            onTap: () {},
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
