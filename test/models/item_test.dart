import 'package:flutter_test/flutter_test.dart';
import 'package:asaren_reminder/models/item.dart';

void main() {
  group('Item Model Tests', () {
    test('should create Item from map', () {
      final map = {
        'id': 1,
        'name': '教科書',
        'category': '学習用品',
        'day_of_week': 1,
        'importance': 1,
        'memo': '国語の教科書',
        'child_id': 1,
        'created_at': '2024-01-01T00:00:00.000Z',
        'updated_at': '2024-01-01T00:00:00.000Z',
      };

      final item = Item.fromMap(map);

      expect(item.id, 1);
      expect(item.name, '教科書');
      expect(item.category, '学習用品');
      expect(item.dayOfWeek, 1);
      expect(item.importance, 1);
      expect(item.memo, '国語の教科書');
      expect(item.childId, 1);
      expect(item.createdAt, DateTime.parse('2024-01-01T00:00:00.000Z'));
      expect(item.updatedAt, DateTime.parse('2024-01-01T00:00:00.000Z'));
    });

    test('should convert Item to map', () {
      final item = Item(
        id: 1,
        name: '教科書',
        category: '学習用品',
        dayOfWeek: 1,
        importance: 1,
        memo: '国語の教科書',
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final map = item.toMap();

      expect(map['id'], 1);
      expect(map['name'], '教科書');
      expect(map['category'], '学習用品');
      expect(map['day_of_week'], 1);
      expect(map['importance'], 1);
      expect(map['memo'], '国語の教科書');
      expect(map['child_id'], 1);
      expect(map['created_at'], '2024-01-01T00:00:00.000Z');
      expect(map['updated_at'], '2024-01-01T00:00:00.000Z');
    });

    test('should create new Item with factory method', () {
      final item = Item.create(
        name: '給食袋',
        category: '給食用品',
        dayOfWeek: 2,
        importance: 2,
        memo: '火曜日は給食',
        childId: 1,
      );

      expect(item.id, isNull);
      expect(item.name, '給食袋');
      expect(item.category, '給食用品');
      expect(item.dayOfWeek, 2);
      expect(item.importance, 2);
      expect(item.memo, '火曜日は給食');
      expect(item.childId, 1);
      expect(item.createdAt, isA<DateTime>());
      expect(item.updatedAt, isA<DateTime>());
    });

    test('should get correct day of week text', () {
      final item = Item(
        id: 1,
        name: '教科書',
        category: '学習用品',
        dayOfWeek: 1,
        importance: 1,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      expect(item.dayOfWeekText, '月');
    });

    test('should get correct importance text', () {
      final requiredItem = Item(
        id: 1,
        name: '教科書',
        category: '学習用品',
        dayOfWeek: 1,
        importance: 1,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final optionalItem = Item(
        id: 2,
        name: '給食袋',
        category: '給食用品',
        dayOfWeek: 2,
        importance: 2,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      expect(requiredItem.importanceText, '必須');
      expect(optionalItem.importanceText, '任意');
    });

    test('should check if item is required', () {
      final requiredItem = Item(
        id: 1,
        name: '教科書',
        category: '学習用品',
        dayOfWeek: 1,
        importance: 1,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final optionalItem = Item(
        id: 2,
        name: '給食袋',
        category: '給食用品',
        dayOfWeek: 2,
        importance: 2,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      expect(requiredItem.isRequired, isTrue);
      expect(optionalItem.isRequired, isFalse);
    });

    test('should copy Item with new values', () {
      final original = Item(
        id: 1,
        name: '教科書',
        category: '学習用品',
        dayOfWeek: 1,
        importance: 1,
        memo: '国語の教科書',
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final copied = original.copyWith(name: '算数の教科書', importance: 2);

      expect(copied.id, 1);
      expect(copied.name, '算数の教科書');
      expect(copied.category, '学習用品');
      expect(copied.dayOfWeek, 1);
      expect(copied.importance, 2);
      expect(copied.memo, '国語の教科書');
      expect(copied.childId, 1);
      expect(copied.createdAt, original.createdAt);
      expect(copied.updatedAt.isAfter(original.updatedAt), isTrue);
    });

    test('should compare Item objects correctly', () {
      final item1 = Item(
        id: 1,
        name: '教科書',
        category: '学習用品',
        dayOfWeek: 1,
        importance: 1,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final item2 = Item(
        id: 1,
        name: '教科書',
        category: '学習用品',
        dayOfWeek: 1,
        importance: 1,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final item3 = Item(
        id: 2,
        name: '給食袋',
        category: '給食用品',
        dayOfWeek: 2,
        importance: 2,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      expect(item1, equals(item2));
      expect(item1, isNot(equals(item3)));
    });
  });
}
