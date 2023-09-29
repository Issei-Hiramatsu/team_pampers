import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/widgets/custom_text_field.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const SignInPage(),
    );
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                const SizedBox(
                  height: 60,
                ),
                // CustomTextField(
                //     onChanged: ,
                //     controller: ,
                //     labelText: 'メールアドレス'),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail),
                    labelText: 'メールアドレス'
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'パスワード'
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                    onPressed: (){}, child: const Text('ログイン'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(double.maxFinite),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
