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
            child: Padding(padding: EdgeInsets.all(24), child: BellToggle()),
          ),
        ),
      ),
    );
  }
}

const $page = ColorToken('micro.page');
const $ink = ColorToken('micro.ink');
const $track = ColorToken('micro.track');

Map<ColorToken, Color> microColors() => {
  $page: const Color(0xFF07070B),
  $ink: const Color(0xFFF5F5F7),
  $track: const Color(0xFF27272F),
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

class BellToggle extends StatefulWidget {
  const BellToggle({super.key});

  @override
  State<BellToggle> createState() => _BellToggleState();
}

class _BellToggleState extends State<BellToggle> {
  final _trigger = ValueNotifier(0);
  bool _on = false;

  @override
  void dispose() {
    _trigger.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      key: const Key('bell-toggle'),
      onPress: () {
        setState(() => _on = !_on);
        _trigger.value++;
      },
      style: BoxStyler()
          .paddingX(_on ? 18 : 14)
          .paddingY(10)
          .shapeStadium()
          .color(_on ? $ink() : $track())
          .animate(.spring(340.ms, bounce: 0.16)),
      child: RowBox(
        style: microRow(spacing: 8),
        children: [
          Box(
            style: BoxStyler().keyframeAnimation(
              trigger: _trigger,
              timeline: [
                KeyframeTrack<double>('tilt', [
                  .easeOut(-0.35, 80.ms),
                  .easeInOut(0.3, 90.ms),
                  .easeInOut(-0.18, 90.ms),
                  .easeOut(0, 80.ms),
                ], initial: 0),
              ],
              styleBuilder: (values, style) =>
                  style.rotate(values.get<double>('tilt')),
            ),
            child: StyledIcon(
              icon: _on
                  ? Icons.notifications_active_rounded
                  : Icons.notifications_off_outlined,
              style: IconStyler().size(18).color(_on ? $page() : $ink()),
            ),
          ),
          StyledText(
            _on ? 'Notify me' : 'Muted',
            style: microLabel().color(_on ? $page() : $ink()),
          ),
        ],
      ),
    );
  }
}
