/// 子どもの情報を管理するモデルクラス
class Child {
  /// 子どもの一意ID
  final int? id;

  /// 子どもの名前
  final String name;

  /// 子どもの学年（例：小学1年生、年長など）
  final String grade;

  /// 子どものテーマカラー（16進数カラーコード）
  final String color;

  /// 子どもの顔画像のファイルパス（nullの場合はデフォルト画像を使用）
  final String? photoPath;

  /// 作成日時
  final DateTime createdAt;

  /// 更新日時
  final DateTime updatedAt;

  /// コンストラクタ
  const Child({
    this.id,
    required this.name,
    required this.grade,
    required this.color,
    this.photoPath,
    required this.createdAt,
    required this.updatedAt,
  });

  /// MapからChildオブジェクトを作成
  factory Child.fromMap(Map<String, dynamic> map) {
    return Child(
      id: map['id'] as int?,
      name: map['name'] as String,
      grade: map['grade'] as String,
      color: map['color'] as String,
      photoPath: map['photo_path'] as String?,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
    );
  }

  /// ChildオブジェクトをMapに変換
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'grade': grade,
      'color': color,
      'photo_path': photoPath,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  /// 新しいChildオブジェクトを作成（IDなし）
  factory Child.create({
    required String name,
    required String grade,
    required String color,
    String? photoPath,
  }) {
    final now = DateTime.now();
    return Child(
      name: name,
      grade: grade,
      color: color,
      photoPath: photoPath,
      createdAt: now,
      updatedAt: now,
    );
  }

  /// 既存のChildオブジェクトを更新
  Child copyWith({
    int? id,
    String? name,
    String? grade,
    String? color,
    String? photoPath,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Child(
      id: id ?? this.id,
      name: name ?? this.name,
      grade: grade ?? this.grade,
      color: color ?? this.color,
      photoPath: photoPath ?? this.photoPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  /// 顔画像が設定されているかどうかを判定
  bool get hasPhoto {
    return photoPath != null && photoPath!.isNotEmpty;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Child &&
        other.id == id &&
        other.name == name &&
        other.grade == grade &&
        other.color == color &&
        other.photoPath == photoPath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        grade.hashCode ^
        color.hashCode ^
        photoPath.hashCode;
  }

  @override
  String toString() {
    return 'Child(id: $id, name: $name, grade: $grade, color: $color, photoPath: $photoPath)';
  }
}
