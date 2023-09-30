import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/models/user_data.dart';
import 'package:team_pampers/repositories/user/user_repository_impl.dart';
import 'package:team_pampers/utils/utils.dart';
import 'package:team_pampers/widgets/widgets.dart';
final fetchUserDataProvider = FutureProvider.autoDispose<UserData?>(
      (ref) async {
    final read = ref.read;
    final isNetworkCheck = await isNetworkConnected();
    try {
      final response = await read(userRepositoryImplProvider).fetchUserData();
      return response;
    } on AppException catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('ユーザー情報取得エラー: $e');
      rethrow;
    }
  },
);

final updateUserDataProvider = Provider.autoDispose<
    Future<void> Function({
      File? file,
      required VoidCallback onSuccess,
    })>(
  (ref) => ({
    file,
    required onSuccess,
  }) async {
    final read = ref.read;
    final isNetworkCheck = await isNetworkConnected();
    try {
      read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      await read(userRepositoryImplProvider).updateUserData(
        file: file,
      );
      onSuccess();
      debugPrint('プロフィール画像の登録/情報の更新が完了しました');
    } on AppException catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('登録/更新エラー: $e');
    } finally {
      read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  },
);