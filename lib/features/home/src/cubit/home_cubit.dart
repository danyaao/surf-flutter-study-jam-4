import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:surf_practice_magic_ball/domain_models/domain_models.dart';
import 'package:surf_practice_magic_ball/fortune_reading_repository/fortune_reading_repository.dart';
import 'package:surf_practice_magic_ball/settings_repository/settings_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.fortuneReadingRepository,
    required this.settingsRepository,
  }) : super(const HomeState.initial());

  final FortuneReadingRepository fortuneReadingRepository;
  final SettingsRepository settingsRepository;

  void showFortuneReading() async {
    emit(
      const HomeState.initial(),
    );
    final fortuneReading =
        await fortuneReadingRepository.getFortuneReadingFromNetwork();
    emit(
      HomeState.success(fortuneReadingText: fortuneReading.text),
    );
  }

  void changeThemePreference(
      DarkModePreference currentDarkModePreference) async {
    switch (currentDarkModePreference) {
      case DarkModePreference.alwaysLight:
        settingsRepository
            .upsertDarkModePreference(DarkModePreference.alwaysDark);
      case DarkModePreference.alwaysDark:
        settingsRepository
            .upsertDarkModePreference(DarkModePreference.alwaysLight);
      default:
        settingsRepository
            .upsertDarkModePreference(DarkModePreference.useSystemSettings);
    }
  }
}
