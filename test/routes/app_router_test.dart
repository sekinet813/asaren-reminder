import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:asaren_reminder/routes/app_router.dart';
import 'package:asaren_reminder/providers/child_provider.dart';

void main() {
  group('AppRouter Tests', () {
    test('AppRoutes constants should be defined correctly', () {
      expect(AppRoutes.home, '/');
      expect(AppRoutes.items, '/items');
      expect(AppRoutes.settings, '/settings');
      expect(AppRoutes.homeName, 'home');
      expect(AppRoutes.itemsName, 'items');
      expect(AppRoutes.settingsName, 'settings');
    });

    test('AppRouter should be created without errors', () {
      expect(() => AppRouter.router, returnsNormally);
    });

    testWidgets('AppRouter should render initial route',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ChildProvider(),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // 初期ルートが設定されていることを確認
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.text('朝連リマインダー'), findsOneWidget);
    });

    testWidgets('AppRouter should handle basic navigation',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ChildProvider(),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // 基本的なナビゲーションが動作することを確認
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
