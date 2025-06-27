/// 持ち物の情報を管理するモデルクラス
class Item {
  /// 持ち物の一意ID
  final int? id;

  /// 持ち物の名前
  final String name;

  /// 持ち物のカテゴリ（教科書、給食、体育着など）
  final String category;

  /// 曜日（月=1, 火=2, 水=3, 木=4, 金=5, 土=6, 日=7）
  final int dayOfWeek;

  /// 重要度（1: 必須, 2: 任意）
  final int importance;

  /// メモ
  final String? memo;

  /// 紐づく子どものID
  final int childId;

  /// 作成日時
  final DateTime createdAt;

  /// 更新日時
  final DateTime updatedAt;

  /// コンストラクタ
  const Item({
    this.id,
    required this.name,
    required this.category,
    required this.dayOfWeek,
    required this.importance,
    this.memo,
    required this.childId,
    required this.createdAt,
    required this.updatedAt,
  });

  /// MapからItemオブジェクトを作成
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int?,
      name: map['name'] as String,
      category: map['category'] as String,
      dayOfWeek: map['day_of_week'] as int,
      importance: map['importance'] as int,
      memo: map['memo'] as String?,
      childId: map['child_id'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }

  /// ItemオブジェクトをMapに変換
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'day_of_week': dayOfWeek,
      'importance': importance,
      'memo': memo,
      'child_id': childId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  /// 新しいItemオブジェクトを作成（IDなし）
  factory Item.create({
    required String name,
    required String category,
    required int dayOfWeek,
    required int importance,
    String? memo,
    required int childId,
  }) {
    final now = DateTime.now();
    return Item(
      name: name,
      category: category,
      dayOfWeek: dayOfWeek,
      importance: importance,
      memo: memo,
      childId: childId,
      createdAt: now,
      updatedAt: now,
    );
  }

  /// 既存のItemオブジェクトを更新
  Item copyWith({
    int? id,
    String? name,
    String? category,
    int? dayOfWeek,
    int? importance,
    String? memo,
    int? childId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      importance: importance ?? this.importance,
      memo: memo ?? this.memo,
      childId: childId ?? this.childId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  /// 曜日の文字列表現を取得
  String get dayOfWeekText {
    const days = ['', '月', '火', '水', '木', '金', '土', '日'];
    return days[dayOfWeek];
  }

  /// 重要度の文字列表現を取得
  String get importanceText {
    return importance == 1 ? '必須' : '任意';
  }

  /// 必須アイテムかどうかを判定
  bool get isRequired {
    return importance == 1;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.category == category &&
        other.dayOfWeek == dayOfWeek &&
        other.importance == importance &&
        other.memo == memo &&
        other.childId == childId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        category.hashCode ^
        dayOfWeek.hashCode ^
        importance.hashCode ^
        memo.hashCode ^
        childId.hashCode;
  }

  @override
  String toString() {
    return 'Item(id: $id, name: $name, category: $category, dayOfWeek: $dayOfWeekText, importance: $importanceText, childId: $childId)';
  }
}
