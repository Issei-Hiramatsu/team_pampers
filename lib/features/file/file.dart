import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/repositories/file/file_repository_impl.dart';
import 'package:team_pampers/utils/utils.dart';

final getDownloadUrlProvider = Provider.autoDispose<Future<Image>>(
  (ref) async {
    final read = ref.read;
    final isNetworkCheck = await isNetworkConnected();
    try {
      final response = await read(fileRepositoryImplProvider).getDownloadUrl();
      debugPrint('画像URL取得が完了しました');
      return response;
    } on AppException catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('画像URL取得エラー: $e');
      rethrow;
    }
  },
);

final pickImageAndUploadProvider = Provider.autoDispose<Future<File?>>(
  (ref) async {
    final read = ref.read;
    final isNetworkCheck = await isNetworkConnected();
    try {
      final response =
          await read(fileRepositoryImplProvider).pickImageAndUpload();
      debugPrint('画像アップロードが完了しました');
      return response;
    } on AppException catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('画像アップロードエラー: $e');
      rethrow;
    }
  },
);

final deleteFileProvider = Provider.autoDispose<
    Future<void> Function({
      required VoidCallback onSuccess,
    })>(
  (ref) => ({
    required onSuccess,
  }) async {
    final read = ref.read;
    final isNetworkCheck = await isNetworkConnected();
    try {
      await read(fileRepositoryImplProvider).deleteFile();
      debugPrint('画像を削除しました。');
      onSuccess();
    } on AppException catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('画像の削除エラー: $e');
      rethrow;
    }
  },
);
