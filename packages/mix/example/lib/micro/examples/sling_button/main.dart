import 'dart:async';

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
            child: Padding(padding: EdgeInsets.all(24), child: SlingButton()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $accent = ColorToken('micro.accent');
const $success = ColorToken('micro.success');
const $radiusXl = RadiusToken('micro.radius.xl');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $accent: const Color(0xFF7C6AF7),
  $success: const Color(0xFF3DD68C),
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

/// Mix `.scale()` and `.translate()` both write `Box.transform`, so compose
/// them as independently interpolated modifiers.
WidgetModifierConfig microPlace({
  double x = 0,
  double y = 0,
  double scale = 1,
  double scaleX = 1,
  double scaleY = 1,
}) {
  return WidgetModifierConfig.translate(x: x, y: y)
      .scale(scale * scaleX, scale * scaleY)
      .orderOfModifiers(const [TranslateModifier, ScaleModifier]);
}

AnimationConfig microFollow({required bool live}) {
  return live ? .linear(1.ms) : .spring(320.ms, bounce: 0.18);
}

TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);

class SlingButton extends StatefulWidget {
  const SlingButton({super.key});

  @override
  State<SlingButton> createState() => _SlingButtonState();
}

class _SlingButtonState extends State<SlingButton> {
  double _pull = 0;
  bool _fired = false;
  bool _dragging = false;
  bool _canceled = false;

  Timer? _resetTimer;

  @override
  void dispose() {
    _resetTimer?.cancel();
    super.dispose();
  }

  void _fire() {
    setState(() => _fired = true);
    _resetTimer = Timer(700.ms, () {
      setState(() {
        _fired = false;
        _pull = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerCancel: (_) => setState(() {
        _canceled = true;
        _dragging = false;
        _pull = 0;
      }),
      child: GestureDetector(
        key: const Key('sling-button'),
        onHorizontalDragStart: _fired
            ? null
            : (_) => setState(() {
                _dragging = true;
                _canceled = false;
              }),
        onHorizontalDragUpdate: _fired
            ? null
            : (details) {
                setState(
                  () => _pull = (_pull - details.delta.dx).clamp(0.0, 36.0),
                );
              },
        onHorizontalDragEnd: _fired
            ? null
            : (_) {
                if (_canceled) return;
                setState(() => _dragging = false);
                if (_pull > 16) {
                  _fire();
                } else {
                  setState(() => _pull = 0);
                }
              },
        onHorizontalDragCancel: () => setState(() {
          _dragging = false;
          _pull = 0;
        }),
        child: Box(
          style: BoxStyler()
              .paddingX(18)
              .paddingY(12)
              .borderRadiusAll($radiusXl())
              .color(_fired ? $success() : $accent())
              .wrap(
                microPlace(x: _fired ? 28 : -_pull, scale: _fired ? 1.04 : 1),
              )
              .animate(microFollow(live: _dragging && !_fired)),
          child: StyledText(
            _fired ? 'Sent' : 'Pull left to send',
            style: microLabel(),
          ),
        ),
      ),
    );
  }
}
