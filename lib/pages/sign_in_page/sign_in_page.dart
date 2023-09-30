import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/features/auth/auth.dart';
import 'package:team_pampers/pages/home_page/home_page.dart';
import 'package:team_pampers/pages/reset_password_page/reset_password_page.dart';
import 'package:team_pampers/pages/sign_up_page/sign_up_page.dart';
import 'package:team_pampers/utils/utils.dart';
import 'package:team_pampers/widgets/widgets.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const SignInPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordFocusNode = useFocusNode();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                CustomTextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(passwordFocusNode),
                  textInputAction: TextInputAction.next,
                  labelText: 'メールアドレス',
                  icon: Icons.mail,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: passwordFocusNode,
                  textInputAction: TextInputAction.done,
                  labelText: 'パスワード',
                  icon: Icons.lock,
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      return context.showSnackBar('メールアドレスとパスワードを入力してください');
                    } else {
                      await ref.read(signInProvider).call(
                            email: emailController.text,
                            password: passwordController.text,
                            onSuccess: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                HomePage.route(),
                                (_) => false,
                              );
                            },
                          );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(double.maxFinite),
                  ),
                  child: const Text('ログイン'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      return context.showSnackBar('メールアドレスとパスワードを入力してください');
                    } else {
                      Navigator.push(
                        context,
                        SignUpPage.route(
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(double.maxFinite),
                  ),
                  child: const Text('新規登録'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      ResetPasswordPage.route(),
                    );
                  },
                  child: const Text('パスワードを忘れた方はこちら'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
