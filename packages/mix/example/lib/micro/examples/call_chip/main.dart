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
            child: Padding(padding: EdgeInsets.all(24), child: CallChip()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $track = ColorToken('micro.track');
const $success = ColorToken('micro.success');
const $danger = ColorToken('micro.danger');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $track: const Color(0xFF27272F),
  $success: const Color(0xFF3DD68C),
  $danger: const Color(0xFFFF5C7A),
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

TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);

class CallChip extends StatefulWidget {
  const CallChip({super.key});

  @override
  State<CallChip> createState() => _CallChipState();
}

class _CallChipState extends State<CallChip> {
  String _phase = 'idle';
  bool _okNext = true;

  void _run() {
    if (_phase == 'run') return;
    _okNext = _phase != 'ok';
    setState(() => _phase = 'idle');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() => _phase = 'run');
    });
  }

  void _finish() {
    if (!mounted || _phase != 'run') return;
    setState(() => _phase = _okNext ? 'ok' : 'bad');
  }

  @override
  Widget build(BuildContext context) {
    return Pressable(
      key: const Key('call-chip'),
      onPress: _run,
      child: StackBox(
        style: StackBoxStyler()
            .width(168)
            .height(36)
            .shapeStadium()
            .clipBehavior(.antiAlias)
            .color($track())
            .stackAlignment(.centerLeft),
        children: [
          KeyedSubtree(
            key: ValueKey(_okNext),
            child: Box(
              key: const Key('call-fill'),
              style: BoxStyler()
                  .height(36)
                  .width(_phase == 'idle' ? 0 : 168)
                  .color(_phase == 'bad' ? $danger() : $success())
                  .animate(
                    _phase == 'run'
                        ? .linear(900.ms, onEnd: _finish)
                        : .linear(1.ms),
                  ),
            ),
          ),
          Box(
            style: BoxStyler().paddingX(14).paddingY(8),
            child: StyledText(switch (_phase) {
              'run' => 'search_docs  …',
              'ok' => 'search_docs  done',
              'bad' => 'search_docs  retry',
              _ => 'search_docs',
            }, style: microLabel(12)),
          ),
        ],
      ),
    );
  }
}
