import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:asaren_reminder/theme/app_colors.dart';

void main() {
  group('AppColors', () {
    test('should have valid primary colors', () {
      expect(AppColors.kPrimaryLight, isA<Color>());
      expect(AppColors.kPrimary, isA<Color>());
      expect(AppColors.kPrimaryDark, isA<Color>());
    });

    test('should have valid secondary colors', () {
      expect(AppColors.kSecondaryLight, isA<Color>());
      expect(AppColors.kSecondary, isA<Color>());
      expect(AppColors.kSecondaryDark, isA<Color>());
    });

    test('should have valid functional colors', () {
      expect(AppColors.kSuccess, isA<Color>());
      expect(AppColors.kWarning, isA<Color>());
      expect(AppColors.kError, isA<Color>());
    });

    test('should have valid text colors', () {
      expect(AppColors.kTextPrimary, isA<Color>());
      expect(AppColors.kTextSecondary, isA<Color>());
      expect(AppColors.kTextHint, isA<Color>());
    });

    test('should have valid background colors', () {
      expect(AppColors.kBackground, isA<Color>());
      expect(AppColors.kSurface, isA<Color>());
    });
  });
}
