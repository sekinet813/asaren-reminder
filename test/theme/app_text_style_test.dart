import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:asaren_reminder/theme/app_text_style.dart';
import 'package:asaren_reminder/theme/app_colors.dart';

void main() {
  group('AppTextStyle', () {
    test('should have valid display styles', () {
      expect(AppTextStyle.kDisplayLarge.fontSize, equals(32.0));
      expect(AppTextStyle.kDisplayLarge.fontWeight, equals(FontWeight.bold));
      expect(AppTextStyle.kDisplayLarge.color, equals(AppColors.kTextPrimary));

      expect(AppTextStyle.kDisplayMedium.fontSize, equals(28.0));
      expect(AppTextStyle.kDisplayMedium.fontWeight, equals(FontWeight.bold));
    });

    test('should have valid headline styles', () {
      expect(AppTextStyle.kHeadlineLarge.fontSize, equals(28.0));
      expect(AppTextStyle.kHeadlineLarge.fontWeight, equals(FontWeight.bold));

      expect(AppTextStyle.kHeadlineMedium.fontSize, equals(24.0));
      expect(AppTextStyle.kHeadlineMedium.fontWeight, equals(FontWeight.w600));

      expect(AppTextStyle.kHeadlineSmall.fontSize, equals(20.0));
      expect(AppTextStyle.kHeadlineSmall.fontWeight, equals(FontWeight.w600));
    });

    test('should have valid body styles', () {
      expect(AppTextStyle.kBodyLarge.fontSize, equals(16.0));
      expect(AppTextStyle.kBodyLarge.fontWeight, equals(FontWeight.normal));

      expect(AppTextStyle.kBodyMedium.fontSize, equals(14.0));
      expect(AppTextStyle.kBodyMedium.fontWeight, equals(FontWeight.normal));

      expect(AppTextStyle.kBodySmall.fontSize, equals(12.0));
      expect(AppTextStyle.kBodySmall.fontWeight, equals(FontWeight.normal));
    });

    test('should have valid label styles', () {
      expect(AppTextStyle.kLabelLarge.fontSize, equals(14.0));
      expect(AppTextStyle.kLabelLarge.fontWeight, equals(FontWeight.w500));

      expect(AppTextStyle.kLabelMedium.fontSize, equals(12.0));
      expect(AppTextStyle.kLabelMedium.fontWeight, equals(FontWeight.w500));

      expect(AppTextStyle.kLabelSmall.fontSize, equals(11.0));
      expect(AppTextStyle.kLabelSmall.fontWeight, equals(FontWeight.w500));
    });

    test('should have valid special purpose styles', () {
      expect(AppTextStyle.kCaption.fontSize, equals(12.0));
      expect(AppTextStyle.kCaption.color, equals(AppColors.kTextHint));

      expect(AppTextStyle.kOverline.fontSize, equals(10.0));
      expect(AppTextStyle.kOverline.fontWeight, equals(FontWeight.w500));
      expect(AppTextStyle.kOverline.letterSpacing, equals(1.5));
    });
  });
}
