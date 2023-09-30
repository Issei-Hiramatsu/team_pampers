import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/features/auth/auth.dart';
import 'package:team_pampers/pages/sign_up_page/select_image_page.dart';
import 'package:team_pampers/utils/utils.dart';
import 'package:team_pampers/widgets/widgets.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  static Route<dynamic> route(
    String email,
    String password,
  ) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => SignUpPage(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameController = useTextEditingController();

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
                  'ユーザー情報',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomTextField(
                  controller: userNameController,
                  keyboardType: TextInputType.name,
                  labelText: 'ユーザーネーム',
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (email.isEmpty ||
                        password.isEmpty ||
                        userNameController.text.isEmpty) {
                      return context.showSnackBar('ユーザー情報を入力してください');
                    } else {
                      await ref.read(signUpProvider).call(
                            userName: userNameController.text,
                            email: email,
                            password: password,
                            onSuccess: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                SelectImagePage.route(),
                                (_) => false,
                              );
                            },
                          );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(double.maxFinite),
                  ),
                  child: const Text('新規登録'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
