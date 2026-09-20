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
            child: Padding(padding: EdgeInsets.all(24), child: ThoughtLine()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $muted = ColorToken('micro.muted');
const $accent = ColorToken('micro.accent');
const $success = ColorToken('micro.success');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $muted: const Color(0xFF8B8B93),
  $accent: const Color(0xFF7C6AF7),
  $success: const Color(0xFF3DD68C),
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
TextStyler microMuted([double size = 12]) =>
    TextStyler().color($muted()).fontSize(size).fontWeight(FontWeight.w500);

class ThoughtLine extends StatefulWidget {
  const ThoughtLine({super.key});

  @override
  State<ThoughtLine> createState() => _ThoughtLineState();
}

class _ThoughtLineState extends State<ThoughtLine> {
  int _step = -1;
  Timer? _timer;

  static const _steps = [
    'Read the tokens',
    'Sketch the motion',
    'Commit the style',
  ];

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _run() {
    _timer?.cancel();
    setState(() => _step = 1);
    _timer = Timer.periodic(const Duration(milliseconds: 420), (timer) {
      if (!mounted) return;
      if (_step >= _steps.length) {
        setState(() => _step++);
        timer.cancel();
        return;
      }
      setState(() => _step++);
    });
  }

  @override
  Widget build(BuildContext context) {
    final done = _step > _steps.length;
    return Pressable(
      key: const Key('thought-line'),
      onPress: _run,
      child: Box(
        style: BoxStyler()
            .size(240, 110)
            .color(Colors.transparent)
            .alignment(.topLeft),
        child: ColumnBox(
          style: FlexBoxStyler().crossAxisAlignment(.start).mainAxisSize(.min),
          children: [
            RowBox(
              style: microRow(spacing: 8),
              children: [
                StyledIcon(
                  icon: done ? Icons.check_circle_outline : Icons.auto_awesome,
                  style: IconStyler()
                      .size(16)
                      .color(done ? $success() : $accent()),
                ),
                StyledText(
                  done
                      ? 'Thought for 1.3s'
                      : (_step < 0 ? 'Run thought' : 'Thinking'),
                  style: microLabel(13),
                ),
              ],
            ),
            for (var i = 0; i < _steps.length; i++)
              IgnorePointer(
                ignoring: done || i >= _step,
                child: ExcludeSemantics(
                  excluding: done || i >= _step,
                  child: ClipRect(
                    child: Box(
                      style: BoxStyler()
                          .wrap(
                            WidgetModifierConfig.align(
                              alignment: Alignment.topLeft,
                              widthFactor: 1,
                              heightFactor: !done && i < _step ? 1 : 0,
                            ),
                          )
                          .wrap(
                            WidgetModifierConfig.opacity(
                              !done && i < _step ? 1 : 0,
                            ),
                          )
                          .animate(.easeOut(180.ms)),
                      child: Box(
                        style: BoxStyler().paddingTop(6).paddingLeft(24),
                        child: StyledText(_steps[i], style: microMuted()),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
