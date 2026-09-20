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
            child: Padding(padding: EdgeInsets.all(24), child: HoldButton()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $danger = ColorToken('micro.danger');
const $radiusLg = RadiusToken('micro.radius.lg');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $danger: const Color(0xFFFF5C7A),
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

class HoldButton extends StatefulWidget {
  const HoldButton({super.key});

  @override
  State<HoldButton> createState() => _HoldButtonState();
}

class _HoldButtonState extends State<HoldButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fill = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  );
  bool _done = false;
  bool _resetOnRelease = false;

  @override
  void initState() {
    super.initState();
    _fill.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => _done = true);
      }
    });
  }

  @override
  void dispose() {
    _fill.dispose();
    super.dispose();
  }

  void _reset() {
    _fill
      ..stop()
      ..value = 0;
    setState(() => _done = false);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        _resetOnRelease = _done;
        if (!_done) _fill.forward();
      },
      onPointerUp: _done
          ? null
          : (_) {
              if (!_done) _fill.reverse();
            },
      onPointerCancel: _done ? null : (_) => _fill.reverse(),
      child: PressableBox(
        key: const Key('hold-button'),
        onPress: () {
          if (_resetOnRelease) _reset();
        },
        style: BoxStyler()
            .width(168)
            .height(48)
            .borderRadiusAll($radiusLg())
            .color($danger())
            .clipBehavior(.antiAlias)
            .alignment(.center)
            .onPressed(.scale(0.98))
            .animate(.spring(220.ms, bounce: 0.08)),
        child: AnimatedBuilder(
          animation: _fill,
          builder: (context, _) {
            return StackBox(
              style: StackBoxStyler().size(168, 48).stackAlignment(.center),
              children: [
                Positioned(
                  bottom: 0,
                  child: Box(
                    style: BoxStyler()
                        .width(168)
                        .height(48 * _fill.value)
                        .color(const Color(0xFF8A1028)),
                  ),
                ),
                StyledText(
                  _done ? 'Deleted' : 'Hold to delete',
                  style: microLabel().color($ink()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
