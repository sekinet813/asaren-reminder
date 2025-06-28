import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:asaren_reminder/screens/home_screen.dart';
import 'package:asaren_reminder/utils/constants.dart';
import 'package:asaren_reminder/providers/child_provider.dart';

void main() {
  group('HomeScreen Widget Tests', () {
    late Widget app;

    setUp(() {
      app = MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ChildProvider(),
          ),
        ],
        child: const MaterialApp(home: HomeScreen()),
      );
    });

    testWidgets('should display home screen with correct elements', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(app);

      // アプリ名が表示されることを確認
      expect(find.text(AppConstants.kAppName), findsOneWidget);

      // 説明文が表示されることを確認
      expect(find.text('子育て家庭を支援する持ち物リマインダー'), findsOneWidget);

      // 主な機能のタイトルが表示されることを確認
      expect(find.text('主な機能'), findsOneWidget);

      // 機能説明が表示されることを確認
      expect(find.text('子どもの管理'), findsOneWidget);
      expect(find.text('複数の子どもを登録・管理できます'), findsOneWidget);
      expect(find.text('持ち物リスト'), findsOneWidget);
      expect(find.text('子どもごとの持ち物を管理できます'), findsOneWidget);
      expect(find.text('予定管理'), findsOneWidget);
      expect(find.text('学校行事やイベントの予定を管理できます'), findsOneWidget);
    });

    testWidgets('should display bottom navigation bar with correct items', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(app);

      // BottomNavigationBarが表示されることを確認
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // ナビゲーションアイテムが正しく表示されることを確認
      expect(find.text('ホーム'), findsOneWidget);
      expect(find.text('持ち物'), findsOneWidget);
      expect(find.text('設定'), findsOneWidget);

      // アイコンが表示されることを確認
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.list), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets(
      'should handle bottom navigation taps without errors',
      (WidgetTester tester) async {
        await tester.pumpWidget(app);

        // 初期状態ではホーム画面が表示される
        expect(find.text('子育て家庭を支援する持ち物リマインダー'), findsOneWidget);

        // 持ち物タブをタップ（エラーが発生しないことを確認）
        await tester.tap(find.text('持ち物'));
        await tester.pumpAndSettle();

        // 設定タブをタップ（アイコンで検索）
        final bottomNavBar = find.byType(BottomNavigationBar);
        final settingsItem = find.descendant(
          of: bottomNavBar,
          matching: find.byIcon(Icons.settings),
        );
        await tester.tap(settingsItem);
        await tester.pumpAndSettle();

        // ホームタブをタップ（アイコンで検索）
        final homeItem = find.descendant(
          of: bottomNavBar,
          matching: find.byIcon(Icons.home),
        );
        await tester.tap(homeItem);
        await tester.pumpAndSettle();

        // ホーム画面が再表示されることを確認
        expect(find.text('子育て家庭を支援する持ち物リマインダー'), findsOneWidget);
      },
    );

    // ... existing tests remain the same ...
  });
}
