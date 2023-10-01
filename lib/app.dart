import 'package:flutter/material.dart';
import 'package:team_pampers/start_up_page.dart';
import 'package:team_pampers/widgets/widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
        ),
        useMaterial3: true,
      ),
      home: const StartUpPage(),
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MediaQuery(
            // 端末依存のフォントスケールを 1 に固定する
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: Stack(
              children: [
                if (child != null) child,
                const OverlayLoading(),
              ],
            ),
          ),
        );
      },
    );
  }
}
