import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'utils/constants.dart';
import 'db/app_database.dart';
import 'providers/child_provider.dart';

void main() async {
  // Flutterバインディングを初期化
  WidgetsFlutterBinding.ensureInitialized();

  // プラットフォーム別の初期化
  if (!kIsWeb) {
    // Web以外のプラットフォームでのみデータベースを初期化
    try {
      await AppDatabase.instance.database;
    } catch (e) {
      if (kDebugMode) {
        print('データベース初期化エラー: $e');
      }
    }
  }

  runApp(const AsarenReminderApp());
}

class AsarenReminderApp extends StatelessWidget {
  const AsarenReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChildProvider()..initialize(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
