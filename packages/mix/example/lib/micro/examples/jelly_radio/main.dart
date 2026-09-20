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
            child: Padding(padding: EdgeInsets.all(24), child: JellyRadio()),
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

class JellyRadio extends StatefulWidget {
  const JellyRadio({super.key});

  @override
  State<JellyRadio> createState() => _JellyRadioState();
}

class _JellyRadioState extends State<JellyRadio> {
  static const _labels = ['Quiet', 'Focus', 'Loud'];
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return RowBox(
      key: const Key('jelly-radio'),
      style: microRow(spacing: 8),
      children: [
        for (var i = 0; i < _labels.length; i++)
          PressableBox(
            onPress: () => setState(() => _index = i),
            style: BoxStyler()
                .paddingX(_index == i ? 18 : 12)
                .paddingY(_index == i ? 12 : 8)
                .shapeStadium()
                .color(_index == i ? $ink() : $track())
                .scale(_index == i ? 1.04 : 1)
                .animate(.spring(360.ms, bounce: 0.38)),
            child: StyledText(
              _labels[i],
              style: TextStyler()
                  .fontSize(13)
                  .fontWeight(FontWeight.w700)
                  .color(_index == i ? $page() : $ink())
                  .animate(.easeOut(180.ms)),
            ),
          ),
      ],
    );
  }
}
