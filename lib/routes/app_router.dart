import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/item_list_screen.dart';
import '../screens/settings_screen.dart';

/// アプリケーションのルーティング設定
///
/// 各画面への遷移を一元管理し、Deep Link対応も含む
class AppRouter {
  /// ルート定義
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      // ホーム画面
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.homeName,
        builder: (context, state) => const HomeScreen(),
      ),

      // 持ち物リスト画面
      GoRoute(
        path: AppRoutes.items,
        name: AppRoutes.itemsName,
        builder: (context, state) => const ItemListScreen(),
      ),

      // 設定画面
      GoRoute(
        path: AppRoutes.settings,
        name: AppRoutes.settingsName,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],

    // エラーハンドリング
    errorBuilder: (context, state) => _ErrorScreen(error: state.error),
  );
}

/// ルートパスとルート名の定数
class AppRoutes {
  // パス
  static const String home = '/';
  static const String items = '/items';
  static const String settings = '/settings';

  // ルート名（名前付きルート用）
  static const String homeName = 'home';
  static const String itemsName = 'items';
  static const String settingsName = 'settings';
}

/// エラー画面
class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({required this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('エラー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            const Text(
              'ページが見つかりません',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              error?.toString() ?? '不明なエラーが発生しました',
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('ホームに戻る'),
            ),
          ],
        ),
      ),
    );
  }
}
