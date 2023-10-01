import 'package:flutter/material.dart';

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
      actions: [
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // アイコンがタップされたときの処理
            // 通常は画面を閉じる操作などがここに記述されます
          },
        ),
      ],
    );
  }
}
