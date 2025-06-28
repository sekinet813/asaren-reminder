import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import '../routes/app_router.dart';

/// 画面遷移を管理するユーティリティクラス
///
/// アプリ全体での画面遷移を一元管理し、コードの可読性と保守性を向上させる
class NavigationUtils {
  /// プライベートコンストラクタ（インスタンス化を防ぐ）
  NavigationUtils._();

  /// ホーム画面に遷移
  static void goToHome(BuildContext? context) {
    if (context == null) return;

    try {
      context.go(AppRoutes.home);
    } catch (e) {
      if (kDebugMode) {
        print('Navigation error: $e');
      }
    }
  }

  /// 持ち物リスト画面に遷移
  static void goToItems(BuildContext? context) {
    if (context == null) return;

    try {
      context.go(AppRoutes.items);
    } catch (e) {
      if (kDebugMode) {
        print('Navigation error: $e');
      }
    }
  }

  /// 設定画面に遷移
  static void goToSettings(BuildContext? context) {
    if (context == null) return;

    try {
      context.go(AppRoutes.settings);
    } catch (e) {
      if (kDebugMode) {
        print('Navigation error: $e');
      }
    }
  }

  /// 前の画面に戻る
  static void goBack(BuildContext? context) {
    if (context == null) return;

    try {
      if (context.canPop()) {
        context.pop();
      } else {
        goToHome(context);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Navigation error: $e');
      }
    }
  }

  /// 名前付きルートで遷移
  static void goToNamed(BuildContext? context, String routeName) {
    if (context == null) return;

    try {
      context.goNamed(routeName);
    } catch (e) {
      if (kDebugMode) {
        print('Navigation error: $e');
      }
    }
  }

  /// パラメータ付きで遷移（将来的な拡張用）
  static void goToWithParams(
    BuildContext? context,
    String routePath, {
    Map<String, String>? queryParameters,
    Object? extra,
  }) {
    if (context == null) return;

    try {
      context.go(routePath, extra: extra);
    } catch (e) {
      if (kDebugMode) {
        print('Navigation error: $e');
      }
    }
  }
}
