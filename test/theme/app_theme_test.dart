import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:asaren_reminder/theme/app_theme.dart';
import 'package:asaren_reminder/theme/app_colors.dart';
import 'package:asaren_reminder/theme/app_spacing.dart';
import 'package:asaren_reminder/theme/app_text_style.dart';

void main() {
  group('AppTheme', () {
    test('lightTheme should return valid ThemeData', () {
      final theme = AppTheme.lightTheme;

      expect(theme, isA<ThemeData>());
      expect(theme.useMaterial3, isTrue);
      expect(theme.colorScheme.primary, equals(AppColors.kPrimary));
      expect(theme.colorScheme.secondary, equals(AppColors.kSecondary));
    });

    test('lightTheme should have correct scaffold background color', () {
      final theme = AppTheme.lightTheme;

      expect(theme.scaffoldBackgroundColor, equals(AppColors.kBackground));
    });

    test('lightTheme should have correct app bar theme', () {
      final theme = AppTheme.lightTheme;
      final appBarTheme = theme.appBarTheme;

      expect(appBarTheme.backgroundColor, equals(AppColors.kPrimary));
      expect(appBarTheme.foregroundColor, equals(Colors.white));
      expect(appBarTheme.elevation, equals(0));
      expect(appBarTheme.centerTitle, isTrue);
    });

    test('lightTheme should have correct card theme', () {
      final theme = AppTheme.lightTheme;
      final cardTheme = theme.cardTheme;

      expect(cardTheme.color, equals(AppColors.kSurface));
      expect(cardTheme.elevation, equals(2.0));
      expect(
          cardTheme.margin, equals(const EdgeInsets.all(AppSpacing.kSpacing8)));
    });

    test('lightTheme should have correct text theme properties', () {
      final theme = AppTheme.lightTheme;
      final textTheme = theme.textTheme;

      // テキストスタイルの主要プロパティを個別にテスト
      expect(textTheme.displayLarge?.fontSize,
          equals(AppTextStyle.kDisplayLarge.fontSize));
      expect(textTheme.displayLarge?.fontWeight,
          equals(AppTextStyle.kDisplayLarge.fontWeight));
      expect(textTheme.displayLarge?.color,
          equals(AppTextStyle.kDisplayLarge.color));
      expect(textTheme.displayLarge?.height,
          equals(AppTextStyle.kDisplayLarge.height));

      expect(textTheme.headlineLarge?.fontSize,
          equals(AppTextStyle.kHeadlineLarge.fontSize));
      expect(textTheme.headlineLarge?.fontWeight,
          equals(AppTextStyle.kHeadlineLarge.fontWeight));
      expect(textTheme.headlineLarge?.color,
          equals(AppTextStyle.kHeadlineLarge.color));
      expect(textTheme.headlineLarge?.height,
          equals(AppTextStyle.kHeadlineLarge.height));

      expect(textTheme.bodyLarge?.fontSize,
          equals(AppTextStyle.kBodyLarge.fontSize));
      expect(textTheme.bodyLarge?.fontWeight,
          equals(AppTextStyle.kBodyLarge.fontWeight));
      expect(textTheme.bodyLarge?.color, equals(AppTextStyle.kBodyLarge.color));
      expect(
          textTheme.bodyLarge?.height, equals(AppTextStyle.kBodyLarge.height));

      expect(textTheme.labelLarge?.fontSize,
          equals(AppTextStyle.kLabelLarge.fontSize));
      expect(textTheme.labelLarge?.fontWeight,
          equals(AppTextStyle.kLabelLarge.fontWeight));
      expect(
          textTheme.labelLarge?.color, equals(AppTextStyle.kLabelLarge.color));
      expect(textTheme.labelLarge?.height,
          equals(AppTextStyle.kLabelLarge.height));
    });

    test('darkTheme should return valid ThemeData', () {
      final theme = AppTheme.darkTheme;

      expect(theme, isA<ThemeData>());
      // 現在はライトテーマと同じ
      expect(theme.useMaterial3, isTrue);
    });
  });
}
