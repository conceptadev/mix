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
            child: Padding(padding: EdgeInsets.all(24), child: FolderFloat()),
          ),
        ),
      ),
    );
  }
}

const $page = ColorToken('micro.page');
const $ink = ColorToken('micro.ink');
const $warning = ColorToken('micro.warning');
const $radiusSm = RadiusToken('micro.radius.sm');

Map<ColorToken, Color> microColors() => {
  $page: const Color(0xFF07070B),
  $ink: const Color(0xFFF5F5F7),
  $warning: const Color(0xFFF5C542),
};

Map<RadiusToken, Radius> microRadii() => {$radiusSm: const Radius.circular(10)};

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

class FolderFloat extends StatefulWidget {
  const FolderFloat({super.key});

  @override
  State<FolderFloat> createState() => _FolderFloatState();
}

class _FolderFloatState extends State<FolderFloat> {
  bool _open = false;

  static const _notes = ['Brief', 'Tokens', 'Motion'];

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      key: const Key('folder-float'),
      onEnter: (_) => setState(() => _open = true),
      onExit: (_) => setState(() => _open = false),
      child: SizedBox(
        width: 240,
        height: 140,
        child: StackBox(
          style: StackBoxStyler().stackAlignment(.bottomCenter),
          children: [
            Box(
              style: BoxStyler()
                  .size(28, 12)
                  .borderRounded(4)
                  .color($warning())
                  .translate(-20, -50),
            ),
            for (var i = 0; i < _notes.length; i++)
              ExcludeSemantics(
                excluding: !_open,
                child: Box(
                  style: BoxStyler()
                      .wrap(WidgetModifierConfig.opacity(_open ? 1 : 0))
                      .animate(.easeOut(180.ms)),
                  child: Box(
                    key: Key('folder-note-$i'),
                    style: BoxStyler()
                        .size(68, 34)
                        .alignment(.center)
                        .borderRadiusAll($radiusSm())
                        .color($ink())
                        .translate(
                          (i - 1) * (_open ? 76.0 : 0.0),
                          _open ? -78 + i * 2 : -18,
                        )
                        .rotate(_open ? (i - 1) * 0.08 : 0)
                        .animate(.spring(380.ms, bounce: 0.22)),
                    child: StyledText(
                      _notes[i],
                      style: microLabel(12).color($page()),
                    ),
                  ),
                ),
              ),
            PressableBox(
              onPress: () => setState(() => _open = !_open),
              style: BoxStyler()
                  .size(72, 56)
                  .borderRadius(
                    BorderRadiusGeometryMix.only(
                      topLeft: const Radius.circular(8),
                      topRight: const Radius.circular(18),
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
                    ),
                  )
                  .color($warning())
                  .alignment(.center)
                  .translate(0, _open ? 4 : 0)
                  .animate(.spring(320.ms, bounce: 0.18)),
              child: StyledText('Files', style: microLabel(12).color($page())),
            ),
          ],
        ),
      ),
    );
  }
}
