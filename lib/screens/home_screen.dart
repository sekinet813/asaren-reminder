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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: '持ち物'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
        ],
      ),
    );
  }
}

/// ホーム画面のコンテンツ
class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.kAppName,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.kPrimary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                  padding: const EdgeInsets.all(
                    AppConstants.kDefaultPadding * 2,
                  ),
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

                // 説明
                Text(
                  '子育て家庭を支援する持ち物リマインダー',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.kTextSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppConstants.kDefaultPadding * 2),

                // 機能説明カード
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
                    child: Column(
                      children: [
                        Text(
                          '主な機能',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kTextPrimary,
                          ),
                        ),
                        const SizedBox(height: AppConstants.kDefaultPadding),
                        _buildFeatureItem(
                          Icons.person,
                          '子どもの管理',
                          '複数の子どもを登録・管理できます',
                        ),
                        const SizedBox(
                          height: AppConstants.kDefaultPadding / 2,
                        ),
                        _buildFeatureItem(
                          Icons.inventory,
                          '持ち物リスト',
                          '子どもごとの持ち物を管理できます',
                        ),
                        const SizedBox(
                          height: AppConstants.kDefaultPadding / 2,
                        ),
                        _buildFeatureItem(
                          Icons.event,
                          '予定管理',
                          '学校行事やイベントの予定を管理できます',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Row(
      children: [
        Icon(icon, color: AppColors.kPrimary, size: 24),
        const SizedBox(width: AppConstants.kDefaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.kTextPrimary,
                ),
              ),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: AppColors.kTextSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
