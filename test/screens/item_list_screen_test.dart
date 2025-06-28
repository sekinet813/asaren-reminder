import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:asaren_reminder/screens/item_list_screen.dart';
import 'package:asaren_reminder/utils/constants.dart';

void main() {
  group('ItemListScreen Widget Tests', () {
    testWidgets('should display item list screen with correct elements', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: ItemListScreen()));

      // 画面タイトルが表示されることを確認
      expect(find.text(AppConstants.kItemListTitle), findsOneWidget);

      // AppBarが表示されることを確認
      expect(find.byType(AppBar), findsOneWidget);

      // 説明文が表示されることを確認
      expect(find.text('ここに持ち物の一覧が表示されます'), findsOneWidget);

      // 実装予定バッジが表示されることを確認
      expect(find.text('（実装予定）'), findsOneWidget);
    });

    testWidgets('should display correct app bar styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: ItemListScreen()));

      // AppBarが表示されることを確認
      final appBarFinder = find.byType(AppBar);
      final appBarWidget = tester.widget<AppBar>(appBarFinder);

      expect(appBarWidget.title, isA<Text>());
      final titleText = appBarWidget.title as Text;
      expect(titleText.data, AppConstants.kItemListTitle);
    });

    testWidgets('should display main icon correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: ItemListScreen()));

      // メインアイコンが表示されることを確認
      expect(find.byIcon(Icons.list_alt), findsOneWidget);

      // アイコンのサイズを確認
      final iconFinder = find.byIcon(Icons.list_alt);
      final iconWidget = tester.widget<Icon>(iconFinder);
      expect(iconWidget.size, 80);
    });

    testWidgets('should handle screen resize correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: ItemListScreen()));

      // 画面サイズを変更
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pump();

      // 画面が正しく表示されることを確認
      expect(find.text(AppConstants.kItemListTitle), findsOneWidget);
      expect(find.text('ここに持ち物の一覧が表示されます'), findsOneWidget);

      // 元のサイズに戻す
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('should have correct background gradient', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: ItemListScreen()));

      // Container with gradientが表示されることを確認
      expect(find.byType(Container), findsWidgets);

      // グラデーションが適用されていることを確認
      final containers = find.byType(Container);
      bool hasGradient = false;

      // Elementのリストを取得して、各ElementからWidgetを取得
      for (final element in containers.evaluate()) {
        final widget = element.widget;
        if (widget is Container && widget.decoration is BoxDecoration) {
          final decoration = widget.decoration as BoxDecoration;
          if (decoration.gradient != null) {
            hasGradient = true;
            break;
          }
        }
      }
      expect(hasGradient, isTrue);
    });
  });
}
