import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/component_library/component_library.dart';
import 'package:surf_practice_magic_ball/domain_models/domain_models.dart';
import 'package:surf_practice_magic_ball/features/home/src/cubit/home_cubit.dart';
import 'package:surf_practice_magic_ball/fortune_reading_repository/fortune_reading_repository.dart';
import 'package:surf_practice_magic_ball/l10n/app_localizations.dart';
import 'package:surf_practice_magic_ball/settings_repository/settings_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.fortuneReadingRepository,
    required this.settingsRepository,
  });

  final FortuneReadingRepository fortuneReadingRepository;
  final SettingsRepository settingsRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => HomeCubit(
          fortuneReadingRepository: fortuneReadingRepository,
          settingsRepository: settingsRepository),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeCubit get _cubit => context.read<HomeCubit>();

  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(
      onPhoneShake: _cubit.showFortuneReading,
      minimumShakeCount: 3,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 1.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final l10n = AppLocalizations.of(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const GradientBackground(),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                padding: const EdgeInsets.all(10),
                iconSize: 50,
                onPressed: () => _cubit.changeThemePreference(
                    theme.materialThemeData.brightness == Brightness.light
                        ? DarkModePreference.alwaysLight
                        : DarkModePreference.alwaysDark),
                icon: const Icon(Icons.dark_mode),
                color: theme.iconsColor,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Center(
                    child: MagicBall(
                      text: state.fortuneReadingText,
                      onTap: _cubit.showFortuneReading,
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  style: theme.appTextStyle,
                  l10n.activateMagicBallLabel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
