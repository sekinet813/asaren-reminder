import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'utils/constants.dart';
import 'db/app_database.dart';
import 'providers/child_provider.dart';
import 'theme/app_theme.dart';

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
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}
