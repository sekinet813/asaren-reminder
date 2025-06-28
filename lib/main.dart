import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'utils/constants.dart';
import 'db/app_database.dart';

void main() async {
  // Flutterバインディングを初期化
  WidgetsFlutterBinding.ensureInitialized();

  // データベースを初期化
  await AppDatabase.instance.database;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.kAppName,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.kPrimary,
          brightness: Brightness.light,
        ),
        // カスタムテーマ設定
        primaryColor: AppColors.kPrimary,
        scaffoldBackgroundColor: AppColors.kBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.kPrimary,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.kPrimary,
          unselectedItemColor: AppColors.kTextSecondary,
          type: BottomNavigationBarType.fixed,
        ),
        cardTheme: CardThemeData(
          elevation: AppConstants.kCardElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.kBorderRadius),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.kBorderRadius),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
