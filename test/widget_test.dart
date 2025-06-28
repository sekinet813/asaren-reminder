// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:asaren_reminder/main.dart';
import 'package:asaren_reminder/providers/child_provider.dart';

void main() {
  testWidgets('App should start without crashing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AsarenReminderApp());

    // Verify that the app starts without crashing
    expect(find.byType(MaterialApp), findsOneWidget);

    // Verify that the home screen is displayed
    expect(find.text('朝連リマインダー'), findsAtLeastNWidgets(1));
    expect(find.text('子育て家庭を支援する持ち物リマインダー'), findsOneWidget);
  });

  testWidgets('Bottom navigation should exist', (WidgetTester tester) async {
    await tester.pumpWidget(const AsarenReminderApp());

    // Verify bottom navigation items exist
    expect(find.byType(BottomNavigationBar), findsOneWidget);

    // ボトムナビゲーションのアイテムを確認
    final bottomNav = tester.widget<BottomNavigationBar>(
      find.byType(BottomNavigationBar),
    );
    expect(bottomNav.items.length, 3);
    expect(bottomNav.items[0].label, 'ホーム');
    expect(bottomNav.items[1].label, '持ち物');
    expect(bottomNav.items[2].label, '設定');
  });

  testWidgets('Provider integration test', (WidgetTester tester) async {
    await tester.pumpWidget(const AsarenReminderApp());

    // Providerが正しく設定されていることを確認
    expect(find.byType(MultiProvider), findsOneWidget);

    // ChildProviderにアクセスできることを確認
    final context = tester.element(find.byType(MaterialApp));
    final childProvider = context.read<ChildProvider>();
    expect(childProvider, isNotNull);
    expect(childProvider.children, isEmpty);
    expect(childProvider.selectedChild, isNull);
  });
}
