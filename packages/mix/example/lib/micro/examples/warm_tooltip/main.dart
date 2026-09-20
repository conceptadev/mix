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
            child: Padding(padding: EdgeInsets.all(24), child: WarmTooltip()),
          ),
        ),
      ),
    );
  }
}

const $page = ColorToken('micro.page');
const $ink = ColorToken('micro.ink');
const $track = ColorToken('micro.track');
const $hover = ColorToken('micro.hover');
const $radiusXs = RadiusToken('micro.radius.xs');
const $radiusMd = RadiusToken('micro.radius.md');

Map<ColorToken, Color> microColors() => {
  $page: const Color(0xFF07070B),
  $ink: const Color(0xFFF5F5F7),
  $track: const Color(0xFF27272F),
  $hover: const Color(0xFF32323C),
};

Map<RadiusToken, Radius> microRadii() => {
  $radiusXs: const Radius.circular(8),
  $radiusMd: const Radius.circular(12),
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

FlexBoxStyler microRow({double spacing = 10}) => FlexBoxStyler()
    .spacing(spacing)
    .crossAxisAlignment(.center)
    .mainAxisSize(.min);
TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);

class WarmTooltip extends StatefulWidget {
  const WarmTooltip({super.key});

  @override
  State<WarmTooltip> createState() => _WarmTooltipState();
}

class _WarmTooltipState extends State<WarmTooltip> {
  int? _open;
  bool _warm = false;
  Timer? _cooldown;
  Timer? _delay;

  @override
  void dispose() {
    _delay?.cancel();
    _cooldown?.cancel();
    super.dispose();
  }

  void _enter(int index) {
    _delay?.cancel();
    _cooldown?.cancel();
    if (_warm) {
      setState(() => _open = index);
      return;
    }
    _delay = Timer(const Duration(milliseconds: 280), () {
      if (!mounted) return;
      setState(() {
        _open = index;
        _warm = true;
      });
    });
  }

  void _exit() {
    _delay?.cancel();
    _cooldown?.cancel();
    _cooldown = Timer(700.ms, () => _warm = false);
    setState(() => _open = null);
  }

  @override
  Widget build(BuildContext context) {
    const items = [
      (Icons.cut_rounded, 'Cut'),
      (Icons.content_copy_rounded, 'Copy'),
      (Icons.content_paste_rounded, 'Paste'),
    ];
    return RowBox(
      key: const Key('warm-tooltip'),
      style: microRow(spacing: 8),
      children: [
        for (var i = 0; i < items.length; i++)
          MouseRegion(
            onEnter: (_) => _enter(i),
            onExit: (_) => _exit(),
            child: ColumnBox(
              style: FlexBoxStyler()
                  .spacing(6)
                  .crossAxisAlignment(.center)
                  .mainAxisSize(.min),
              children: [
                Box(
                  style: BoxStyler()
                      .paddingX(8)
                      .paddingY(4)
                      .borderRadiusAll($radiusXs())
                      .color($ink())
                      .wrap(WidgetModifierConfig.opacity(_open == i ? 1 : 0))
                      .translate(0, _open == i ? 0 : 6)
                      .animate(.easeOut(220.ms)),
                  child: StyledText(
                    items[i].$2,
                    style: microLabel(11).color($page()),
                  ),
                ),
                PressableBox(
                  onPress: () {},
                  style: BoxStyler()
                      .size(40, 40)
                      .borderRadiusAll($radiusMd())
                      .color($track())
                      .alignment(.center)
                      .onHovered(.color($hover()))
                      .animate(.easeOut(160.ms)),
                  child: StyledIcon(
                    icon: items[i].$1,
                    style: IconStyler().size(18).color($ink()),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
