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
            child: Padding(padding: EdgeInsets.all(24), child: DodgeField()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $accent = ColorToken('micro.accent');
const $radiusLg = RadiusToken('micro.radius.lg');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $accent: const Color(0xFF7C6AF7),
};

Map<RadiusToken, Radius> microRadii() => {$radiusLg: const Radius.circular(14)};

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

class DodgeField extends StatefulWidget {
  const DodgeField({super.key});

  @override
  State<DodgeField> createState() => _DodgeFieldState();
}

class _DodgeFieldState extends State<DodgeField> {
  Offset _offset = Offset.zero;
  int _tries = 0;

  void _dodge(Offset local, Size size) {
    if (_tries >= 3) {
      setState(() => _offset = Offset.zero);
      return;
    }
    final center = size.center(Offset.zero) + _offset;
    if ((local - center).distance > 46) return;
    final dir = local == center
        ? const Offset(1, 0)
        : (center - local) / (center - local).distance;
    setState(() {
      _tries += 1;
      _offset = _tries >= 3
          ? Offset.zero
          : Offset(
              (_offset.dx + dir.dx * 36).clamp(-70.0, 70.0),
              (_offset.dy + dir.dy * 24).clamp(-28.0, 28.0),
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      key: const Key('dodge-field'),
      onHover: (event) => _dodge(event.localPosition, const Size(240, 120)),
      child: Box(
        style: BoxStyler().width(240).height(120).alignment(.center),
        child: PressableBox(
          onPress: () => setState(() {
            _tries = 0;
            _offset = Offset.zero;
          }),
          style: BoxStyler()
              .paddingX(16)
              .paddingY(10)
              .borderRadiusAll($radiusLg())
              .color($accent())
              .translate(_offset.dx, _offset.dy)
              .animate(.spring(280.ms, bounce: 0.32)),
          child: StyledText(
            _tries >= 3 ? 'Fine, you win' : 'Catch me',
            style: microLabel(),
          ),
        ),
      ),
    );
  }
}
