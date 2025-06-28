# 朝連リマインダー

子育て家庭を支援する、Flutter製の持ち物リマインダーアプリです。

![Platform](https://img.shields.io/badge/platform-Flutter-blue)
![Status](https://img.shields.io/badge/status-WIP-orange)
![Version](https://img.shields.io/badge/version-1.0.0-green)

---

## 🌱 アプリの概要

**朝連リマインダー** は、保育園や小学校に通う子どもがいる家庭をサポートするアプリです。  
毎朝、その日に必要な持ち物やイベントを確認・リマインドできる機能を提供します。

### 🧸 主な特徴

- 保育園・小学校の「持ち物／イベントリスト」を登録・編集
- 子どもごとにリストを分けて管理
- 当日の持ち物やイベントを毎朝表示（チェックリスト形式）
- すべて端末内に保存され、オフラインでも使える
- 直感的で使いやすいUI/UX

---

## 🛠 使用技術

| 技術       | バージョン | 説明                                 |
|------------|------------|--------------------------------------|
| Flutter    | 3.8.1+     | クロスプラットフォーム開発           |
| Dart       | 3.8.1+     | 使用言語                             |
| sqflite    | 未実装     | ローカルDB（SQLite）でのデータ保存   |
| path_provider | 未実装 | SQLiteファイルの保存先取得に使用     |

---

## 📱 対応プラットフォーム

- ✅ Android
- ✅ iOS  
- ✅ Web

---

## 🚀 セットアップ・開発環境

### 前提条件

- Flutter SDK 3.8.1以上
- Dart SDK 3.8.1以上
- Android Studio / VS Code
- Git

### インストール手順

1. **リポジトリのクローン**
   ```bash
   git clone https://github.com/your-username/asaren-reminder.git
   cd asaren-reminder
   ```

2. **依存関係のインストール**
   ```bash
   flutter pub get
   ```

3. **アプリの実行**
   ```bash
   flutter run
   ```

### 開発用コマンド

```bash
# 依存関係の更新
flutter pub upgrade

# コードの静的解析
flutter analyze

# テストの実行
flutter test

# ビルド（Android）
flutter build apk

# ビルド（iOS）
flutter build ios
```

---

## 🔧 開発者向け情報

### Pre-commitフック

このプロジェクトにはpre-commitフックが設定されており、コミット前に自動的に以下のチェックが実行されます：

- `flutter analyze` - コードの静的解析
- `dart format --set-exit-if-changed .` - コードフォーマットの確認

#### Pre-commitフックの手動実行

```bash
# コミット前のチェックを手動で実行
make pre-commit

# または個別に実行
make format    # フォーマットチェックのみ
make analyze   # 静的解析のみ
```

#### フォーマットエラーの修正

フォーマットエラーが発生した場合：

```bash
# コードを自動フォーマット
dart format .

# または
make format
```

### Makefileコマンド

プロジェクトには便利なMakefileコマンドが用意されています：

```bash
make deps      # 依存関係のインストール
make test      # テストの実行
make clean     # ビルドアーティファクトの削除
make build     # 全プラットフォーム向けビルド
```

### テストカバレッジ

テストカバレッジを確認するには：

```bash
# テストカバレッジを実行
flutter test --coverage

# カバレッジレポートを生成（genhtmlが必要）
genhtml coverage/lcov.info -o coverage/html
```

---

## 📋 機能一覧

### 実装予定機能

- [ ] 子どものプロフィール管理
- [ ] 持ち物リストの作成・編集
- [ ] イベントカレンダー機能
- [ ] 朝のリマインド機能
- [ ] チェックリスト機能
- [ ] データのエクスポート・インポート
- [ ] テーマカスタマイズ

### 将来の機能

- [ ] 複数家族での共有機能
- [ ] クラウド同期
- [ ] プッシュ通知
- [ ] 写真付き持ち物管理
- [ ] 統計・レポート機能

---

## 🏗 プロジェクト構造

```
asaren-reminder/
├── lib/
│ ├── main.dart # アプリのエントリーポイント
│ ├── models/ # データモデル
│ ├── screens/ # UI画面
│ ├── widgets/ # 再利用可能なウィジェット
│ ├── services/ # ビジネスロジック
│ ├── utils/ # ユーティリティ関数
│ └── constants/ # 定数定義
├── test/ # テストファイル
├── android/ # Android固有の設定
├── ios/ # iOS固有の設定
├── web/ # Web固有の設定
```