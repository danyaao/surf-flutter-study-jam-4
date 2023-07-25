import 'package:flutter/material.dart';

enum DarkModePreference {
  alwaysDark,
  alwaysLight,
  useSystemSettings,
}

ThemeMode toThemeMode(DarkModePreference? darkModePreference) {
  switch (darkModePreference) {
    case DarkModePreference.alwaysLight:
      return ThemeMode.light;
    case DarkModePreference.alwaysDark:
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}
