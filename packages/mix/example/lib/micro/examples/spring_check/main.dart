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
            child: Padding(padding: EdgeInsets.all(24), child: SpringCheck()),
          ),
        ),
      ),
    );
  }
}

const $page = ColorToken('micro.page');
const $ink = ColorToken('micro.ink');
const $radiusCheck = RadiusToken('micro.radius.check');

Map<ColorToken, Color> microColors() => {
  $page: const Color(0xFF07070B),
  $ink: const Color(0xFFF5F5F7),
};

Map<RadiusToken, Radius> microRadii() => {
  $radiusCheck: const Radius.circular(6),
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

class SpringCheck extends StatefulWidget {
  const SpringCheck({super.key});

  @override
  State<SpringCheck> createState() => _SpringCheckState();
}

class _SpringCheckState extends State<SpringCheck> {
  bool _on = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Ship the build',
      checked: _on,
      child: Pressable(
        key: const Key('spring-check'),
        onPress: () => setState(() => _on = !_on),
        child: RowBox(
          style: microRow(spacing: 12).paddingY(8),
          children: [
            StackBox(
              style: StackBoxStyler()
                  .size(28, 28)
                  .borderRadiusAll($radiusCheck())
                  .clipBehavior(.antiAlias)
                  .stackAlignment(.center)
                  .onPressed(.scale(0.95))
                  .animate(.easeOut(160.ms)),
              children: [
                Box(
                  style: BoxStyler()
                      .size(28, 28)
                      .borderRadiusAll($radiusCheck())
                      .border(.color($ink()).width(2))
                      .wrap(WidgetModifierConfig.opacity(0.28))
                      .onHovered(.new().wrap(WidgetModifierConfig.opacity(0.5)))
                      .animate(.easeOut(120.ms)),
                ),
                Box(
                  key: const Key('spring-check-fill'),
                  style: BoxStyler()
                      .size(28, 28)
                      .color($ink())
                      .borderRadiusAll($radiusCheck())
                      .scale(_on ? 1 : 0.01)
                      .animate(.spring(280.ms, bounce: 0.22)),
                ),
                StyledIcon(
                  icon: Icons.check_rounded,
                  style: IconStyler()
                      .size(18)
                      .color($page())
                      .wrap(WidgetModifierConfig.opacity(_on ? 1 : 0))
                      .animate(.easeOut(140.ms, delay: 40.ms)),
                ),
              ],
            ),
            StackBox(
              style: StackBoxStyler().stackAlignment(.centerLeft),
              children: [
                StyledText(
                  'Ship the build',
                  style: microLabel(18)
                      .wrap(WidgetModifierConfig.opacity(_on ? 0.42 : 1))
                      .animate(.easeOut(220.ms)),
                ),
                Positioned.fill(
                  child: Box(
                    style: BoxStyler()
                        .height(1.5)
                        .color($ink())
                        .borderRounded(2)
                        .wrap(
                          WidgetModifierConfig.align(
                            alignment: const Alignment(-1, -0.08),
                            widthFactor: 1,
                          ).scale(_on ? 1 : 0.01, 1, alignment: .centerLeft),
                        )
                        .animate(.spring(240.ms, bounce: 0.06)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
