import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_text_style.dart';

/// アプリ全体のテーマ定義
/// Material Design 3に基づく統一されたテーマ設定
class AppTheme {
  // プライベートコンストラクタ（インスタンス化を防ぐ）
  AppTheme._();

  /// ライトテーマの取得
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      // カラースキーム
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.kPrimary,
        brightness: Brightness.light,
        primary: AppColors.kPrimary,
        secondary: AppColors.kSecondary,
        surface: AppColors.kSurface,
        error: AppColors.kError,
      ),

      // スキャフォールド背景色
      scaffoldBackgroundColor: AppColors.kBackground,

      // AppBarテーマ
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.kPrimary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),

      // カードテーマ
      cardTheme: CardThemeData(
        color: AppColors.kSurface,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.all(AppSpacing.kSpacing8),
      ),

      // ボタンテーマ
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimary,
          foregroundColor: Colors.white,
          elevation: 2.0,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.kButtonPadding,
            vertical: AppSpacing.kSpacing12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          textStyle: AppTextStyle.kLabelLarge,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.kPrimary,
          side: const BorderSide(color: AppColors.kPrimary),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.kButtonPadding,
            vertical: AppSpacing.kSpacing12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          textStyle: AppTextStyle.kLabelLarge,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.kPrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.kSpacing8,
            vertical: AppSpacing.kSpacing8,
          ),
          textStyle: AppTextStyle.kLabelLarge,
        ),
      ),

      // 入力フィールドテーマ
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.kSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.kTextHint),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.kTextHint),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.kPrimary, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.kError),
        ),
        contentPadding: const EdgeInsets.all(AppSpacing.kSpacing12),
        labelStyle: AppTextStyle.kBodyMedium.copyWith(
          color: AppColors.kTextSecondary,
        ),
        hintStyle: AppTextStyle.kBodyMedium.copyWith(
          color: AppColors.kTextHint,
        ),
      ),

      // ボトムナビゲーションテーマ
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.kSurface,
        selectedItemColor: AppColors.kPrimary,
        unselectedItemColor: AppColors.kTextSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8.0,
      ),

      // テキストテーマ
      textTheme: const TextTheme(
        displayLarge: AppTextStyle.kDisplayLarge,
        displayMedium: AppTextStyle.kDisplayMedium,
        headlineLarge: AppTextStyle.kHeadlineLarge,
        headlineMedium: AppTextStyle.kHeadlineMedium,
        headlineSmall: AppTextStyle.kHeadlineSmall,
        titleLarge: AppTextStyle.kTitleLarge,
        titleMedium: AppTextStyle.kTitleMedium,
        titleSmall: AppTextStyle.kTitleSmall,
        bodyLarge: AppTextStyle.kBodyLarge,
        bodyMedium: AppTextStyle.kBodyMedium,
        bodySmall: AppTextStyle.kBodySmall,
        labelLarge: AppTextStyle.kLabelLarge,
        labelMedium: AppTextStyle.kLabelMedium,
        labelSmall: AppTextStyle.kLabelSmall,
      ),

      // アイコンテーマ
      iconTheme: const IconThemeData(
        color: AppColors.kPrimary,
        size: 24.0,
      ),

      // ダイバーダーテーマ
      dividerTheme: const DividerThemeData(
        color: AppColors.kTextHint,
        thickness: 1.0,
        space: AppSpacing.kSpacing16,
      ),

      // リストタイルテーマ
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.kSpacing16,
          vertical: AppSpacing.kSpacing8,
        ),
        titleTextStyle: AppTextStyle.kBodyLarge,
        subtitleTextStyle: AppTextStyle.kBodyMedium,
      ),
    );
  }

  /// ダークテーマの取得（将来的な拡張用）
  static ThemeData get darkTheme {
    // 現在はライトテーマと同じ
    // 将来的にダークモード対応時に実装
    return lightTheme;
  }
}
