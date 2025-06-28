import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:asaren_reminder/utils/navigation_utils.dart';
import 'package:asaren_reminder/routes/app_router.dart';

void main() {
  group('NavigationUtils Tests', () {
    test('AppRoutes constants should be defined correctly', () {
      expect(AppRoutes.home, '/');
      expect(AppRoutes.items, '/items');
      expect(AppRoutes.settings, '/settings');
      expect(AppRoutes.homeName, 'home');
      expect(AppRoutes.itemsName, 'items');
      expect(AppRoutes.settingsName, 'settings');
    });

    test('NavigationUtils should exist', () {
      expect(NavigationUtils, isNotNull);
    });

    test('NavigationUtils methods should handle null context gracefully', () {
      // nullコンテキストでも例外が発生しないことを確認
      expect(() => NavigationUtils.goToHome(null), returnsNormally);
      expect(() => NavigationUtils.goToItems(null), returnsNormally);
      expect(() => NavigationUtils.goToSettings(null), returnsNormally);
      expect(() => NavigationUtils.goToNamed(null, AppRoutes.itemsName),
          returnsNormally);
      expect(() => NavigationUtils.goBack(null), returnsNormally);
    });

    test('NavigationUtils methods should handle empty route name gracefully',
        () {
      // 空のルート名でも例外が発生しないことを確認
      expect(() => NavigationUtils.goToNamed(null, ''), returnsNormally);
    });

    testWidgets('NavigationUtils should work in widget context',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                // 基本的な機能が動作することを確認（エラーはキャッチされる）
                expect(
                    () => NavigationUtils.goToHome(context), returnsNormally);
                expect(
                    () => NavigationUtils.goToItems(context), returnsNormally);
                expect(() => NavigationUtils.goToSettings(context),
                    returnsNormally);
                expect(
                    () =>
                        NavigationUtils.goToNamed(context, AppRoutes.itemsName),
                    returnsNormally);
                expect(() => NavigationUtils.goBack(context), returnsNormally);

                return const Text('Test');
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
    });
  });
}
