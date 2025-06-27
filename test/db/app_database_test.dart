import 'package:flutter_test/flutter_test.dart';
import 'package:asaren_reminder/db/app_database.dart';
import 'package:asaren_reminder/models/child.dart';
import 'package:asaren_reminder/models/item.dart';
import 'package:asaren_reminder/models/event.dart';

void main() {
  group('AppDatabase Tests', () {
    late AppDatabase database;

    setUp(() async {
      database = AppDatabase.instance;
      await database.resetDatabase();
    });

    tearDown(() async {
      await database.close();
    });

    group('Child Operations', () {
      test('should insert and retrieve child', () async {
        final child = Child.create(
          name: '太郎',
          grade: '小学1年生',
          color: '#FF0000',
        );

        final id = await database.insertChild(child);
        expect(id, isNotNull);

        final retrievedChild = await database.getChildById(id);
        expect(retrievedChild, isNotNull);
        expect(retrievedChild!.name, '太郎');
        expect(retrievedChild.grade, '小学1年生');
        expect(retrievedChild.color, '#FF0000');
      });

      test('should update child', () async {
        final child = Child.create(
          name: '太郎',
          grade: '小学1年生',
          color: '#FF0000',
        );

        final id = await database.insertChild(child);
        final updatedChild = child.copyWith(id: id, name: '次郎', grade: '小学2年生');

        final updateCount = await database.updateChild(updatedChild);
        expect(updateCount, 1);

        final retrievedChild = await database.getChildById(id);
        expect(retrievedChild!.name, '次郎');
        expect(retrievedChild.grade, '小学2年生');
      });

      test('should delete child', () async {
        final child = Child.create(
          name: '太郎',
          grade: '小学1年生',
          color: '#FF0000',
        );

        final id = await database.insertChild(child);
        final deleteCount = await database.deleteChild(id);
        expect(deleteCount, 1);

        final retrievedChild = await database.getChildById(id);
        expect(retrievedChild, isNull);
      });

      test('should get all children', () async {
        final child1 = Child.create(
          name: '太郎',
          grade: '小学1年生',
          color: '#FF0000',
        );
        final child2 = Child.create(name: '花子', grade: '年長', color: '#00FF00');

        await database.insertChild(child1);
        await database.insertChild(child2);

        final children = await database.getAllChildren();
        expect(children.length, 2);
        expect(children.any((c) => c.name == '太郎'), isTrue);
        expect(children.any((c) => c.name == '花子'), isTrue);
      });
    });

    group('Item Operations', () {
      late int childId;

      setUp(() async {
        final child = Child.create(
          name: '太郎',
          grade: '小学1年生',
          color: '#FF0000',
        );
        childId = await database.insertChild(child);
      });

      test('should insert and retrieve item', () async {
        final item = Item.create(
          name: '教科書',
          category: '学習用品',
          dayOfWeek: 1,
          importance: 1,
          memo: '国語の教科書',
          childId: childId,
        );

        final id = await database.insertItem(item);
        expect(id, isNotNull);

        final items = await database.getItemsByChildId(childId);
        expect(items.length, 1);
        expect(items.first.name, '教科書');
        expect(items.first.category, '学習用品');
        expect(items.first.dayOfWeek, 1);
        expect(items.first.importance, 1);
      });

      test('should get items by day of week', () async {
        final item1 = Item.create(
          name: '教科書',
          category: '学習用品',
          dayOfWeek: 1,
          importance: 1,
          childId: childId,
        );
        final item2 = Item.create(
          name: '給食袋',
          category: '給食用品',
          dayOfWeek: 2,
          importance: 2,
          childId: childId,
        );

        await database.insertItem(item1);
        await database.insertItem(item2);

        final mondayItems = await database.getItemsByDayOfWeek(1);
        expect(mondayItems.length, 1);
        expect(mondayItems.first.name, '教科書');

        final tuesdayItems = await database.getItemsByDayOfWeek(2);
        expect(tuesdayItems.length, 1);
        expect(tuesdayItems.first.name, '給食袋');
      });

      test('should get items by child and day of week', () async {
        final item = Item.create(
          name: '教科書',
          category: '学習用品',
          dayOfWeek: 1,
          importance: 1,
          childId: childId,
        );

        await database.insertItem(item);

        final items = await database.getItemsByChildIdAndDayOfWeek(childId, 1);
        expect(items.length, 1);
        expect(items.first.name, '教科書');

        final emptyItems = await database.getItemsByChildIdAndDayOfWeek(
          childId,
          2,
        );
        expect(emptyItems.length, 0);
      });

      test('should update item', () async {
        final item = Item.create(
          name: '教科書',
          category: '学習用品',
          dayOfWeek: 1,
          importance: 1,
          childId: childId,
        );

        final id = await database.insertItem(item);
        final updatedItem = item.copyWith(
          id: id,
          name: '算数の教科書',
          importance: 2,
        );

        final updateCount = await database.updateItem(updatedItem);
        expect(updateCount, 1);

        final items = await database.getItemsByChildId(childId);
        expect(items.first.name, '算数の教科書');
        expect(items.first.importance, 2);
      });

      test('should delete item', () async {
        final item = Item.create(
          name: '教科書',
          category: '学習用品',
          dayOfWeek: 1,
          importance: 1,
          childId: childId,
        );

        final id = await database.insertItem(item);
        final deleteCount = await database.deleteItem(id);
        expect(deleteCount, 1);

        final items = await database.getItemsByChildId(childId);
        expect(items.length, 0);
      });
    });

    group('Event Operations', () {
      late int childId;

      setUp(() async {
        final child = Child.create(
          name: '太郎',
          grade: '小学1年生',
          color: '#FF0000',
        );
        childId = await database.insertChild(child);
      });

      test('should insert and retrieve event', () async {
        final event = Event.create(
          title: '遠足',
          description: '動物園に行きます',
          startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
          endDate: DateTime.parse('2024-06-15T15:00:00.000Z'),
          location: '動物園',
          eventType: '遠足',
          repeatType: 0,
          childId: childId,
        );

        final id = await database.insertEvent(event);
        expect(id, isNotNull);

        final events = await database.getEventsByChildId(childId);
        expect(events.length, 1);
        expect(events.first.title, '遠足');
        expect(events.first.description, '動物園に行きます');
        expect(events.first.location, '動物園');
        expect(events.first.eventType, '遠足');
      });

      test('should get events by date range', () async {
        final event1 = Event.create(
          title: '遠足',
          startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
          eventType: '遠足',
          repeatType: 0,
          childId: childId,
        );
        final event2 = Event.create(
          title: 'プール',
          startDate: DateTime.parse('2024-06-20T09:00:00.000Z'),
          eventType: 'プール',
          repeatType: 0,
          childId: childId,
        );

        await database.insertEvent(event1);
        await database.insertEvent(event2);

        final startDate = DateTime.parse('2024-06-14T00:00:00.000Z');
        final endDate = DateTime.parse('2024-06-16T23:59:59.000Z');
        final events = await database.getEventsByDateRange(startDate, endDate);

        expect(events.length, 1);
        expect(events.first.title, '遠足');
      });

      test('should get events by specific date', () async {
        final event = Event.create(
          title: '遠足',
          startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
          eventType: '遠足',
          repeatType: 0,
          childId: childId,
        );

        await database.insertEvent(event);

        final eventDate = DateTime.parse('2024-06-15T12:00:00.000Z');
        final events = await database.getEventsByDate(eventDate);

        expect(events.length, 1);
        expect(events.first.title, '遠足');

        final differentDate = DateTime.parse('2024-06-16T12:00:00.000Z');
        final emptyEvents = await database.getEventsByDate(differentDate);
        expect(emptyEvents.length, 0);
      });

      test('should update event', () async {
        final event = Event.create(
          title: '遠足',
          startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
          eventType: '遠足',
          repeatType: 0,
          childId: childId,
        );

        final id = await database.insertEvent(event);
        final updatedEvent = event.copyWith(
          id: id,
          title: '水族館遠足',
          location: '水族館',
        );

        final updateCount = await database.updateEvent(updatedEvent);
        expect(updateCount, 1);

        final events = await database.getEventsByChildId(childId);
        expect(events.first.title, '水族館遠足');
        expect(events.first.location, '水族館');
      });

      test('should delete event', () async {
        final event = Event.create(
          title: '遠足',
          startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
          eventType: '遠足',
          repeatType: 0,
          childId: childId,
        );

        final id = await database.insertEvent(event);
        final deleteCount = await database.deleteEvent(id);
        expect(deleteCount, 1);

        final events = await database.getEventsByChildId(childId);
        expect(events.length, 0);
      });
    });

    group('Database Statistics', () {
      test('should get correct database stats', () async {
        final child = Child.create(
          name: '太郎',
          grade: '小学1年生',
          color: '#FF0000',
        );
        final childId = await database.insertChild(child);

        final item = Item.create(
          name: '教科書',
          category: '学習用品',
          dayOfWeek: 1,
          importance: 1,
          childId: childId,
        );
        await database.insertItem(item);

        final event = Event.create(
          title: '遠足',
          startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
          eventType: '遠足',
          repeatType: 0,
          childId: childId,
        );
        await database.insertEvent(event);

        final stats = await database.getDatabaseStats();
        expect(stats['children'], 1);
        expect(stats['items'], 1);
        expect(stats['events'], 1);
      });
    });
  });
}
