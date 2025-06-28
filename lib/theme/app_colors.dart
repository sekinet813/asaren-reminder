import 'package:flutter/material.dart';

/// アプリ全体で使用するカラーパレット
/// デザイン指針に基づく統一された色定義
class AppColors {
  // プライベートコンストラクタ（インスタンス化を防ぐ）
  AppColors._();

  // メインカラー（優しいグリーン系）
  static const Color kPrimaryLight = Color(0xFF81C784); // ライトグリーン
  static const Color kPrimary = Color(0xFF66BB6A); // メイングリーン
  static const Color kPrimaryDark = Color(0xFF4CAF50); // ダークグリーン

  // アクセントカラー（温かみのあるピーチ系）
  static const Color kSecondaryLight = Color(0xFFFFCC80); // ライトピーチ
  static const Color kSecondary = Color(0xFFFFB74D); // メインピーチ
  static const Color kSecondaryDark = Color(0xFFFF9800); // ダークピーチ

  // 機能色
  static const Color kSuccess = Color(0xFF66BB6A); // グリーン系の成功色
  static const Color kWarning = Color(0xFFFFB74D); // ピーチ系の警告色
  static const Color kError = Color(0xFFEF5350); // ソフトな赤系エラー色

  // テキスト色
  static const Color kTextPrimary = Color(0xFF1C1B1F); // ダークグレー
  static const Color kTextSecondary = Color(0xFF666666); // グレー
  static const Color kTextHint = Color(0xFF999999); // ライトグレー

  // 背景色
  static const Color kBackground = Color(0xFFFAFAFA); // ライトグレー
  static const Color kSurface = Color(0xFFFFFFFF); // 白

  // ダークモード対応（将来的な拡張用）
  static const Color kSurfaceDark = Color(0xFF1C1B1F);
  static const Color kOnSurfaceDark = Color(0xFFE6E1E5);
}
