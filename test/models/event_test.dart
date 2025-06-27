import 'package:flutter_test/flutter_test.dart';
import 'package:asaren_reminder/models/event.dart';

void main() {
  group('Event Model Tests', () {
    test('should create Event from map', () {
      final map = {
        'id': 1,
        'title': '遠足',
        'description': '動物園に行きます',
        'start_date': '2024-06-15T09:00:00.000Z',
        'end_date': '2024-06-15T15:00:00.000Z',
        'location': '動物園',
        'event_type': '遠足',
        'repeat_type': 0,
        'child_id': 1,
        'created_at': '2024-01-01T00:00:00.000Z',
        'updated_at': '2024-01-01T00:00:00.000Z',
      };

      final event = Event.fromMap(map);

      expect(event.id, 1);
      expect(event.title, '遠足');
      expect(event.description, '動物園に行きます');
      expect(event.startDate, DateTime.parse('2024-06-15T09:00:00.000Z'));
      expect(event.endDate, DateTime.parse('2024-06-15T15:00:00.000Z'));
      expect(event.location, '動物園');
      expect(event.eventType, '遠足');
      expect(event.repeatType, 0);
      expect(event.childId, 1);
      expect(event.createdAt, DateTime.parse('2024-01-01T00:00:00.000Z'));
      expect(event.updatedAt, DateTime.parse('2024-01-01T00:00:00.000Z'));
    });

    test('should create Event from map without optional fields', () {
      final map = {
        'id': 1,
        'title': 'プール',
        'description': null,
        'start_date': '2024-06-15T09:00:00.000Z',
        'end_date': null,
        'location': null,
        'event_type': 'プール',
        'repeat_type': 1,
        'child_id': 1,
        'created_at': '2024-01-01T00:00:00.000Z',
        'updated_at': '2024-01-01T00:00:00.000Z',
      };

      final event = Event.fromMap(map);

      expect(event.id, 1);
      expect(event.title, 'プール');
      expect(event.description, isNull);
      expect(event.startDate, DateTime.parse('2024-06-15T09:00:00.000Z'));
      expect(event.endDate, isNull);
      expect(event.location, isNull);
      expect(event.eventType, 'プール');
      expect(event.repeatType, 1);
      expect(event.childId, 1);
    });

    test('should convert Event to map', () {
      final event = Event(
        id: 1,
        title: '遠足',
        description: '動物園に行きます',
        startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
        endDate: DateTime.parse('2024-06-15T15:00:00.000Z'),
        location: '動物園',
        eventType: '遠足',
        repeatType: 0,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final map = event.toMap();

      expect(map['id'], 1);
      expect(map['title'], '遠足');
      expect(map['description'], '動物園に行きます');
      expect(map['start_date'], '2024-06-15T09:00:00.000Z');
      expect(map['end_date'], '2024-06-15T15:00:00.000Z');
      expect(map['location'], '動物園');
      expect(map['event_type'], '遠足');
      expect(map['repeat_type'], 0);
      expect(map['child_id'], 1);
      expect(map['created_at'], '2024-01-01T00:00:00.000Z');
      expect(map['updated_at'], '2024-01-01T00:00:00.000Z');
    });

    test('should convert Event to map without optional fields', () {
      final event = Event(
        id: 1,
        title: 'プール',
        description: null,
        startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
        endDate: null,
        location: null,
        eventType: 'プール',
        repeatType: 1,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final map = event.toMap();

      expect(map['id'], 1);
      expect(map['title'], 'プール');
      expect(map['description'], isNull);
      expect(map['start_date'], '2024-06-15T09:00:00.000Z');
      expect(map['end_date'], isNull);
      expect(map['location'], isNull);
      expect(map['event_type'], 'プール');
      expect(map['repeat_type'], 1);
      expect(map['child_id'], 1);
    });

    test('should create new Event with factory method', () {
      final event = Event.create(
        title: '参観日',
        description: '授業参観があります',
        startDate: DateTime.parse('2024-06-20T10:00:00.000Z'),
        endDate: DateTime.parse('2024-06-20T11:30:00.000Z'),
        location: '教室',
        eventType: '参観日',
        repeatType: 0,
        childId: 1,
      );

      expect(event.id, isNull);
      expect(event.title, '参観日');
      expect(event.description, '授業参観があります');
      expect(event.startDate, DateTime.parse('2024-06-20T10:00:00.000Z'));
      expect(event.endDate, DateTime.parse('2024-06-20T11:30:00.000Z'));
      expect(event.location, '教室');
      expect(event.eventType, '参観日');
      expect(event.repeatType, 0);
      expect(event.childId, 1);
      expect(event.createdAt, isA<DateTime>());
      expect(event.updatedAt, isA<DateTime>());
    });

    test('should check if event is all day', () {
      final allDayEvent = Event(
        id: 1,
        title: 'プール',
        startDate: DateTime.parse('2024-06-15T00:00:00.000Z'),
        endDate: null,
        eventType: 'プール',
        repeatType: 0,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final timedEvent = Event(
        id: 2,
        title: '遠足',
        startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
        endDate: DateTime.parse('2024-06-15T15:00:00.000Z'),
        eventType: '遠足',
        repeatType: 0,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      expect(allDayEvent.isAllDay, isTrue);
      expect(timedEvent.isAllDay, isFalse);
    });

    test('should get correct repeat type text', () {
      final noRepeatEvent = Event(
        id: 1,
        title: '遠足',
        startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
        eventType: '遠足',
        repeatType: 0,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final yearlyEvent = Event(
        id: 2,
        title: '誕生日',
        startDate: DateTime.parse('2024-06-15T00:00:00.000Z'),
        eventType: '誕生日',
        repeatType: 1,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      expect(noRepeatEvent.repeatTypeText, 'なし');
      expect(yearlyEvent.repeatTypeText, '毎年');
    });

    test('should check if event is on specific date', () {
      final event = Event(
        id: 1,
        title: '遠足',
        startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
        endDate: DateTime.parse('2024-06-15T15:00:00.000Z'),
        eventType: '遠足',
        repeatType: 0,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final eventDate = DateTime.parse('2024-06-15T12:00:00.000Z');
      final differentDate = DateTime.parse('2024-06-16T12:00:00.000Z');

      expect(event.isOnDate(eventDate), isTrue);
      expect(event.isOnDate(differentDate), isFalse);
    });

    test('should copy Event with new values', () {
      final original = Event(
        id: 1,
        title: '遠足',
        description: '動物園に行きます',
        startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
        endDate: DateTime.parse('2024-06-15T15:00:00.000Z'),
        location: '動物園',
        eventType: '遠足',
        repeatType: 0,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final copied = original.copyWith(
        title: '水族館遠足',
        location: '水族館',
        description: '水族館に行きます',
      );

      expect(copied.id, 1);
      expect(copied.title, '水族館遠足');
      expect(copied.description, '水族館に行きます');
      expect(copied.startDate, original.startDate);
      expect(copied.endDate, original.endDate);
      expect(copied.location, '水族館');
      expect(copied.eventType, '遠足');
      expect(copied.repeatType, 0);
      expect(copied.childId, 1);
      expect(copied.createdAt, original.createdAt);
      expect(copied.updatedAt.isAfter(original.updatedAt), isTrue);
    });

    test('should compare Event objects correctly', () {
      final event1 = Event(
        id: 1,
        title: '遠足',
        startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
        eventType: '遠足',
        repeatType: 0,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final event2 = Event(
        id: 1,
        title: '遠足',
        startDate: DateTime.parse('2024-06-15T09:00:00.000Z'),
        eventType: '遠足',
        repeatType: 0,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      final event3 = Event(
        id: 2,
        title: 'プール',
        startDate: DateTime.parse('2024-06-16T09:00:00.000Z'),
        eventType: 'プール',
        repeatType: 1,
        childId: 1,
        createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      );

      expect(event1, equals(event2));
      expect(event1, isNot(equals(event3)));
    });
  });
}
