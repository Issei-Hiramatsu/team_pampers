import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferencesKey { accessToken, uid, client }

/// SharedPreferences のインスタンスを提供するプロバイダ。
/// ProviderScope の overrides 一で使用する。
final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());

/// SharedPreferences によるデータの読み書きをするServiceクラスを提供するプロバイダ
final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesService(ref, sharedPreferences);
});

class SharedPreferencesService {
  SharedPreferencesService(this.ref, this.sharedPreferences);

  final ProviderRef<SharedPreferencesService> ref;
  final SharedPreferences sharedPreferences;

}
