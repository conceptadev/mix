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
            child: Padding(padding: EdgeInsets.all(24), child: RefineFrame()),
          ),
        ),
      ),
    );
  }
}

const $page = ColorToken('micro.page');
const $ink = ColorToken('micro.ink');
const $track = ColorToken('micro.track');
const $accent = ColorToken('micro.accent');
const $like = ColorToken('micro.like');
const $radiusXl = RadiusToken('micro.radius.xl');

Map<ColorToken, Color> microColors() => {
  $page: const Color(0xFF07070B),
  $ink: const Color(0xFFF5F5F7),
  $track: const Color(0xFF27272F),
  $accent: const Color(0xFF7C6AF7),
  $like: const Color(0xFFFF4D6D),
};

Map<RadiusToken, Radius> microRadii() => {$radiusXl: const Radius.circular(16)};

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

TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);

class RefineFrame extends StatefulWidget {
  const RefineFrame({super.key});

  @override
  State<RefineFrame> createState() => _RefineFrameState();
}

class _RefineFrameState extends State<RefineFrame> {
  int _stage = 0;
  static const _labels = ['Queued', 'Generating', 'Refining', 'Complete'];

  @override
  Widget build(BuildContext context) {
    final blur = switch (_stage) {
      0 => 8.0,
      1 => 4.0,
      2 => 1.5,
      _ => 0.0,
    };
    return Pressable(
      key: const Key('refine-frame'),
      onPress: () => setState(() => _stage = (_stage + 1) % 4),
      child: StackBox(
        style: StackBoxStyler()
            .width(180)
            .height(112)
            .borderRadiusAll($radiusXl())
            .clipBehavior(.antiAlias)
            .color($track())
            .stackAlignment(.topLeft),
        children: [
          Box(
            style: BoxStyler()
                .width(180)
                .height(112)
                .linearGradient(
                  colors: [$accent.resolve(context), $like.resolve(context)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                .scale(_stage == 3 ? 1 : 1.06)
                .wrap(WidgetModifierConfig.blur(blur))
                .animate(.easeInOut(420.ms)),
          ),
          Box(
            style: BoxStyler().paddingAll(8),
            child: Box(
              style: BoxStyler()
                  .paddingX(8)
                  .paddingY(4)
                  .shapeStadium()
                  .color($page.resolve(context).withValues(alpha: 0.8)),
              child: StyledText(_labels[_stage], style: microLabel(11)),
            ),
          ),
        ],
      ),
    );
  }
}
