import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/component_library/component_library.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final colors = [
      theme.backgroundGradientColor1,
      theme.backgroundGradientColor2,
    ];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
