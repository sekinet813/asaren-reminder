import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// 持ち物リスト画面
/// 現在は仮実装で、テキストラベルのみ表示
class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.kItemListTitle,
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
                  Icons.list_alt,
                  size: 80,
                  color: AppColors.kPrimary,
                ),
              ),
              const SizedBox(height: AppConstants.kDefaultPadding * 2),

              // タイトル
              Text(
                '持ち物リスト',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kTextPrimary,
                ),
              ),
              const SizedBox(height: AppConstants.kDefaultPadding),

              // 説明
              Text(
                'ここに持ち物の一覧が表示されます',
                style: TextStyle(fontSize: 16, color: AppColors.kTextSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.kDefaultPadding * 2),

              // 実装予定バッジ
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.kDefaultPadding,
                  vertical: AppConstants.kDefaultPadding / 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kWarning.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(
                    AppConstants.kBorderRadius,
                  ),
                  border: Border.all(
                    color: AppColors.kWarning.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  '（実装予定）',
                  style: TextStyle(
                    fontSize: 14,
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
