import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_style.dart';

/// 持ち物リスト画面
/// 現在は仮実装で、テキストラベルのみ表示
class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.kItemListTitle,
          style: AppTextStyle.kDisplayMedium.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
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
                  Icons.list_alt,
                  size: 80,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: AppSpacing.kSpacing32),

              // 説明
              Text(
                'ここに持ち物の一覧が表示されます',
                style: AppTextStyle.kBodyLarge.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.kSpacing32),

              // 実装予定バッジ
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.kSpacing16,
                  vertical: AppSpacing.kSpacing8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kWarning.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: AppColors.kWarning.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  '（実装予定）',
                  style: AppTextStyle.kBodyMedium.copyWith(
                    color: AppColors.kWarning,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
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
