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
            child: Padding(padding: EdgeInsets.all(24), child: LatticeLoader()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $muted = ColorToken('micro.muted');
const $track = ColorToken('micro.track');
const $success = ColorToken('micro.success');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $muted: const Color(0xFF8B8B93),
  $track: const Color(0xFF27272F),
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

class LatticeLoader extends StatefulWidget {
  const LatticeLoader({super.key});

  @override
  State<LatticeLoader> createState() => _LatticeLoaderState();
}

class _LatticeLoaderState extends State<LatticeLoader> {
  int _phase = 0;
  String _status = 'idle';
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _run() {
    _timer?.cancel();
    setState(() {
      _status = 'run';
      _phase = 0;
    });
    _timer = Timer.periodic(const Duration(milliseconds: 90), (timer) {
      if (!mounted) return;
      setState(() => _phase++);
      if (_phase > 18) {
        timer.cancel();
        setState(() => _status = 'done');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final elapsed = _phase * 0.09;
    return Pressable(
      key: const Key('lattice-loader'),
      onPress: _status == 'run' ? null : _run,
      child: RowBox(
        style: microRow(spacing: 12),
        children: [
          SizedBox(
            width: 42,
            child: Wrap(
              spacing: 3,
              runSpacing: 3,
              children: [
                for (var i = 0; i < 9; i++)
                  Box(
                    style: BoxStyler()
                        .size(12, 12)
                        .borderRounded(3)
                        .color(
                          _status == 'done'
                              ? $success()
                              : (_phase % 9 == i ? $ink() : $track()),
                        )
                        .animate(.easeInOut(120.ms)),
                  ),
              ],
            ),
          ),
          ColumnBox(
            style: FlexBoxStyler()
                .spacing(2)
                .crossAxisAlignment(.start)
                .mainAxisSize(.min),
            children: [
              StyledText(
                _status == 'done' ? 'Shipped' : 'Thinking',
                style: microLabel(),
              ),
              StyledText(
                _status == 'idle'
                    ? 'Tap to run'
                    : '${elapsed.toStringAsFixed(1)}s',
                style: microMuted(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
