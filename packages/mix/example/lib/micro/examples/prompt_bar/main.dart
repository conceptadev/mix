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
            child: Padding(padding: EdgeInsets.all(24), child: PromptBar()),
          ),
        ),
      ),
    );
  }
}

const $page = ColorToken('micro.page');
const $playground = ColorToken('micro.playground');
const $ink = ColorToken('micro.ink');
const $muted = ColorToken('micro.muted');
const $track = ColorToken('micro.track');
const $radiusXs = RadiusToken('micro.radius.xs');
const $radiusXl = RadiusToken('micro.radius.xl');

Map<ColorToken, Color> microColors() => {
  $page: const Color(0xFF07070B),
  $playground: const Color(0xFF0C0C12),
  $ink: const Color(0xFFF5F5F7),
  $muted: const Color(0xFF8B8B93),
  $track: const Color(0xFF27272F),
};

Map<RadiusToken, Radius> microRadii() => {
  $radiusXs: const Radius.circular(8),
  $radiusXl: const Radius.circular(16),
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

class PromptBar extends StatefulWidget {
  const PromptBar({super.key});

  @override
  State<PromptBar> createState() => _PromptBarState();
}

class _PromptBarState extends State<PromptBar> {
  final _controller = TextEditingController();
  bool _busy = false;
  Timer? _completion;

  @override
  void dispose() {
    _completion?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    if (_busy || _controller.text.trim().isEmpty) return;
    setState(() => _busy = true);
    _completion = Timer(900.ms, () {
      _controller.clear();
      setState(() => _busy = false);
    });
  }

  void _stop() {
    _completion?.cancel();
    setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final canSend = _controller.text.trim().isNotEmpty;
    return Box(
      key: const Key('prompt-bar'),
      style: BoxStyler()
          .color($track())
          .borderRadiusAll($radiusXl())
          .paddingAll(8)
          .width(280),
      child: RowBox(
        style: FlexBoxStyler().spacing(8).crossAxisAlignment(.center),
        children: [
          Expanded(
            child: SizedBox(
              height: 34,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: _controller,
                onChanged: (_) => setState(() {}),
                style: TextStyle(color: $ink.resolve(context), fontSize: 13),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 4),
                  hintText: 'Ask Mix…',
                  hintStyle: TextStyle(color: Color(0xFF8B8B93)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Semantics(
            button: true,
            label: _busy ? 'Stop' : 'Send',
            child: PressableBox(
              onPress: _busy ? _stop : (canSend ? _send : null),
              style: BoxStyler()
                  .size(34, 34)
                  .borderRadiusAll($radiusXs())
                  .alignment(.center)
                  .color(canSend || _busy ? $ink() : $playground())
                  .animate(.spring(240.ms, bounce: 0.12)),
              child: StyledIcon(
                icon: _busy ? Icons.stop_rounded : Icons.arrow_upward_rounded,
                style: IconStyler()
                    .size(16)
                    .color(canSend || _busy ? $page() : $muted()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
