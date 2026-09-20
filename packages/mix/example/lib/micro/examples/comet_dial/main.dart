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
            child: Padding(padding: EdgeInsets.all(24), child: CometDial()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $track = ColorToken('micro.track');
const $accent = ColorToken('micro.accent');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $track: const Color(0xFF27272F),
  $accent: const Color(0xFF7C6AF7),
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

TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);

class CometDial extends StatefulWidget {
  const CometDial({super.key});

  @override
  State<CometDial> createState() => _CometDialState();
}

class _CometDialState extends State<CometDial> {
  double _angle = -math.pi / 2;
  double _speed = 0;
  bool _settling = false;

  @override
  Widget build(BuildContext context) {
    final progress = ((_angle + math.pi / 2) / (math.pi * 1.5)).clamp(0.0, 1.0);
    return GestureDetector(
      key: const Key('comet-dial'),
      onPanUpdate: (details) {
        setState(() {
          _settling = false;
          _angle = (_angle + details.delta.dx * 0.02).clamp(
            -math.pi / 2,
            math.pi,
          );
          _speed = details.delta.dx.clamp(-12.0, 12.0);
        });
      },
      onPanEnd: (_) => setState(() {
        _settling = true;
        _speed = 0;
      }),
      onPanCancel: () => setState(() {
        _settling = false;
        _speed = 0;
      }),
      child: SizedBox(
        width: 120,
        height: 120,
        child: TweenAnimationBuilder<double>(
          tween: Tween(end: _speed),
          duration: _settling ? 320.ms : Duration.zero,
          curve: Curves.easeOut,
          builder: (context, speed, _) => CustomPaint(
            painter: _CometPainter(
              angle: _angle,
              speed: speed,
              ink: $ink.resolve(context),
              muted: $track.resolve(context),
              accent: $accent.resolve(context),
            ),
            child: Center(
              child: StyledText(
                '${(progress * 100).round()}',
                style: microLabel(22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CometPainter extends CustomPainter {
  _CometPainter({
    required this.angle,
    required this.speed,
    required this.ink,
    required this.muted,
    required this.accent,
  });

  final double angle;
  final double speed;
  final Color ink;
  final Color muted;
  final Color accent;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.shortestSide / 2 - 8;
    for (var i = 0; i < 24; i++) {
      final t = -math.pi / 2 + (math.pi * 1.5) * (i / 23);
      final outer = Offset(
        center.dx + math.cos(t) * radius,
        center.dy + math.sin(t) * radius,
      );
      final inner = Offset(
        center.dx + math.cos(t) * (radius - 8),
        center.dy + math.sin(t) * (radius - 8),
      );
      canvas.drawLine(
        inner,
        outer,
        Paint()
          ..color = t <= angle ? ink : muted
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round,
      );
    }
    final head = Offset(
      center.dx + math.cos(angle) * (radius - 4),
      center.dy + math.sin(angle) * (radius - 4),
    );
    canvas.drawCircle(head, 6, Paint()..color = accent);
    if (speed.abs() > 0.4) {
      final tail = Offset(
        center.dx + math.cos(angle - 0.35 * speed.sign) * (radius - 4),
        center.dy + math.sin(angle - 0.35 * speed.sign) * (radius - 4),
      );
      canvas.drawLine(
        tail,
        head,
        Paint()
          ..color = accent.withValues(
            alpha: 0.45 * (speed.abs() / 12).clamp(0.0, 1.0),
          )
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _CometPainter oldDelegate) {
    return oldDelegate.angle != angle ||
        oldDelegate.speed != speed ||
        oldDelegate.ink != ink ||
        oldDelegate.muted != muted ||
        oldDelegate.accent != accent;
  }
}
