import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemeData {
  ThemeData get materialThemeData;

  Color get iconsColor;

  Color get backgroundGradientColor1;

  Color get backgroundGradientColor2;

  String get magicErrorBall;

  String get magicBall;

  String get magicBallStars;

  String get magicBallSmallStars;

  String get filledWithTextBall;

  String get ballShadow;

  String get ballSmallShadow;

  TextStyle get appTextStyle => GoogleFonts.montserrat(
        fontSize: 17,
      );
}

class LightAppThemeData extends AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
        brightness: Brightness.light,
      );

  @override
  Color get iconsColor => const Color(0xDDD9D9FF);

  @override
  Color get backgroundGradientColor1 => const Color(0xFFFFFFFF);

  @override
  Color get backgroundGradientColor2 => const Color(0xFFD2D2FF);

  @override
  String get magicBall => 'assets/images/magic_ball/light_ball.png';

  @override
  String get magicErrorBall => 'assets/images/magic_ball/light_error_ball.png';

  @override
  String get magicBallSmallStars =>
      'assets/images/magic_ball/light_small_stars.png';

  @override
  String get magicBallStars => 'assets/images/magic_ball/light_stars.png';

  @override
  String get filledWithTextBall =>
      'assets/images/magic_ball/light_filled_with_text_ball.png';

  @override
  String get ballShadow => 'assets/images/magic_ball/light_shadow.png';

  @override
  String get ballSmallShadow =>
      'assets/images/magic_ball/light_small_shadow.png';
}

class DarkAppThemeData extends AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
        brightness: Brightness.dark,
      );

  @override
  Color get iconsColor => const Color(0xDD01FFFF);

  @override
  Color get backgroundGradientColor1 => const Color(0xFF100C2C);

  @override
  Color get backgroundGradientColor2 => const Color(0xFF000000);

  @override
  String get magicBall => 'assets/images/magic_ball/dark_ball.png';

  @override
  String get magicErrorBall => 'assets/images/magic_ball/dark_error_ball.png';

  @override
  String get magicBallSmallStars =>
      'assets/images/magic_ball/dark_small_stars.png';

  @override
  String get magicBallStars => 'assets/images/magic_ball/dark_stars.png';

  @override
  String get filledWithTextBall =>
      'assets/images/magic_ball/dark_filled_with_text_ball.png';

  @override
  String get ballShadow => 'assets/images/magic_ball/dark_shadow.png';

  @override
  String get ballSmallShadow =>
      'assets/images/magic_ball/dark_small_shadow.png';
}
