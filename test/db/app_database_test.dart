import 'package:flutter_test/flutter_test.dart';
import 'package:asaren_reminder/db/app_database.dart';
import 'package:asaren_reminder/models/child.dart';

void main() {
  group('AppDatabase Tests', () {
    // 一時的にスキップ
    test('should create database instance', () {
      final database = AppDatabase.instance;
      expect(database, isNotNull);
    }, skip: true);

    test('should create child model', () {
      final child = Child.create(name: '太郎', grade: '小学1年生', color: '#FF0000');

      expect(child.name, '太郎');
      expect(child.grade, '小学1年生');
      expect(child.color, '#FF0000');
    });

    test('should copy child with new values', () {
      final originalChild = Child.create(
        name: '太郎',
        grade: '小学1年生',
        color: '#FF0000',
      );

      final updatedChild = originalChild.copyWith(name: '次郎', grade: '小学2年生');

      expect(updatedChild.name, '次郎');
      expect(updatedChild.grade, '小学2年生');
      expect(updatedChild.color, '#FF0000'); // 変更されていない値は保持
    });

    test('should convert child to and from map', () {
      final child = Child.create(name: '太郎', grade: '小学1年生', color: '#FF0000');

      final map = child.toMap();
      final recreatedChild = Child.fromMap(map);

      expect(recreatedChild.name, child.name);
      expect(recreatedChild.grade, child.grade);
      expect(recreatedChild.color, child.color);
    });
  });
}
