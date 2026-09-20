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
            child: Padding(padding: EdgeInsets.all(24), child: PeekRating()),
          ),
        ),
      ),
    );
  }
}

const $muted = ColorToken('micro.muted');
const $warning = ColorToken('micro.warning');

Map<ColorToken, Color> microColors() => {
  $muted: const Color(0xFF8B8B93),
  $warning: const Color(0xFFF5C542),
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

FlexBoxStyler microRow({double spacing = 10}) => FlexBoxStyler()
    .spacing(spacing)
    .crossAxisAlignment(.center)
    .mainAxisSize(.min);
TextStyler microMuted([double size = 12]) =>
    TextStyler().color($muted()).fontSize(size).fontWeight(FontWeight.w500);

class PeekRating extends StatefulWidget {
  const PeekRating({super.key});

  @override
  State<PeekRating> createState() => _PeekRatingState();
}

class _PeekRatingState extends State<PeekRating> {
  int _value = 3;
  int? _peek;

  int get _shown => _peek ?? _value;

  void _commit(int next) => setState(() {
    _value = next;
    _peek = null;
  });

  @override
  Widget build(BuildContext context) {
    return ColumnBox(
      style: FlexBoxStyler()
          .spacing(10)
          .crossAxisAlignment(.center)
          .mainAxisSize(.min),
      children: [
        RowBox(
          key: const Key('peek-rating'),
          style: microRow(spacing: 4),
          children: [
            for (var i = 1; i <= 5; i++)
              PressableBox(
                onPress: () => _commit(i),
                style: BoxStyler()
                    .paddingAll(4)
                    .wrap(
                      microPlace(
                        y: _shown >= i ? -4 : 0,
                        scale: _shown >= i ? (_peek == i ? 1.18 : 1.08) : 0.92,
                      ),
                    )
                    .animate(.spring(260.ms, bounce: 0.28)),
                child: MouseRegion(
                  onEnter: (_) => setState(() => _peek = i),
                  onExit: (_) => setState(() => _peek = null),
                  child: StyledIcon(
                    icon: _shown >= i
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    style: IconStyler()
                        .size(28)
                        .color(_shown >= i ? $warning() : $muted())
                        .animate(.easeOut(160.ms)),
                  ),
                ),
              ),
          ],
        ),
        StyledText(
          _peek == null ? '$_value / 5' : 'Peek $_peek',
          style: microMuted(),
        ),
      ],
    );
  }
}
