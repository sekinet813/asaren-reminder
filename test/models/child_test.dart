import 'package:flutter_test/flutter_test.dart';
import 'package:asaren_reminder/models/child.dart';

void main() {
  group('Child Model Tests', () {
    test('should create Child from map', () {
      final map = {
        'id': 1,
        'name': '太郎',
        'grade': '小学1年生',
        'color': '#FF0000',
        'photo_path': '/path/to/photo.jpg',
        'created_at': '2024-01-01T00:00:00.000Z',
        'updated_at': '2024-01-01T00:00:00.000Z',
      };

      final child = Child.fromMap(map);

      expect(child.id, 1);
      expect(child.name, '太郎');
      expect(child.grade, '小学1年生');
      expect(child.color, '#FF0000');
      expect(child.photoPath, '/path/to/photo.jpg');
      expect(child.createdAt, DateTime.parse('2024-01-01T00:00:00.000Z'));
      expect(child.updatedAt, DateTime.parse('2024-01-01T00:00:00.000Z'));
    });

    test('should create Child from map without photo', () {
      final map = {
        'id': 1,
        'name': '太郎',
        'grade': '小学1年生',
        'color': '#FF0000',
        'photo_path': null,
        'created_at': '2024-01-01T00:00:00.000Z',
        'updated_at': '2024-01-01T00:00:00.000Z',
      };

      final child = Child.fromMap(map);

      expect(child.id, 1);
      expect(child.name, '太郎');
      expect(child.grade, '小学1年生');
      expect(child.color, '#FF0000');
      expect(child.photoPath, isNull);
      expect(child.createdAt, DateTime.parse('2024-01-01T00:00:00.000Z'));
      expect(child.updatedAt, DateTime.parse('2024-01-01T00:00:00.000Z'));
    });

    test('should convert Child to map', () {
      final child = Child(
        id: 1,
        name: '太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final map = child.toMap();

      expect(map['id'], 1);
      expect(map['name'], '太郎');
      expect(map['grade'], '小学1年生');
      expect(map['color'], '#FF0000');
      expect(map['photo_path'], '/path/to/photo.jpg');
      expect(map['created_at'], '2024-01-01T00:00:00.000Z');
      expect(map['updated_at'], '2024-01-01T00:00:00.000Z');
    });

    test('should convert Child to map without photo', () {
      final child = Child(
        id: 1,
        name: '太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: null,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final map = child.toMap();

      expect(map['id'], 1);
      expect(map['name'], '太郎');
      expect(map['grade'], '小学1年生');
      expect(map['color'], '#FF0000');
      expect(map['photo_path'], isNull);
      expect(map['created_at'], '2024-01-01T00:00:00.000Z');
      expect(map['updated_at'], '2024-01-01T00:00:00.000Z');
    });

    test('should create new Child with factory method', () {
      final child = Child.create(
        name: '花子',
        grade: '年長',
        color: '#00FF00',
        photoPath: '/path/to/photo.jpg',
      );

      expect(child.id, isNull);
      expect(child.name, '花子');
      expect(child.grade, '年長');
      expect(child.color, '#00FF00');
      expect(child.photoPath, '/path/to/photo.jpg');
      expect(child.createdAt, isA<DateTime>());
      expect(child.updatedAt, isA<DateTime>());
    });

    test('should create new Child without photo', () {
      final child = Child.create(name: '花子', grade: '年長', color: '#00FF00');

      expect(child.id, isNull);
      expect(child.name, '花子');
      expect(child.grade, '年長');
      expect(child.color, '#00FF00');
      expect(child.photoPath, isNull);
      expect(child.createdAt, isA<DateTime>());
      expect(child.updatedAt, isA<DateTime>());
    });

    test('should copy Child with new values', () {
      final original = Child(
        id: 1,
        name: '太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final copied = original.copyWith(
        name: '次郎',
        grade: '小学2年生',
        photoPath: '/path/to/new_photo.jpg',
      );

      expect(copied.id, 1);
      expect(copied.name, '次郎');
      expect(copied.grade, '小学2年生');
      expect(copied.color, '#FF0000');
      expect(copied.photoPath, '/path/to/new_photo.jpg');
      expect(copied.createdAt, original.createdAt);
      expect(copied.updatedAt.isAfter(original.updatedAt), isTrue);
    });

    test('should check if child has photo', () {
      final childWithPhoto = Child(
        id: 1,
        name: '太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final childWithoutPhoto = Child(
        id: 2,
        name: '花子',
        grade: '年長',
        color: '#00FF00',
        photoPath: null,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final childWithEmptyPhoto = Child(
        id: 3,
        name: '次郎',
        grade: '小学3年生',
        color: '#0000FF',
        photoPath: '',
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      expect(childWithPhoto.hasPhoto, isTrue);
      expect(childWithoutPhoto.hasPhoto, isFalse);
      expect(childWithEmptyPhoto.hasPhoto, isFalse);
    });

    test('should compare Child objects correctly', () {
      final child1 = Child(
        id: 1,
        name: '太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final child2 = Child(
        id: 1,
        name: '太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final child3 = Child(
        id: 2,
        name: '花子',
        grade: '年長',
        color: '#00FF00',
        photoPath: null,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      expect(child1, equals(child2));
      expect(child1, isNot(equals(child3)));
    });

    test('should handle invalid map data gracefully', () {
      // 不正なデータ型のテスト
      final invalidMap = {
        'id': 'invalid_id', // intではなくString
        'name': 123, // Stringではなくint
        'grade': null, // null値（必須フィールド）
        'color': '#FF0000',
        'photo_path': '/path/to/photo.jpg',
        'created_at': 'invalid_date', // 不正な日付形式
        'updated_at': '2024-01-01T00:00:00.000Z',
      };

      expect(() => Child.fromMap(invalidMap), throwsA(isA<TypeError>()));
    });

    test('should handle empty string values', () {
      final mapWithEmptyStrings = {
        'id': 1,
        'name': '', // 空文字列
        'grade': '   ', // 空白文字のみ
        'color': '#FF0000',
        'photo_path': '',
        'created_at': '2024-01-01T00:00:00.000Z',
        'updated_at': '2024-01-01T00:00:00.000Z',
      };

      final child = Child.fromMap(mapWithEmptyStrings);
      expect(child.name, '');
      expect(child.grade, '   ');
      expect(child.photoPath, '');
    });

    test('should validate color format', () {
      final validColors = [
        '#FF0000',
        '#00FF00',
        '#0000FF',
        '#FFFFFF',
        '#000000',
      ];
      final invalidColors = ['FF0000', 'red', '#GG0000', '#FFF', '#FFFFFFF'];

      for (final color in validColors) {
        final child = Child.create(name: 'テスト', grade: '小学1年生', color: color);
        expect(child.color, color);
      }

      // 不正な色形式でもエラーは発生しない（バリデーションはUI層で行う）
      for (final color in invalidColors) {
        final child = Child.create(name: 'テスト', grade: '小学1年生', color: color);
        expect(child.color, color);
      }
    });

    test('should handle copyWith with all null values', () {
      final original = Child.create(
        name: '太郎',
        grade: '小学1年生',
        color: '#FF0000',
      );

      final copied = original.copyWith(
        name: null,
        grade: null,
        color: null,
        photoPath: null,
      );

      expect(copied.name, original.name);
      expect(copied.grade, original.grade);
      expect(copied.color, original.color);
      expect(copied.photoPath, original.photoPath);
      expect(copied.updatedAt.isAfter(original.updatedAt), isTrue);
    });

    test('should handle toString method correctly', () {
      final child = Child.create(
        name: '太郎',
        grade: '小学1年生',
        color: '#FF0000',
        photoPath: '/path/to/photo.jpg',
      );

      final stringRepresentation = child.toString();
      expect(stringRepresentation, contains('太郎'));
      expect(stringRepresentation, contains('小学1年生'));
      expect(stringRepresentation, contains('#FF0000'));
      expect(stringRepresentation, contains('/path/to/photo.jpg'));
    });

    test('should handle hashCode consistency', () {
      final child1 = Child.create(name: '太郎', grade: '小学1年生', color: '#FF0000');

      final child2 = Child.create(name: '太郎', grade: '小学1年生', color: '#FF0000');

      // 同じ値を持つオブジェクトは同じハッシュコードを持つべき
      expect(child1.hashCode, equals(child2.hashCode));
    });
  });
}
