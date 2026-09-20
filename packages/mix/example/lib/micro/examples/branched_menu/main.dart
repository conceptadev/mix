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
            child: Padding(padding: EdgeInsets.all(24), child: BranchedMenu()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $muted = ColorToken('micro.muted');
const $track = ColorToken('micro.track');
const $accent = ColorToken('micro.accent');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $muted: const Color(0xFF8B8B93),
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

FlexBoxStyler microRow({double spacing = 10}) => FlexBoxStyler()
    .spacing(spacing)
    .crossAxisAlignment(.center)
    .mainAxisSize(.min);
TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);
TextStyler microMuted([double size = 12]) =>
    TextStyler().color($muted()).fontSize(size).fontWeight(FontWeight.w500);

class BranchedMenu extends StatefulWidget {
  const BranchedMenu({super.key});

  @override
  State<BranchedMenu> createState() => _BranchedMenuState();
}

class _BranchedMenuState extends State<BranchedMenu> {
  int _section = 0;
  int _item = 0;

  static const _tree = [
    ('Design', ['Tokens', 'Type', 'Color']),
    ('Motion', ['Spring', 'Keyframes']),
  ];

  @override
  Widget build(BuildContext context) {
    return RowBox(
      key: const Key('branched-menu'),
      style: microRow(spacing: 12),
      children: [
        Box(
          style: BoxStyler()
              .width(3)
              .height(118)
              .borderRounded(99)
              .color($track())
              .alignment(.topCenter),
          child: Box(
            style: BoxStyler()
                .width(3)
                .height(28)
                .color($accent())
                .borderRounded(99)
                .translate(0, 8 + _section * 56.0 + _item * 8)
                .animate(.spring(320.ms, bounce: 0.14)),
          ),
        ),
        ColumnBox(
          style: FlexBoxStyler()
              .spacing(8)
              .crossAxisAlignment(.start)
              .mainAxisSize(.min),
          children: [
            for (var s = 0; s < _tree.length; s++)
              ColumnBox(
                style: FlexBoxStyler()
                    .spacing(4)
                    .crossAxisAlignment(.start)
                    .mainAxisSize(.min),
                children: [
                  Pressable(
                    onPress: () => setState(() {
                      _section = s;
                      _item = 0;
                    }),
                    child: StyledText(
                      _tree[s].$1,
                      style: microLabel().color(
                        _section == s ? $ink() : $muted(),
                      ),
                    ),
                  ),
                  IgnorePointer(
                    ignoring: _section != s,
                    child: ExcludeSemantics(
                      excluding: _section != s,
                      child: ClipRect(
                        key: Key('branch-fold-$s'),
                        child: Box(
                          style: BoxStyler()
                              .wrap(
                                WidgetModifierConfig.align(
                                  alignment: Alignment.topLeft,
                                  widthFactor: 1,
                                  heightFactor: _section == s ? 1 : 0,
                                ),
                              )
                              .animate(.easeOut(300.ms)),
                          child: ColumnBox(
                            style: FlexBoxStyler()
                                .spacing(4)
                                .crossAxisAlignment(.start)
                                .mainAxisSize(.min),
                            children: [
                              for (var i = 0; i < _tree[s].$2.length; i++)
                                PressableBox(
                                  onPress: () => setState(() => _item = i),
                                  style: BoxStyler()
                                      .paddingX(8)
                                      .translate(_item == i ? 6 : 0, 0)
                                      .animate(.spring(240.ms, bounce: 0.12)),
                                  child: StyledText(
                                    _tree[s].$2[i],
                                    style: microMuted().color(
                                      _item == i ? $accent() : $muted(),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
