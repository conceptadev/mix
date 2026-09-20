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
            child: Padding(padding: EdgeInsets.all(24), child: VoicePill()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $track = ColorToken('micro.track');
const $danger = ColorToken('micro.danger');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $track: const Color(0xFF27272F),
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

class VoicePill extends StatefulWidget {
  const VoicePill({super.key});

  @override
  State<VoicePill> createState() => _VoicePillState();
}

class _VoicePillState extends State<VoicePill>
    with SingleTickerProviderStateMixin {
  late final AnimationController _wave = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 700),
  );
  bool _held = false;

  @override
  void dispose() {
    _wave.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        _wave.repeat();
        setState(() => _held = true);
      },
      onPointerUp: (_) {
        _wave.stop();
        setState(() => _held = false);
      },
      onPointerCancel: (_) {
        _wave.stop();
        setState(() => _held = false);
      },
      child: Box(
        key: const Key('voice-pill'),
        style: BoxStyler()
            .paddingX(_held ? 16 : 12)
            .paddingY(10)
            .shapeStadium()
            .color(_held ? $danger() : $track())
            .animate(.spring(280.ms, bounce: 0.16)),
        child: AnimatedBuilder(
          animation: _wave,
          builder: (context, _) {
            return RowBox(
              style: microRow(spacing: 8),
              children: [
                StyledIcon(
                  icon: Icons.mic_rounded,
                  style: IconStyler().size(18).color($ink()),
                ),
                if (_held)
                  RowBox(
                    style: microRow(spacing: 3),
                    children: [
                      for (var i = 0; i < 5; i++)
                        Box(
                          style: BoxStyler()
                              .width(3)
                              .height(
                                8 +
                                    12 *
                                        (0.4 +
                                            0.6 *
                                                math.sin(
                                                  _wave.value * math.pi * 2 + i,
                                                )),
                              )
                              .borderRounded(99)
                              .color($ink()),
                        ),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
