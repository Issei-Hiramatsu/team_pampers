import 'package:flutter/material.dart';
import 'package:team_pampers/pages/home_page/home_page.dart';

class ClosedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ClosedAppBar({
    super.key,
    this.bottom,
  });

  final PreferredSizeWidget? bottom;
  @override
  Size get preferredSize => const Size.fromHeight(90);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context)
                  .pushAndRemoveUntil(HomePage.route(), (route) => false);
              // アイコンがタップされたときの処理
              // 通常は画面を閉じる操作などがここに記述されます
            },
          ),
        ),
      ),
    );
  }
}
