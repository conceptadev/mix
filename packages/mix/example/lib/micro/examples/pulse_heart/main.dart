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
            child: Padding(padding: EdgeInsets.all(24), child: PulseHeart()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $muted = ColorToken('micro.muted');
const $track = ColorToken('micro.track');
const $like = ColorToken('micro.like');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $muted: const Color(0xFF8B8B93),
  $track: const Color(0xFF27272F),
  $like: const Color(0xFFFF4D6D),
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

class PulseHeart extends StatefulWidget {
  const PulseHeart({super.key});

  @override
  State<PulseHeart> createState() => _PulseHeartState();
}

class _PulseHeartState extends State<PulseHeart> {
  final _trigger = ValueNotifier(0);
  bool _liked = false;
  int _count = 128;

  @override
  void dispose() {
    _trigger.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      key: const Key('pulse-heart'),
      onPress: () {
        setState(() {
          _liked = !_liked;
          _count += _liked ? 1 : -1;
        });
        _trigger.value++;
      },
      style: BoxStyler()
          .paddingX(14)
          .paddingY(10)
          .shapeStadium()
          .color($track())
          .onPressed(.scale(0.94))
          .animate(.spring(220.ms, bounce: 0.08)),
      child: RowBox(
        style: microRow(spacing: 8),
        children: [
          Box(
            style: BoxStyler().keyframeAnimation(
              trigger: _trigger,
              timeline: [
                KeyframeTrack<double>('scale', [
                  .easeIn(0.72, 160.ms),
                  .elasticOut(1.18, 280.ms),
                  .easeOut(1, 140.ms),
                ], initial: 1),
              ],
              styleBuilder: (values, style) =>
                  style.scale(values.get<double>('scale')),
            ),
            child: StyledIcon(
              icon: _liked
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              style: IconStyler()
                  .size(22)
                  .color(_liked ? $like() : $muted())
                  .animate(.easeOut(160.ms)),
            ),
          ),
          StyledText('$_count', style: microLabel()),
        ],
      ),
    );
  }
}
