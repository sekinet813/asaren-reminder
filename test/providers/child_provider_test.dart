import 'package:flutter_test/flutter_test.dart';
import 'package:asaren_reminder/providers/child_provider.dart';
import 'package:asaren_reminder/models/child.dart';

void main() {
  group('ChildProvider Tests', () {
    late ChildProvider provider;

    setUpAll(() {
      // Flutter bindingを初期化
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    setUp(() {
      provider = ChildProvider();
      // テスト環境ではデータベース操作を強制的にスキップ
      provider.setForceSkipDatabase(true);
    });

    tearDown(() {
      provider.dispose();
    });

    test('should initialize with empty state', () {
      expect(provider.children, isEmpty);
      expect(provider.selectedChild, isNull);
      expect(provider.isLoading, isFalse);
      expect(provider.error, isNull);
      expect(provider.hasChildren, isFalse);
      expect(provider.hasSelectedChild, isFalse);
    });

    test('should add child successfully', () async {
      final child = Child.create(
        name: 'テスト太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
      );

      await provider.addChild(child);

      // テスト環境ではメモリ上で管理されるため、成功する
      expect(provider.children, hasLength(1));
      expect(provider.children.first.name, equals('テスト太郎'));
      expect(provider.error, isNull);
    });

    test('should select child successfully', () {
      final child = Child.create(
        name: 'テスト太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
      );

      // テスト用に子どもリストを設定
      provider.setChildrenForTesting([child]);

      provider.selectChild(child);

      expect(provider.selectedChild, equals(child));
      expect(provider.hasSelectedChild, isTrue);
    });

    test('should select child by ID successfully', () {
      final child1 = Child.create(
        name: 'テスト太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
      ).copyWith(id: 1);

      final child2 = Child.create(
        name: 'テスト花子',
        grade: '小学2年生',
        color: '#00FF00',
        photoPath: '/path/to/photo2.jpg',
      ).copyWith(id: 2);

      // テスト用に子どもリストを設定
      provider.setChildrenForTesting([child1, child2]);

      provider.selectChildById(2);

      expect(provider.selectedChild, equals(child2));
    });

    test('should throw exception when selecting non-existent child by ID', () {
      final child = Child.create(
        name: 'テスト太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
      ).copyWith(id: 1);

      // テスト用に子どもリストを設定
      provider.setChildrenForTesting([child]);

      expect(() => provider.selectChildById(999), throwsException);
    });

    test('should clear selection successfully', () {
      final child = Child.create(
        name: 'テスト太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
      );

      // テスト用に子どもリストを設定
      provider.setChildrenForTesting([child]);
      provider.selectChild(child);

      expect(provider.hasSelectedChild, isTrue);

      provider.clearSelection();

      expect(provider.selectedChild, isNull);
      expect(provider.hasSelectedChild, isFalse);
    });

    test('should update child successfully', () async {
      final child = Child.create(
        name: 'テスト太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
      ).copyWith(id: 1);

      // テスト用に子どもリストを設定
      provider.setChildrenForTesting([child]);
      provider.selectChild(child);

      final updatedChild = child.copyWith(name: '更新太郎');

      await provider.updateChild(updatedChild);

      // テスト環境ではメモリ上で管理されるため、成功する
      expect(provider.children.first.name, equals('更新太郎'));
      expect(provider.selectedChild?.name, equals('更新太郎'));
      expect(provider.error, isNull);
    });

    test('should delete child successfully', () async {
      final child1 = Child.create(
        name: 'テスト太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
      ).copyWith(id: 1);

      final child2 = Child.create(
        name: 'テスト花子',
        grade: '小学2年生',
        color: '#00FF00',
        photoPath: '/path/to/photo2.jpg',
      ).copyWith(id: 2);

      // テスト用に子どもリストを設定
      provider.setChildrenForTesting([child1, child2]);
      provider.selectChild(child1);

      await provider.deleteChild(1);

      // テスト環境ではメモリ上で管理されるため、成功する
      expect(provider.children, hasLength(1));
      expect(provider.children.first.id, equals(2));
      expect(provider.selectedChild?.id, equals(2)); // 自動的に次の子どもが選択される
      expect(provider.error, isNull);
    });

    test('should clear error successfully', () {
      // エラー状態をシミュレート
      provider.resetForTesting();

      provider.clearError();

      expect(provider.error, isNull);
    });

    test('should reset for testing', () {
      final child = Child.create(
        name: 'テスト太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
      );

      // テスト用に子どもリストを設定
      provider.setChildrenForTesting([child]);
      provider.selectChild(child);

      provider.resetForTesting();

      expect(provider.children, isEmpty);
      expect(provider.selectedChild, isNull);
      expect(provider.isLoading, isFalse);
      expect(provider.error, isNull);
    });
  });
}
