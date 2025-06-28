import 'package:flutter/material.dart';
import 'app_colors.dart';

/// アプリ全体で使用するタイポグラフィ定義
/// Material Design 3に基づく統一されたテキストスタイル
class AppTextStyle {
  // プライベートコンストラクタ（インスタンス化を防ぐ）
  AppTextStyle._();

  // Display Styles
  static const TextStyle kDisplayLarge = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: AppColors.kTextPrimary,
    height: 1.25,
  );

  static const TextStyle kDisplayMedium = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: AppColors.kTextPrimary,
    height: 1.29,
  );

  // Headline Styles
  static const TextStyle kHeadlineLarge = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: AppColors.kTextPrimary,
    height: 1.29,
  );

  static const TextStyle kHeadlineMedium = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: AppColors.kTextPrimary,
    height: 1.33,
  );

  static const TextStyle kHeadlineSmall = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: AppColors.kTextPrimary,
    height: 1.4,
  );

  // Title Styles
  static const TextStyle kTitleLarge = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.kTextPrimary,
    height: 1.33,
  );

  static const TextStyle kTitleMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.kTextPrimary,
    height: 1.5,
  );

  static const TextStyle kTitleSmall = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.kTextPrimary,
    height: 1.43,
  );

  // Body Styles
  static const TextStyle kBodyLarge = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.kTextPrimary,
    height: 1.5,
  );

  static const TextStyle kBodyMedium = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.kTextPrimary,
    height: 1.43,
  );

  static const TextStyle kBodySmall = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.kTextSecondary,
    height: 1.33,
  );

  // Label Styles
  static const TextStyle kLabelLarge = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.kTextPrimary,
    height: 1.43,
  );

  static const TextStyle kLabelMedium = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppColors.kTextSecondary,
    height: 1.33,
  );

  static const TextStyle kLabelSmall = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    color: AppColors.kTextHint,
    height: 1.45,
  );

  // 特殊用途のスタイル
  static const TextStyle kCaption = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.kTextHint,
    height: 1.33,
  );

  static const TextStyle kOverline = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
    color: AppColors.kTextHint,
    height: 1.6,
    letterSpacing: 1.5,
  );
}
