# 🎨 UI/UXデザイン指針 - 朝連リマインダー

このドキュメントは、Flutterアプリ「朝連リマインダー」のUI/UX設計における指針とテーマ設計のガイドラインをまとめたものです。

## 目的

子どもの保育園・小学校生活を支援するため、忙しい朝でも直感的かつ安心して使えるデザインを実現すること。

---

## 💡 デザイン原則

- シンプルで迷わない操作フロー
- 朝の準備中でも直感的に確認できる
- 子どもも一緒に使いたくなる可愛らしさ
- 色覚バリアフリーも考慮した配色

---

## 🌈 カラーパレット

- **メインカラー**：優しいグリーン系
- **アクセントカラー**：温かみのあるピーチ系
- **背景色**：白またはライトグレー
- **テキスト**：ダークグレー

```dart
// 色定義
static const Color kPrimaryLight = Color(0xFF81C784);  // ライトグリーン
static const Color kPrimary       = Color(0xFF66BB6A);  // メイングリーン
static const Color kPrimaryDark  = Color(0xFF4CAF50);  // ダークグリーン

static const Color kSecondaryLight = Color(0xFFFFCC80);  // ライトピーチ
static const Color kSecondary      = Color(0xFFFFB74D);  // メインピーチ
static const Color kSecondaryDark  = Color(0xFFFF9800);  // ダークピーチ

static const Color kSuccess = Color(0xFF66BB6A);  // グリーン系の成功色
static const Color kWarning = Color(0xFFFFB74D);  // ピーチ系の警告色
static const Color kError   = Color(0xFFEF5350);  // ソフトな赤系エラー色
```

この新しいカラーパレットの特徴：

**メイングリーン系（kPrimary）**
- 自然で安心感のある色合い
- 朝の準備というテーマにぴったり
- 目に優しく、長時間見ていても疲れにくい

**アクセントピーチ系（kSecondary）**
- グリーンと調和する温かみのある色
- 子どもの可愛らしさを表現
- 重要な要素を際立たせるのに適している

**調整された機能色**
- 成功色：グリーン系に統一して一貫性を保持
- 警告色：ピーチ系で温かみのある注意喚起
- エラー色：少しソフトな赤で過度に緊張感を与えない

この配色は朝の準備という日常的なタスクに適しており、子どもと一緒に使うアプリとしても親しみやすい色合いになっています。

---

## 📐 レイアウト指針

### グリッド＆スペーシング

- **8dp Grid System**：基本単位
- **16dp Baseline Grid**：テキスト配置
- **24dp Padding**：外枠余白

```dart
// スペーシング定数
static const double kSpacing4  = 4.0;
static const double kSpacing8  = 8.0;
static const double kSpacing16 = 16.0;
static const double kSpacing24 = 24.0;
static const double kSpacing32 = 32.0;
```

---

## 🖋 タイポグラフィ

- **Display Large**：アプリタイトル（32sp）
- **Headline Large**：画面タイトル（28sp）
- **Body Large**：本文（16sp）
- **Label Small**：ラベル（11sp）

### フォントウェイト

- Regular：標準
- Medium：補足・強調
- Bold：セクションタイトル

---

## 🧩 コンポーネント設計

### カード
- Elevation：2dp〜4dp
- Border Radius：12dp
- Padding：16dp

### ボタン
- Filled：メイン操作
- Outlined：副次操作
- IconButton：簡易操作

### 入力フィールド
- Outlined：標準
- Floating Label：ラベル表示付き

---

## 🎥 アニメーションとフィードバック

- Duration：標準300ms、速い200ms、遅い400ms
- Curve：`Curves.easeInOut`
- RippleEffect / Fade / Scale を適所に活用

---

## ♿ アクセシビリティ

- テキスト：コントラスト比 4.5:1以上
- タッチターゲット：48dp以上
- フォント：14sp以上を推奨
- UI要素間隔：8dp以上

---

## 🌙 ダークモード対応

```dart
// ライトモード
static const Color kSurfaceLight    = Color(0xFFFFFFFF);
static const Color kOnSurfaceLight = Color(0xFF1C1B1F);

// ダークモード
static const Color kSurfaceDark    = Color(0xFF1C1B1F);
static const Color kOnSurfaceDark = Color(0xFFE6E1E5);
```

- システムテーマに追従 + 手動切り替えオプションも検討中

---

## 🧭 実装例（Material 3）

```dart
MaterialApp(
  theme: ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: kPrimary,
    ),
  ),
);
```

---

このドキュメントは今後のUI開発における共通理解として使用され、必要に応じてアップデートされます。
