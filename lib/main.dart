import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:surf_practice_magic_ball/component_library/component_library.dart';
import 'package:surf_practice_magic_ball/domain_models/domain_models.dart';
import 'package:surf_practice_magic_ball/eightball_api/eightball_api.dart';
import 'package:surf_practice_magic_ball/features/home/home.dart';
import 'package:surf_practice_magic_ball/fortune_reading_repository/fortune_reading_repository.dart';
import 'package:surf_practice_magic_ball/l10n/app_localizations.dart';
import 'package:surf_practice_magic_ball/settings_repository/settings_repository.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(
      const App(),
    );
  }, (error, stack) {});
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _eightballApi = EightballApi();
  late final _fortuneReadingRepository =
      FortuneReadingRepository(eightballApi: _eightballApi);
  final _settingRepository = SettingsRepository();

  final _lightTheme = LightAppThemeData();
  final _darkTheme = DarkAppThemeData();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DarkModePreference>(
        stream: _settingRepository.getDarkModePreference(),
        builder: (context, snapshot) {
          final darkModePreference = snapshot.data;
          return AppTheme(
            lightTheme: _lightTheme,
            darkTheme: _darkTheme,
            child: MaterialApp(
              theme: _lightTheme.materialThemeData,
              darkTheme: _darkTheme.materialThemeData,
              themeMode: toThemeMode(darkModePreference),
              supportedLocales: const [
                Locale('en'),
                Locale('ru'),
              ],
              localizationsDelegates: const [
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              home: HomeScreen(
                fortuneReadingRepository: _fortuneReadingRepository,
                settingsRepository: _settingRepository,
              ),
            ),
          );
        });
  }
}
