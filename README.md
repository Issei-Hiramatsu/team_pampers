# team_pampers

## 環境構築

## リポジトリの複製
```bash
git clone https://github.com/Issei-Hiramatsu/team_pampers.git
```


## FVMの導入
FVMをインストールしていない場合、 下記記事を参考に設定する。

* Mac https://zenn.dev/riscait/articles/flutter-version-management
* Windows https://qiita.com/idani/items/0e45d037b4c2a93840a7

## プロジェクトでのバージョン適用
```bash
fvm use 3.13.5
```


## バージョン
```bash
fvm flutter --version

Flutter 3.13.5 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 12fccda598 (7 days ago) • 2023-09-19 13:56:11 -0700
Engine • revision bd986c5ed2
Tools • Dart 3.1.2 • DevTools 2.25.0
```

## コードの自動生成
- `freezed`や`gen`を使ったファイルを変更・追加した場合は下記のコマンドを実行する。
```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs

```
# Hackathon
