import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_style.dart';
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.kAppName,
          style: AppTextStyle.kDisplayMedium.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [colorScheme.surface, colorScheme.surface],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.kScreenPadding),
            child: Column(
              children: [
                const SizedBox(height: AppSpacing.kSpacing32),
                // メインアイコン
                Container(
                  padding: const EdgeInsets.all(AppSpacing.kSpacing32),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.family_restroom,
                    size: 80,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: AppSpacing.kSpacing32),

                // 説明
                Text(
                  '子育て家庭を支援する持ち物リマインダー',
                  style: AppTextStyle.kBodyLarge.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.kSpacing32),

                // 機能説明カード
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.kCardPadding),
                    child: Column(
                      children: [
                        Text(
                          '主な機能',
                          style: AppTextStyle.kTitleLarge,
                        ),
                        const SizedBox(height: AppSpacing.kSpacing16),
                        _buildFeatureItem(
                          context,
                          Icons.person,
                          '子どもの管理',
                          '複数の子どもを登録・管理できます',
                        ),
                        const SizedBox(height: AppSpacing.kSpacing8),
                        _buildFeatureItem(
                          context,
                          Icons.inventory,
                          '持ち物リスト',
                          '子どもごとの持ち物を管理できます',
                        ),
                        const SizedBox(height: AppSpacing.kSpacing8),
                        _buildFeatureItem(
                          context,
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

  Widget _buildFeatureItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Icon(
          icon,
          color: colorScheme.primary,
          size: 24,
        ),
        const SizedBox(width: AppSpacing.kSpacing16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.kBodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                description,
                style: AppTextStyle.kBodyMedium.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
