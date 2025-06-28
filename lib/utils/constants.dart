/// アプリ全体で使用する定数
class AppConstants {
  // プライベートコンストラクタ（インスタンス化を防ぐ）
  AppConstants._();

  // アプリ情報
  static const String kAppName = '朝連リマインダー';
  static const String kAppVersion = '1.0.0';

  // 画面タイトル
  static const String kHomeTitle = 'ホーム';
  static const String kItemListTitle = '持ち物リスト';
  static const String kSettingsTitle = '設定';

  // ナビゲーション
  static const int kHomeIndex = 0;
  static const int kItemListIndex = 1;
  static const int kSettingsIndex = 2;
}
