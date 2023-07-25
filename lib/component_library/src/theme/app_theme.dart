import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/component_library/src/theme/app_theme_data.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    super.key,
    required Widget child,
    required this.lightTheme,
    required this.darkTheme,
  }) : super(child: child);

  final AppThemeData lightTheme;
  final AppThemeData darkTheme;

  static AppThemeData of(BuildContext context) {
    final AppTheme? theme =
        context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(theme != null, 'No AppTheme found in context');
    final currentBrightness = Theme.of(context).brightness;
    return currentBrightness == Brightness.dark
        ? theme!.darkTheme
        : theme!.lightTheme;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) =>
      oldWidget.lightTheme != lightTheme || oldWidget.darkTheme != darkTheme;
}
