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
            child: Padding(padding: EdgeInsets.all(24), child: RubberSegment()),
          ),
        ),
      ),
    );
  }
}

const $page = ColorToken('micro.page');
const $ink = ColorToken('micro.ink');
const $muted = ColorToken('micro.muted');
const $track = ColorToken('micro.track');
const $radiusXs = RadiusToken('micro.radius.xs');
const $radiusSm = RadiusToken('micro.radius.sm');

Map<ColorToken, Color> microColors() => {
  $page: const Color(0xFF07070B),
  $ink: const Color(0xFFF5F5F7),
  $muted: const Color(0xFF8B8B93),
  $track: const Color(0xFF27272F),
};

Map<RadiusToken, Radius> microRadii() => {
  $radiusXs: const Radius.circular(8),
  $radiusSm: const Radius.circular(10),
};

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

class RubberSegment extends StatefulWidget {
  const RubberSegment({super.key});

  @override
  State<RubberSegment> createState() => _RubberSegmentState();
}

class _RubberSegmentState extends State<RubberSegment> {
  static const _labels = ['Day', 'Week', 'Month'];
  int _index = 1;
  final _stretch = ValueNotifier(0);

  @override
  void dispose() {
    _stretch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Box(
      key: const Key('rubber-segment'),
      style: BoxStyler()
          .color($track())
          .borderRadiusAll($radiusSm())
          .paddingAll(3)
          .width(252)
          .height(42),
      child: StackBox(
        style: StackBoxStyler().stackAlignment(.centerLeft),
        children: [
          Box(
            style: BoxStyler()
                .width(80)
                .height(36)
                .translate(_index * 82, 0)
                .animate(.spring(380.ms, bounce: 0.26)),
            child: Box(
              style: BoxStyler()
                  .size(80, 36)
                  .color($ink())
                  .borderRadiusAll($radiusXs())
                  .keyframeAnimation(
                    trigger: _stretch,
                    timeline: [
                      KeyframeTrack<double>('stretch', [
                        .easeOut(1.16, 90.ms),
                        .easeOut(.98, 170.ms),
                        .easeOut(1, 120.ms),
                      ], initial: 1),
                    ],
                    styleBuilder: (values, style) {
                      final stretch = values.get<double>('stretch');
                      return style.wrap(
                        WidgetModifierConfig.scale(x: stretch, y: 1 / stretch),
                      );
                    },
                  ),
            ),
          ),
          RowBox(
            style: FlexBoxStyler().mainAxisAlignment(.spaceBetween),
            children: [
              for (var i = 0; i < _labels.length; i++)
                Expanded(
                  child: PressableBox(
                    onPress: () {
                      if (_index == i) return;
                      setState(() => _index = i);
                      _stretch.value++;
                    },
                    style: BoxStyler().alignment(.center).height(36),
                    child: StyledText(
                      _labels[i],
                      style: TextStyler()
                          .fontSize(13)
                          .fontWeight(FontWeight.w700)
                          .color(_index == i ? $page() : $muted())
                          .animate(.easeOut(180.ms)),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
