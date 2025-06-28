import 'package:flutter_test/flutter_test.dart';
import 'package:asaren_reminder/theme/app_spacing.dart';

void main() {
  group('AppSpacing', () {
    test('should have valid spacing values', () {
      expect(AppSpacing.kSpacing4, equals(4.0));
      expect(AppSpacing.kSpacing8, equals(8.0));
      expect(AppSpacing.kSpacing16, equals(16.0));
      expect(AppSpacing.kSpacing24, equals(24.0));
      expect(AppSpacing.kSpacing32, equals(32.0));
    });

    test('should have valid layout spacing values', () {
      expect(AppSpacing.kDefaultPadding, equals(AppSpacing.kSpacing16));
      expect(AppSpacing.kCardPadding, equals(AppSpacing.kSpacing16));
      expect(AppSpacing.kScreenPadding, equals(AppSpacing.kSpacing24));
      expect(AppSpacing.kButtonPadding, equals(AppSpacing.kSpacing16));
    });

    test('should have valid component spacing values', () {
      expect(AppSpacing.kComponentSpacing, equals(AppSpacing.kSpacing8));
      expect(AppSpacing.kSectionSpacing, equals(AppSpacing.kSpacing24));
      expect(AppSpacing.kListSpacing, equals(AppSpacing.kSpacing12));
    });
  });
}
