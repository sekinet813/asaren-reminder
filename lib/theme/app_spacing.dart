/// アプリ全体で使用するスペーシング定数
/// 8dp Grid Systemに基づく統一された間隔定義
class AppSpacing {
  // プライベートコンストラクタ（インスタンス化を防ぐ）
  AppSpacing._();

  // 基本スペーシング（8dp Grid System）
  static const double kSpacing4 = 4.0;
  static const double kSpacing8 = 8.0;
  static const double kSpacing12 = 12.0;
  static const double kSpacing16 = 16.0;
  static const double kSpacing20 = 20.0;
  static const double kSpacing24 = 24.0;
  static const double kSpacing32 = 32.0;
  static const double kSpacing40 = 40.0;
  static const double kSpacing48 = 48.0;

  // レイアウト用スペーシング
  static const double kDefaultPadding = kSpacing16;
  static const double kCardPadding = kSpacing16;
  static const double kScreenPadding = kSpacing24;
  static const double kButtonPadding = kSpacing16;

  // コンポーネント間隔
  static const double kComponentSpacing = kSpacing8;
  static const double kSectionSpacing = kSpacing24;
  static const double kListSpacing = kSpacing12;
}
