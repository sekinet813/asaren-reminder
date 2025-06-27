import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'item_list_screen.dart';
import 'settings_screen.dart';

/// アプリのメイン画面
/// BottomNavigationBarを使って画面を切り替える
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = AppConstants.kHomeIndex;

  // 画面のリスト
  final List<Widget> _screens = [
    const _HomeContent(),
    const ItemListScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppConstants.kHomeTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: AppConstants.kItemListTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppConstants.kSettingsTitle,
          ),
        ],
      ),
    );
  }
}

/// ホーム画面のコンテンツ部分
class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.kHomeTitle,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.kPrimary,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.kBackground, AppColors.kSurface],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
          child: Column(
            children: [
              const SizedBox(height: AppConstants.kDefaultPadding * 2),
              // メインアイコン
              Container(
                padding: const EdgeInsets.all(AppConstants.kDefaultPadding * 2),
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryLight.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.family_restroom,
                  size: 80,
                  color: AppColors.kPrimary,
                ),
              ),
              const SizedBox(height: AppConstants.kDefaultPadding * 2),

              // アプリタイトル
              Text(
                '朝連リマインダー',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kTextPrimary,
                ),
              ),
              const SizedBox(height: AppConstants.kDefaultPadding),

              // サブタイトル
              Text(
                '子育て家庭を支援する持ち物リマインダー',
                style: TextStyle(fontSize: 16, color: AppColors.kTextSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.kDefaultPadding * 3),

              // 機能説明カード
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
                  child: Column(
                    children: [
                      Icon(
                        Icons.touch_app,
                        size: 48,
                        color: AppColors.kSecondary,
                      ),
                      const SizedBox(height: AppConstants.kDefaultPadding),
                      Text(
                        '下のタブから各機能にアクセスできます',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.kTextSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
