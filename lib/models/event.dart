/// イベントの情報を管理するモデルクラス
class Event {
  /// イベントの一意ID
  final int? id;

  /// イベントのタイトル
  final String title;

  /// イベントの説明
  final String? description;

  /// イベントの開始日時
  final DateTime startDate;

  /// イベントの終了日時（nullの場合は終日イベント）
  final DateTime? endDate;

  /// イベントの場所
  final String? location;

  /// イベントの種類（遠足、プール、参観日など）
  final String eventType;

  /// 繰り返し設定（0: なし, 1: 毎年, 2: 毎月, 3: 毎週）
  final int repeatType;

  /// 紐づく子どものID
  final int childId;

  /// 作成日時
  final DateTime createdAt;

  /// 更新日時
  final DateTime updatedAt;

  /// コンストラクタ
  const Event({
    this.id,
    required this.title,
    this.description,
    required this.startDate,
    this.endDate,
    this.location,
    required this.eventType,
    required this.repeatType,
    required this.childId,
    required this.createdAt,
    required this.updatedAt,
  });

  /// MapからEventオブジェクトを作成
  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String?,
      startDate: DateTime.parse(map['start_date'] as String),
      endDate: map['end_date'] != null
          ? DateTime.parse(map['end_date'] as String)
          : null,
      location: map['location'] as String?,
      eventType: map['event_type'] as String,
      repeatType: map['repeat_type'] as int,
      childId: map['child_id'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }

  /// EventオブジェクトをMapに変換
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'location': location,
      'event_type': eventType,
      'repeat_type': repeatType,
      'child_id': childId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  /// 新しいEventオブジェクトを作成（IDなし）
  factory Event.create({
    required String title,
    String? description,
    required DateTime startDate,
    DateTime? endDate,
    String? location,
    required String eventType,
    required int repeatType,
    required int childId,
  }) {
    final now = DateTime.now();
    return Event(
      title: title,
      description: description,
      startDate: startDate,
      endDate: endDate,
      location: location,
      eventType: eventType,
      repeatType: repeatType,
      childId: childId,
      createdAt: now,
      updatedAt: now,
    );
  }

  /// 既存のEventオブジェクトを更新
  Event copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
    String? eventType,
    int? repeatType,
    int? childId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      location: location ?? this.location,
      eventType: eventType ?? this.eventType,
      repeatType: repeatType ?? this.repeatType,
      childId: childId ?? this.childId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  /// 終日イベントかどうかを判定
  bool get isAllDay {
    return endDate == null;
  }

  /// 繰り返し設定の文字列表現を取得
  String get repeatTypeText {
    const repeatTypes = ['なし', '毎年', '毎月', '毎週'];
    return repeatTypes[repeatType];
  }

  /// イベントが指定された日付に含まれるかどうかを判定
  bool isOnDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return startDate.isBefore(endOfDay) &&
        (endDate == null || endDate!.isAfter(startOfDay));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Event &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.location == location &&
        other.eventType == eventType &&
        other.repeatType == repeatType &&
        other.childId == childId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        location.hashCode ^
        eventType.hashCode ^
        repeatType.hashCode ^
        childId.hashCode;
  }

  @override
  String toString() {
    return 'Event(id: $id, title: $title, eventType: $eventType, startDate: $startDate, childId: $childId)';
  }
}
