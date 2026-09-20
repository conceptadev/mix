import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            child: Padding(padding: EdgeInsets.all(24), child: ScrubField()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $track = ColorToken('micro.track');
const $radiusLg = RadiusToken('micro.radius.lg');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $track: const Color(0xFF27272F),
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

class ScrubField extends StatefulWidget {
  const ScrubField({super.key});

  @override
  State<ScrubField> createState() => _ScrubFieldState();
}

class _ScrubFieldState extends State<ScrubField> {
  double _value = 24;
  bool _editing = false;
  final _controller = TextEditingController(text: '24');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _set(double next) {
    final clamped = next.clamp(0.0, 100.0);
    setState(() {
      _value = clamped;
      _controller.text = clamped.round().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _editing
          ? null
          : (details) => _set(_value + details.delta.dx * 0.25),
      child: PressableBox(
        key: const Key('scrub-field'),
        onPress: () => setState(() => _editing = true),
        style: BoxStyler()
            .width(104)
            .height(46)
            .alignment(.center)
            .paddingX(16)
            .paddingY(10)
            .borderRadiusAll($radiusLg())
            .color($track())
            .onPressed(.scale(0.98))
            .animate(.spring(200.ms, bounce: 0.08)),
        child: _editing
            ? SizedBox(
                width: 72,
                child: TextField(
                  controller: _controller,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: TextStyle(
                    color: $ink.resolve(context),
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) {
                    _set(double.tryParse(value) ?? _value);
                    setState(() => _editing = false);
                  },
                ),
              )
            : StyledText('${_value.round()} px', style: microLabel()),
      ),
    );
  }
}
