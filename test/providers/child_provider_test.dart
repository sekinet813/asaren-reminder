import 'package:flutter_test/flutter_test.dart';
import 'package:asaren_reminder/providers/child_provider.dart';
import 'package:asaren_reminder/models/child.dart';

void main() {
  group('ChildProvider Tests', () {
    late ChildProvider provider;

    setUp(() {
      provider = ChildProvider();
    });

    test('初期状態の確認', () {
      expect(provider.children, isEmpty);
      expect(provider.selectedChild, isNull);
      expect(provider.isLoading, isFalse);
      expect(provider.error, isNull);
      expect(provider.hasChildren, isFalse);
      expect(provider.hasSelectedChild, isFalse);
    });

    test('子ども選択のテスト', () {
      final child = Child.create(
        name: 'テスト太郎',
        grade: '小学1年生',
        color: '#FF0000',
      );

      // リスナーが呼ばれることを確認
      var listenerCalled = false;
      provider.addListener(() {
        listenerCalled = true;
      });

      provider.selectChild(child);

      expect(provider.selectedChild, equals(child));
      expect(provider.hasSelectedChild, isTrue);
      expect(listenerCalled, isTrue);
    });

    test('選択クリアのテスト', () {
      final child = Child.create(
        name: 'テスト太郎',
        grade: '小学1年生',
        color: '#FF0000',
      );

      // まず子どもを選択
      provider.selectChild(child);
      expect(provider.hasSelectedChild, isTrue);

      // リスナーが呼ばれることを確認
      var listenerCalled = false;
      provider.addListener(() {
        listenerCalled = true;
      });

      provider.clearSelection();

      expect(provider.selectedChild, isNull);
      expect(provider.hasSelectedChild, isFalse);
      expect(listenerCalled, isTrue);
    });

    test('エラークリアのテスト', () {
      // エラーを設定（内部メソッドを直接テスト）
      var listenerCalled = false;
      provider.addListener(() {
        listenerCalled = true;
      });

      provider.clearError();

      expect(provider.error, isNull);
      expect(listenerCalled, isTrue);
    });

    test('hasChildrenプロパティのテスト', () {
      expect(provider.hasChildren, isFalse);

      // テスト用メソッドを使用して子どもを追加
      final child = Child.create(
        name: 'テスト太郎',
        grade: '小学1年生',
        color: '#FF0000',
      );

      provider.setChildrenForTesting([child]);

      expect(provider.hasChildren, isTrue);
    });

    test('テスト用リセットメソッドのテスト', () {
      // 初期状態を変更
      final child = Child.create(
        name: 'テスト太郎',
        grade: '小学1年生',
        color: '#FF0000',
      );

      provider.setChildrenForTesting([child]);
      provider.selectChild(child);

      expect(provider.hasChildren, isTrue);
      expect(provider.hasSelectedChild, isTrue);

      // リセット
      provider.resetForTesting();

      expect(provider.hasChildren, isFalse);
      expect(provider.hasSelectedChild, isFalse);
      expect(provider.isLoading, isFalse);
      expect(provider.error, isNull);
    });

    test('同じ子どもを再選択してもリスナーが呼ばれるテスト', () {
      final child = Child.create(
        name: 'テスト太郎',
        grade: '小学1年生',
        color: '#FF0000',
      );

      // 最初の選択
      provider.selectChild(child);
      expect(provider.selectedChild, equals(child));

      // 同じ子どもを再選択
      var listenerCalled = false;
      provider.addListener(() {
        listenerCalled = true;
      });

      provider.selectChild(child);

      // シンプルな実装なので常にリスナーが呼ばれる
      expect(listenerCalled, isTrue);
    });
  });
}
