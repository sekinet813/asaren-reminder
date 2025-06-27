// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:asaren_reminder/main.dart';

void main() {
  testWidgets('App should start without crashing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app starts without crashing
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verify that the home screen is displayed
    expect(find.text('朝連リマインダー'), findsOneWidget);
    expect(find.text('子育て家庭を支援する持ち物リマインダー'), findsOneWidget);
  });

  testWidgets('Bottom navigation should work', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify bottom navigation items exist
    expect(find.text('ホーム'), findsOneWidget);
    expect(find.text('持ち物リスト'), findsOneWidget);
    expect(find.text('設定'), findsOneWidget);

    // Tap on item list tab
    await tester.tap(find.text('持ち物リスト'));
    await tester.pump();

    // Verify item list screen is displayed
    expect(find.text('持ち物リスト'), findsOneWidget);
    expect(find.text('ここに持ち物の一覧が表示されます'), findsOneWidget);

    // Tap on settings tab
    await tester.tap(find.text('設定'));
    await tester.pump();

    // Verify settings screen is displayed
    expect(find.text('設定'), findsOneWidget);
    expect(find.text('アプリの設定をここで管理できます'), findsOneWidget);
  });
}
