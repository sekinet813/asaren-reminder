import 'package:flutter/foundation.dart';
import '../models/child.dart';
import '../db/app_database.dart';

/// 子どもの状態管理を行うProviderクラス
class ChildProvider extends ChangeNotifier {
  /// 子どもリスト
  List<Child> _children = [];

  /// 選択中の子ども
  Child? _selectedChild;

  /// データベースインスタンス
  final AppDatabase _database = AppDatabase.instance;

  /// ローディング状態
  bool _isLoading = false;

  /// エラー状態
  String? _error;

  /// テスト用：データベース操作を強制的にスキップするフラグ
  bool _forceSkipDatabase = false;

  // ==================== ゲッター ====================

  /// 子どもリストを取得
  List<Child> get children => _children;

  /// 選択中の子どもを取得
  Child? get selectedChild => _selectedChild;

  /// ローディング状態を取得
  bool get isLoading => _isLoading;

  /// エラー状態を取得
  String? get error => _error;

  /// 子どもが存在するかどうかを取得
  bool get hasChildren => _children.isNotEmpty;

  /// 選択中の子どもが存在するかどうかを取得
  bool get hasSelectedChild => _selectedChild != null;

  // ==================== 初期化 ====================

  /// 初期化処理
  Future<void> initialize() async {
    if (_shouldSkipDatabaseOperations()) {
      // Web版またはテスト環境ではデータベース操作をスキップ
      if (kDebugMode) {
        print('ChildProvider: Web版またはテスト環境のため、データベース操作をスキップします');
      }
      return;
    }

    await loadChildren();
    _selectFirstChildIfAvailable();
  }

  /// 子どもリストを読み込み
  Future<void> loadChildren() async {
    if (_shouldSkipDatabaseOperations()) {
      // Web版またはテスト環境ではデータベース操作をスキップ
      if (kDebugMode) {
        print('ChildProvider: Web版またはテスト環境のため、データベース操作をスキップします');
      }
      return;
    }

    try {
      _setLoading(true);
      _clearError();

      final children = await _database.getAllChildren();
      _children = children;

      if (kDebugMode) {
        print('ChildProvider: 子どもリストを読み込みました。件数: ${children.length}');
      }

      notifyListeners();
    } catch (e) {
      _setError('子どもリストの読み込みに失敗しました: $e');
      if (kDebugMode) {
        print('ChildProvider: エラー - $e');
      }
    } finally {
      _setLoading(false);
    }
  }

  /// 最初の子どもを自動選択（子どもが存在する場合）
  void _selectFirstChildIfAvailable() {
    if (_children.isNotEmpty && _selectedChild == null) {
      _selectedChild = _children.first;
      if (kDebugMode) {
        print('ChildProvider: 最初の子どもを自動選択しました: ${_selectedChild!.name}');
      }
      notifyListeners();
    }
  }

  // ==================== 子ども選択 ====================

  /// 子どもを選択
  void selectChild(Child child) {
    // 常に選択を更新する（テスト用にシンプルにする）
    _selectedChild = child;
    if (kDebugMode) {
      print('ChildProvider: 子どもを選択しました: ${child.name}');
    }
    notifyListeners();
  }

  /// 子どもを選択（ID指定）
  void selectChildById(int id) {
    final child = _children.firstWhere(
      (child) => child.id == id,
      orElse: () => throw Exception('指定されたIDの子どもが見つかりません: $id'),
    );
    selectChild(child);
  }

  /// 選択をクリア
  void clearSelection() {
    _selectedChild = null;
    if (kDebugMode) {
      print('ChildProvider: 選択をクリアしました');
    }
    notifyListeners();
  }

  // ==================== 子ども管理 ====================

  /// 子どもを追加
  Future<void> addChild(Child child) async {
    if (_shouldSkipDatabaseOperations()) {
      // Web版またはテスト環境ではメモリ上でのみ管理
      final newChild = child.copyWith(id: _children.length + 1);
      _children.add(newChild);
      if (kDebugMode) {
        print('ChildProvider: Web版またはテスト環境で子どもを追加しました: ${newChild.name}');
      }
      notifyListeners();
      return;
    }

    try {
      _setLoading(true);
      _clearError();

      final id = await _database.insertChild(child);
      final newChild = child.copyWith(id: id);

      _children.add(newChild);

      if (kDebugMode) {
        print('ChildProvider: 子どもを追加しました: ${newChild.name} (ID: $id)');
      }

      notifyListeners();
    } catch (e) {
      _setError('子どもの追加に失敗しました: $e');
      if (kDebugMode) {
        print('ChildProvider: エラー - $e');
      }
    } finally {
      _setLoading(false);
    }
  }

  /// 子どもを更新
  Future<void> updateChild(Child child) async {
    if (_shouldSkipDatabaseOperations()) {
      // Web版またはテスト環境ではメモリ上でのみ管理
      final index = _children.indexWhere((c) => c.id == child.id);
      if (index != -1) {
        _children[index] = child;
        if (_selectedChild?.id == child.id) {
          _selectedChild = child;
        }
        if (kDebugMode) {
          print('ChildProvider: Web版またはテスト環境で子どもを更新しました: ${child.name}');
        }
        notifyListeners();
      }
      return;
    }

    try {
      _setLoading(true);
      _clearError();

      await _database.updateChild(child);

      final index = _children.indexWhere((c) => c.id == child.id);
      if (index != -1) {
        _children[index] = child;

        // 選択中の子どもが更新された場合、選択状態も更新
        if (_selectedChild?.id == child.id) {
          _selectedChild = child;
        }

        if (kDebugMode) {
          print('ChildProvider: 子どもを更新しました: ${child.name}');
        }

        notifyListeners();
      }
    } catch (e) {
      _setError('子どもの更新に失敗しました: $e');
      if (kDebugMode) {
        print('ChildProvider: エラー - $e');
      }
    } finally {
      _setLoading(false);
    }
  }

  /// 子どもを削除
  Future<void> deleteChild(int id) async {
    if (_shouldSkipDatabaseOperations()) {
      // Web版またはテスト環境ではメモリ上でのみ管理
      _children.removeWhere((child) => child.id == id);
      if (_selectedChild?.id == id) {
        _selectedChild = null;
        if (_children.isNotEmpty) {
          _selectedChild = _children.first;
        }
      }
      if (kDebugMode) {
        print('ChildProvider: Web版またはテスト環境で子どもを削除しました: ID $id');
      }
      notifyListeners();
      return;
    }

    try {
      _setLoading(true);
      _clearError();

      await _database.deleteChild(id);

      _children.removeWhere((child) => child.id == id);

      // 削除された子どもが選択中だった場合、選択をクリア
      if (_selectedChild?.id == id) {
        _selectedChild = null;
        // 他の子どもが存在する場合は最初の子どもを選択
        if (_children.isNotEmpty) {
          _selectedChild = _children.first;
        }
      }

      if (kDebugMode) {
        print('ChildProvider: 子どもを削除しました: ID $id');
      }

      notifyListeners();
    } catch (e) {
      _setError('子どもの削除に失敗しました: $e');
      if (kDebugMode) {
        print('ChildProvider: エラー - $e');
      }
    } finally {
      _setLoading(false);
    }
  }

  // ==================== 状態管理 ====================

  /// ローディング状態を設定
  void _setLoading(bool loading) {
    _isLoading = loading;
  }

  /// エラーを設定
  void _setError(String error) {
    _error = error;
  }

  /// エラーをクリア
  void _clearError() {
    _error = null;
  }

  /// エラーをクリア（外部から呼び出し可能）
  void clearError() {
    _clearError();
    notifyListeners();
  }

  // ==================== ヘルパーメソッド ====================

  /// データベース操作をスキップすべきかどうかを判定
  bool _shouldSkipDatabaseOperations() {
    // Web版、テスト環境、または強制スキップフラグが設定されている場合はスキップ
    return kIsWeb || _forceSkipDatabase;
  }

  // ==================== テスト用メソッド ====================

  /// テスト用：内部状態をリセット
  @visibleForTesting
  void resetForTesting() {
    _children.clear();
    _selectedChild = null;
    _isLoading = false;
    _error = null;
    notifyListeners();
  }

  /// テスト用：子どもリストを直接設定
  @visibleForTesting
  void setChildrenForTesting(List<Child> children) {
    _children = children;
    notifyListeners();
  }

  /// テスト用：データベース操作を強制的にスキップするフラグを設定
  @visibleForTesting
  void setForceSkipDatabase(bool skip) {
    _forceSkipDatabase = skip;
    if (kDebugMode) {
      print('ChildProvider: データベース操作スキップフラグを設定しました: $skip');
    }
  }
}
