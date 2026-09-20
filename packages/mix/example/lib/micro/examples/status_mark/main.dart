import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

// Paste this entire file into https://dartpad.dev/ to run the example.
void main() => runApp(const _MicroExampleApp());

class _MicroExampleApp extends StatelessWidget {
  const _MicroExampleApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: microMaterialTheme(),
      builder: (context, child) =>
          MixScope(colors: microColors(), radii: microRadii(), child: child!),
      home: const Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(padding: EdgeInsets.all(24), child: StatusMark()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $muted = ColorToken('micro.muted');
const $success = ColorToken('micro.success');
const $danger = ColorToken('micro.danger');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $muted: const Color(0xFF8B8B93),
  $success: const Color(0xFF3DD68C),
  $danger: const Color(0xFFFF5C7A),
};

Map<RadiusToken, Radius> microRadii() => {};

ThemeData microMaterialTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7C6AF7),
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF07070B),
    useMaterial3: true,
  );
}

FlexBoxStyler microRow({double spacing = 10}) => FlexBoxStyler()
    .spacing(spacing)
    .crossAxisAlignment(.center)
    .mainAxisSize(.min);
TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);

class StatusMark extends StatefulWidget {
  const StatusMark({super.key});

  @override
  State<StatusMark> createState() => _StatusMarkState();
}

class _StatusMarkState extends State<StatusMark>
    with SingleTickerProviderStateMixin {
  late final AnimationController _spin = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  );
  int _stage = 0;

  @override
  void dispose() {
    _spin.dispose();
    super.dispose();
  }

  void _cycle() {
    final next = (_stage + 1) % 4;
    setState(() => _stage = next);
    if (next == 1) {
      _spin.repeat();
    } else {
      _spin.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Pressable(
      key: const Key('status-mark'),
      onPress: _cycle,
      child: RowBox(
        style: microRow(spacing: 10),
        children: [
          AnimatedBuilder(
            animation: _spin,
            builder: (context, _) {
              return TweenAnimationBuilder<double>(
                key: ValueKey(_stage),
                tween: Tween(begin: 0, end: 1),
                duration: 260.ms,
                curve: Curves.easeOut,
                builder: (context, reveal, _) => CustomPaint(
                  size: const Size(22, 22),
                  painter: _StatusPainter(
                    stage: _stage,
                    reveal: reveal,
                    spin: _spin.value,
                    ink: $ink.resolve(context),
                    success: $success.resolve(context),
                    danger: $danger.resolve(context),
                    muted: $muted.resolve(context),
                  ),
                ),
              );
            },
          ),
          StyledText(
            const ['Idle', 'Running', 'Done', 'Failed'][_stage],
            style: microLabel(),
          ),
        ],
      ),
    );
  }
}

class _StatusPainter extends CustomPainter {
  _StatusPainter({
    required this.stage,
    required this.reveal,
    required this.spin,
    required this.ink,
    required this.success,
    required this.danger,
    required this.muted,
  });

  final int stage;
  final double reveal;
  final double spin;
  final Color ink;
  final Color success;
  final Color danger;
  final Color muted;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    if (stage == 0) {
      paint.color = muted.withValues(alpha: reveal);
      canvas.drawCircle(center, 8, paint..strokeWidth = 1.5);
      return;
    }
    if (stage == 1) {
      paint.color = ink.withValues(alpha: reveal);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: 8),
        spin * math.pi * 2,
        math.pi * 1.2 * reveal,
        false,
        paint,
      );
      return;
    }
    paint.color = (stage == 2 ? success : danger).withValues(alpha: reveal);
    canvas.drawCircle(center, 8, paint);
    if (stage == 2) {
      canvas.drawPath(
        Path()
          ..moveTo(center.dx - 4, center.dy)
          ..lineTo(center.dx - 1, center.dy + 3)
          ..lineTo(center.dx + 5, center.dy - 3),
        paint,
      );
    } else {
      canvas
        ..drawLine(
          center + const Offset(-3, -3),
          center + const Offset(3, 3),
          paint,
        )
        ..drawLine(
          center + const Offset(3, -3),
          center + const Offset(-3, 3),
          paint,
        );
    }
  }

  @override
  bool shouldRepaint(covariant _StatusPainter oldDelegate) {
    return oldDelegate.stage != stage ||
        oldDelegate.reveal != reveal ||
        oldDelegate.spin != spin ||
        oldDelegate.ink != ink ||
        oldDelegate.success != success ||
        oldDelegate.danger != danger ||
        oldDelegate.muted != muted;
  }
}
