import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_practice_magic_ball/domain_models/domain_models.dart';

class SettingsRepository {
  SettingsRepository();

  final BehaviorSubject<DarkModePreference> _darkModePreferenceSubject =
      BehaviorSubject();

  Stream<DarkModePreference> getDarkModePreference() async* {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (!_darkModePreferenceSubject.hasValue) {
      final darkModePreference =
          sharedPreferences.getString('darkModePreference');
      switch (darkModePreference) {
        case 'alwaysLight':
          _darkModePreferenceSubject.add(DarkModePreference.alwaysLight);
        case 'alwaysDark':
          _darkModePreferenceSubject.add(DarkModePreference.alwaysDark);
        default:
          _darkModePreferenceSubject.add(DarkModePreference.useSystemSettings);
      }
    }
    yield* _darkModePreferenceSubject.stream;
  }

  Future<void> upsertDarkModePreference(
      DarkModePreference darkModePreference) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    switch (darkModePreference) {
      case DarkModePreference.alwaysLight:
        sharedPreferences.setString('darkModePreference', 'alwaysLight');
        _darkModePreferenceSubject.add(DarkModePreference.alwaysLight);
      case DarkModePreference.alwaysDark:
        sharedPreferences.setString('darkModePreference', 'alwaysDark');
        _darkModePreferenceSubject.add(DarkModePreference.alwaysDark);
      default:
        sharedPreferences.setString('darkModePreference', 'system');
        _darkModePreferenceSubject.add(DarkModePreference.useSystemSettings);
    }
  }
}
