import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/child.dart';
import '../models/item.dart';
import '../models/event.dart';

/// SQLiteデータベースの管理を行うクラス
class AppDatabase {
  static const String _databaseName = 'asaren_reminder.db';
  static const int _databaseVersion = 1;

  /// シングルトンインスタンス
  static AppDatabase? _instance;

  /// データベースインスタンス
  Database? _database;

  /// プライベートコンストラクタ
  AppDatabase._();

  /// シングルトンインスタンスを取得
  static AppDatabase get instance {
    _instance ??= AppDatabase._();
    return _instance!;
  }

  /// データベースインスタンスを取得
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// データベースを初期化
  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  /// データベース作成時の処理
  Future<void> _onCreate(Database db, int version) async {
    // 子どもテーブルの作成
    await db.execute('''
      CREATE TABLE children (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        grade TEXT NOT NULL,
        color TEXT NOT NULL,
        photo_path TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    // 持ち物テーブルの作成
    await db.execute('''
      CREATE TABLE items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        category TEXT NOT NULL,
        day_of_week INTEGER NOT NULL,
        importance INTEGER NOT NULL,
        memo TEXT,
        child_id INTEGER NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        FOREIGN KEY (child_id) REFERENCES children (id) ON DELETE CASCADE
      )
    ''');

    // イベントテーブルの作成
    await db.execute('''
      CREATE TABLE events (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        start_date TEXT NOT NULL,
        end_date TEXT,
        location TEXT,
        event_type TEXT NOT NULL,
        repeat_type INTEGER NOT NULL,
        child_id INTEGER NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL,
        FOREIGN KEY (child_id) REFERENCES children (id) ON DELETE CASCADE
      )
    ''');

    // インデックスの作成
    await db.execute('CREATE INDEX idx_items_child_id ON items (child_id)');
    await db.execute(
      'CREATE INDEX idx_items_day_of_week ON items (day_of_week)',
    );
    await db.execute('CREATE INDEX idx_events_child_id ON events (child_id)');
    await db.execute(
      'CREATE INDEX idx_events_start_date ON events (start_date)',
    );
  }

  /// データベースアップグレード時の処理
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // 将来のバージョンアップグレード時に実装
  }

  /// データベースを閉じる
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }

  // ==================== 子ども関連の操作 ====================

  /// 全ての子どもを取得
  Future<List<Child>> getAllChildren() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('children');
    return List.generate(maps.length, (i) => Child.fromMap(maps[i]));
  }

  /// 指定されたIDの子どもを取得
  Future<Child?> getChildById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'children',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return Child.fromMap(maps.first);
  }

  /// 子どもを挿入
  Future<int> insertChild(Child child) async {
    final db = await database;
    return await db.insert('children', child.toMap());
  }

  /// 子どもを更新
  Future<int> updateChild(Child child) async {
    final db = await database;
    return await db.update(
      'children',
      child.toMap(),
      where: 'id = ?',
      whereArgs: [child.id],
    );
  }

  /// 子どもを削除
  Future<int> deleteChild(int id) async {
    final db = await database;
    return await db.delete('children', where: 'id = ?', whereArgs: [id]);
  }

  // ==================== 持ち物関連の操作 ====================

  /// 指定された子どもの持ち物を取得
  Future<List<Item>> getItemsByChildId(int childId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'items',
      where: 'child_id = ?',
      whereArgs: [childId],
      orderBy: 'day_of_week ASC, importance ASC',
    );
    return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
  }

  /// 指定された曜日の持ち物を取得
  Future<List<Item>> getItemsByDayOfWeek(int dayOfWeek) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'items',
      where: 'day_of_week = ?',
      whereArgs: [dayOfWeek],
      orderBy: 'importance ASC',
    );
    return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
  }

  /// 指定された子どもの指定曜日の持ち物を取得
  Future<List<Item>> getItemsByChildIdAndDayOfWeek(
    int childId,
    int dayOfWeek,
  ) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'items',
      where: 'child_id = ? AND day_of_week = ?',
      whereArgs: [childId, dayOfWeek],
      orderBy: 'importance ASC',
    );
    return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
  }

  /// 持ち物を挿入
  Future<int> insertItem(Item item) async {
    final db = await database;
    return await db.insert('items', item.toMap());
  }

  /// 持ち物を更新
  Future<int> updateItem(Item item) async {
    final db = await database;
    return await db.update(
      'items',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  /// 持ち物を削除
  Future<int> deleteItem(int id) async {
    final db = await database;
    return await db.delete('items', where: 'id = ?', whereArgs: [id]);
  }

  // ==================== イベント関連の操作 ====================

  /// 指定された子どものイベントを取得
  Future<List<Event>> getEventsByChildId(int childId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'events',
      where: 'child_id = ?',
      whereArgs: [childId],
      orderBy: 'start_date ASC',
    );
    return List.generate(maps.length, (i) => Event.fromMap(maps[i]));
  }

  /// 指定された日付範囲のイベントを取得
  Future<List<Event>> getEventsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'events',
      where: 'start_date >= ? AND start_date <= ?',
      whereArgs: [startDate.toIso8601String(), endDate.toIso8601String()],
      orderBy: 'start_date ASC',
    );
    return List.generate(maps.length, (i) => Event.fromMap(maps[i]));
  }

  /// 指定された日付のイベントを取得
  Future<List<Event>> getEventsByDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'events',
      where: 'start_date >= ? AND start_date < ?',
      whereArgs: [startOfDay.toIso8601String(), endOfDay.toIso8601String()],
      orderBy: 'start_date ASC',
    );
    return List.generate(maps.length, (i) => Event.fromMap(maps[i]));
  }

  /// イベントを挿入
  Future<int> insertEvent(Event event) async {
    final db = await database;
    return await db.insert('events', event.toMap());
  }

  /// イベントを更新
  Future<int> updateEvent(Event event) async {
    final db = await database;
    return await db.update(
      'events',
      event.toMap(),
      where: 'id = ?',
      whereArgs: [event.id],
    );
  }

  /// イベントを削除
  Future<int> deleteEvent(int id) async {
    final db = await database;
    return await db.delete('events', where: 'id = ?', whereArgs: [id]);
  }

  // ==================== ユーティリティメソッド ====================

  /// データベースをリセット（テスト用）
  Future<void> resetDatabase() async {
    final db = await database;
    await db.delete('events');
    await db.delete('items');
    await db.delete('children');
  }

  /// データベースの統計情報を取得
  Future<Map<String, int>> getDatabaseStats() async {
    final db = await database;
    final childrenCount = Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM children'),
        ) ??
        0;
    final itemsCount = Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM items'),
        ) ??
        0;
    final eventsCount = Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM events'),
        ) ??
        0;

    return {
      'children': childrenCount,
      'items': itemsCount,
      'events': eventsCount,
    };
  }
}
