import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:team_pampers/models/user_data.dart';
import 'package:team_pampers/repositories/auth/auth_repository_impl.dart';
import 'package:team_pampers/utils/utils.dart';
import 'package:team_pampers/widgets/widgets.dart';

final signUpProvider = Provider.autoDispose<
    Future<void> Function({
      required String email,
      required String userName,
      required String password,
      required VoidCallback onSuccess,
    })>(
  (ref) => ({
    required email,
    required userName,
    required password,
    required onSuccess,
  }) async {
    final read = ref.read;
    final isNetworkCheck = await isNetworkConnected();
    try {
      read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      await read(authRepositoryImplProvider).signUp(
        userData: UserData(
          email: email,
          userName: userName,
          createdAt: DateTime.now(),
        ),
        password: password,
      );
      onSuccess();
      debugPrint('新規登録しました');
    } on FirebaseAuthException catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }

      if (userName.isEmpty || email.isEmpty || password.isEmpty) {
        const exception = AppException(
          message: 'Please input your user name, email, and password.',
        );
        throw exception;
      }
      debugPrint('新規登録エラー: $e');
    } finally {
      read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  },
);

final signInProvider = Provider.autoDispose<
    Future<void> Function({
      required String email,
      required String password,
      required VoidCallback onSuccess,
    })>(
  (ref) => ({
    required email,
    required password,
    required onSuccess,
  }) async {
    final read = ref.read;
    final isNetworkCheck = await isNetworkConnected();
    try {
      read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      await read(authRepositoryImplProvider).signIn(
        email: email,
        password: password,
      );
      onSuccess();
      debugPrint('ログインしました');
    } on FirebaseAuthException catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }

      if (email.isEmpty || password.isEmpty) {
        const exception = AppException(
          message: 'Please input your email and password.',
        );
        throw exception;
      }
      debugPrint('ログインエラー: $e');
    } finally {
      read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  },
);

final signOutProvider = Provider.autoDispose<
    Future<void> Function({
      required VoidCallback onSuccess,
    })>(
  (ref) => ({
    required onSuccess,
  }) async {
    final read = ref.read;
    final isNetworkCheck = await isNetworkConnected();
    try {
      read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      await read(authRepositoryImplProvider).signOut();
      onSuccess();
      debugPrint('ログアウトしました');
    } on AppException catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }
      debugPrint('ログアウトエラー: $e');
    } finally {
      read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  },
);

final sendResetPasswordEmailProvider = Provider.autoDispose<
    Future<void> Function({
      required String email,
      required VoidCallback onSuccess,
    })>(
  (ref) => ({
    required email,
    required onSuccess,
  }) async {
    final read = ref.read;
    final isNetworkCheck = await isNetworkConnected();
    try {
      read(overlayLoadingWidgetProvider.notifier).update((state) => true);
      await read(authRepositoryImplProvider).sendPasswordResetEmail(
        email: email,
      );
      onSuccess();
      debugPrint('メールを送信しました');
    } on AppException catch (e) {
      if (!isNetworkCheck) {
        const exception = AppException(
          message: 'Maybe your network is disconnected. Please check yours.',
        );
        throw exception;
      }

      if (email.isEmpty) {
        const exception = AppException(
          message: 'Please input your email.',
        );
        throw exception;
      }
      debugPrint('パスワードリセットエラー: $e');
    } finally {
      read(overlayLoadingWidgetProvider.notifier).update((state) => false);
    }
  },
);
