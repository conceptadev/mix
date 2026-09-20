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
            child: Padding(padding: EdgeInsets.all(24), child: SloshGauge()),
          ),
        ),
      ),
    );
  }
}

const $playground = ColorToken('micro.playground');
const $ink = ColorToken('micro.ink');
const $accent = ColorToken('micro.accent');
const $like = ColorToken('micro.like');
const $radiusXl = RadiusToken('micro.radius.xl');

Map<ColorToken, Color> microColors() => {
  $playground: const Color(0xFF0C0C12),
  $ink: const Color(0xFFF5F5F7),
  $accent: const Color(0xFF7C6AF7),
  $like: const Color(0xFFFF4D6D),
};

Map<RadiusToken, Radius> microRadii() => {$radiusXl: const Radius.circular(16)};

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

AnimationConfig microFollow({required bool live}) {
  return live ? .linear(1.ms) : .spring(320.ms, bounce: 0.18);
}

TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);

class SloshGauge extends StatefulWidget {
  const SloshGauge({super.key});

  @override
  State<SloshGauge> createState() => _SloshGaugeState();
}

class _SloshGaugeState extends State<SloshGauge> {
  double _value = 0.42;
  double _tilt = 0;
  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    return ColumnBox(
      key: const Key('slosh-gauge'),
      style: FlexBoxStyler()
          .spacing(10)
          .crossAxisAlignment(.center)
          .mainAxisSize(.min),
      children: [
        GestureDetector(
          onVerticalDragStart: (_) => setState(() => _dragging = true),
          onVerticalDragEnd: (_) => setState(() => _dragging = false),
          onVerticalDragCancel: () => setState(() => _dragging = false),
          onVerticalDragUpdate: (details) {
            setState(() {
              _value = (_value - details.delta.dy / 120).clamp(0.0, 1.0);
              _tilt = (-details.delta.dy / 120).clamp(-.12, .12);
            });
          },
          child: Box(
            style: BoxStyler()
                .width(72)
                .height(112)
                .borderRadiusAll($radiusXl())
                .border(.color(const Color(0x33FFFFFF)).width(2))
                .clipBehavior(.antiAlias)
                .color($playground())
                .alignment(.bottomCenter),
            child: Box(
              style: BoxStyler()
                  .width(72)
                  .height(112 * _value)
                  .animate(.linear(1.ms)),
              // Spring only the tilt: a height spring can overshoot below zero.
              child: Box(
                style: BoxStyler()
                    .size(72, 112)
                    .linearGradient(
                      colors: [
                        $accent.resolve(context),
                        $like.resolve(context),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )
                    .skew(0, _dragging ? _tilt : 0)
                    .animate(microFollow(live: _dragging)),
              ),
            ),
          ),
        ),
        StyledText('${(_value * 100).round()}%', style: microLabel()),
      ],
    );
  }
}
