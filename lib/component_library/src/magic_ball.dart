import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/component_library/component_library.dart';

class MagicBall extends StatefulWidget {
  const MagicBall({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final VoidCallback? onTap;

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        children: [
          AnimatedMagicBall(
            text: widget.text,
            onTap: widget.onTap,
            controller: _controller,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedMagicBallShadow(controller: _controller),
          ),
        ],
      ),
    );
  }
}

class AnimatedMagicBall extends StatelessWidget {
  const AnimatedMagicBall({
    super.key,
    required this.text,
    required this.onTap,
    required this.controller,
  });

  final String text;
  final VoidCallback? onTap;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 70 * controller.value),
          child: InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                MagicBallImage(path: theme.magicBall, width: 350),
                MagicBallImage(path: theme.magicBallSmallStars, width: 250),
                MagicBallImage(path: theme.magicBallStars, width: 200),
                MagicBallText(text: text),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AnimatedMagicBallShadow extends StatelessWidget {
  const AnimatedMagicBallShadow({
    super.key,
    required this.controller,
  });

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Stack(
      children: [
        AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            final scale = 1.3 - controller.value;
            return Transform.scale(
              scale: scale > 0.9 ? scale : 0.9,
              child: Image.asset(
                width: 200,
                theme.ballShadow,
              ),
            );
          },
        ),
        Image.asset(
          width: 200,
          theme.ballSmallShadow,
        ),
      ],
    );
  }
}

class MagicBallImage extends StatelessWidget {
  const MagicBallImage({
    super.key,
    required this.path,
    required this.width,
  });

  final String path;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        width: width,
        path,
      ),
    );
  }
}

class MagicBallText extends StatelessWidget {
  const MagicBallText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AnimatedOpacity(
      duration: const Duration(seconds: 3),
      opacity: text == '' ? 0 : 1,
      child: Center(
        child: Stack(
          children: [
            MagicBallImage(path: theme.filledWithTextBall, width: 350),
            Center(
              child: Text(
                style: theme.appTextStyle,
                text,
              ),
            )
          ],
        ),
      ),
    );
  }
}
