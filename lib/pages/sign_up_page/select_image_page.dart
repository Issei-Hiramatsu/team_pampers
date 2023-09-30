import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/features/file/file.dart';
import 'package:team_pampers/features/user/user.dart';
import 'package:team_pampers/pages/home_page/home_page.dart';
import 'package:team_pampers/utils/utils.dart';

class SelectImagePage extends HookConsumerWidget {
  const SelectImagePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const SelectImagePage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = useState<File?>(null);
    final profileImage = useState<Image?>(null);
    final loading = useState<bool>(false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorName.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'プロフィール画像を選択',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: GestureDetector(
                onTap: () async {
                  loading.value = true;
                  file.value = await pickImageAndUpload(ref: ref);
                  final image = await ref.read(getDownloadUrlProvider);
                  profileImage.value = image;
                  loading.value = false;
                },
                child: loading.value == false
                    ? profileImage.value != null
                        ? CircleAvatar(
                            radius: context.deviceWidth * 0.18,
                            backgroundImage: profileImage.value!.image,
                          )
                        : CircleAvatar(
                            radius: context.deviceWidth * 0.18,
                            child: const Icon(Icons.person),
                          )
                    : const CircularProgressIndicator(),
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await updateUserData(
                      file: file.value,
                      ref: ref,
                      context: context,
                    );
                  },
                  child: const Text('登録'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (profileImage.value != null) {
                      await deleteFile(
                        ref: ref,
                        context: context,
                      );
                    } else {
                      ScaffoldMessengerService.showSuccessSnackBar(
                        context,
                        '新規登録が完了しました!',
                      );
                      await Navigator.pushAndRemoveUntil(
                        context,
                        HomePage.route(),
                        (route) => false,
                      );
                    }
                  },
                  child: const Text('スキップ'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<File?> pickImageAndUpload({
    required WidgetRef ref,
  }) async {
    final file = await ref.read(pickImageAndUploadProvider);
    return file;
  }

  Future<void> updateUserData({
    required File? file,
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    await ref.read(updateUserDataProvider).call(
          file: file,
          onSuccess: () async {
            ScaffoldMessengerService.showSuccessSnackBar(
              context,
              '新規登録が完了しました!',
            );
            await Navigator.pushAndRemoveUntil(
              context,
              HomePage.route(),
              (route) => false,
            );
          },
        );
  }

  Future<void> deleteFile({
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    await ref.read(deleteFileProvider).call(
      onSuccess: () async {
        ScaffoldMessengerService.showSuccessSnackBar(
          context,
          '新規登録が完了しました!',
        );
        await Navigator.pushAndRemoveUntil(
          context,
          HomePage.route(),
          (route) => false,
        );
      },
    );
  }
}
