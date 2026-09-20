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
            child: Padding(padding: EdgeInsets.all(24), child: SlideCommit()),
          ),
        ),
      ),
    );
  }
}

const $page = ColorToken('micro.page');
const $ink = ColorToken('micro.ink');
const $muted = ColorToken('micro.muted');
const $track = ColorToken('micro.track');
const $success = ColorToken('micro.success');

Map<ColorToken, Color> microColors() => {
  $page: const Color(0xFF07070B),
  $ink: const Color(0xFFF5F5F7),
  $muted: const Color(0xFF8B8B93),
  $track: const Color(0xFF27272F),
  $success: const Color(0xFF3DD68C),
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

FlexBoxStyler microRow({double spacing = 10}) => FlexBoxStyler()
    .spacing(spacing)
    .crossAxisAlignment(.center)
    .mainAxisSize(.min);
TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);
TextStyler microMuted([double size = 12]) =>
    TextStyler().color($muted()).fontSize(size).fontWeight(FontWeight.w500);

class SlideCommit extends StatefulWidget {
  const SlideCommit({super.key});

  @override
  State<SlideCommit> createState() => _SlideCommitState();
}

class _SlideCommitState extends State<SlideCommit> {
  static const _width = 280.0;
  static const _height = 56.0;
  static const _grip = _height - 8;
  static const _travel = _width - _height;

  double _x = 0;
  bool _dragging = false;
  bool _canceled = false;
  String _phase = 'idle';
  Timer? _completion;

  @override
  void dispose() {
    _completion?.cancel();
    super.dispose();
  }

  void _release({bool canceled = false}) {
    if (_phase != 'idle') return;
    final commit = !canceled && !_canceled && _x >= _travel;
    setState(() {
      _dragging = false;
      _x = commit ? _travel : 0;
      if (commit) _phase = 'busy';
    });
    if (!commit) return;
    _completion = Timer(700.ms, () {
      setState(() {
        _phase = 'done';
        _x = 0;
      });
      _completion = Timer(1500.ms, () => setState(() => _phase = 'idle'));
    });
  }

  @override
  Widget build(BuildContext context) {
    final done = _phase == 'done';
    final busy = _phase == 'busy';
    final labelOpacity = (1 - _x / (_travel * 0.55)).clamp(0.0, 1.0);
    return Semantics(
      label: 'Slide to pay',
      value: busy
          ? 'Working'
          : done
          ? 'Paid'
          : '${(_x / _travel * 100).round()}%',
      child: Listener(
        onPointerCancel: (_) {
          _canceled = true;
          _release(canceled: true);
        },
        child: GestureDetector(
          key: const Key('slide-commit'),
          onHorizontalDragStart: _phase == 'idle'
              ? (_) => setState(() {
                  _dragging = true;
                  _canceled = false;
                })
              : null,
          onHorizontalDragUpdate: _phase == 'idle'
              ? (details) => setState(
                  () => _x = (_x + details.delta.dx).clamp(0.0, _travel),
                )
              : null,
          onHorizontalDragEnd: _phase == 'idle' ? (_) => _release() : null,
          onHorizontalDragCancel: () => _release(canceled: true),
          child: StackBox(
            style: StackBoxStyler()
                .size(_width, _height)
                .color($track())
                .shapeStadium()
                .clipBehavior(.antiAlias)
                .stackAlignment(.centerLeft),
            children: [
              Box(
                key: const Key('slide-label'),
                style: BoxStyler()
                    .size(_width, _height)
                    .alignment(.center)
                    .wrap(
                      WidgetModifierConfig.opacity(
                        _phase == 'idle' ? labelOpacity : 0,
                      ),
                    )
                    .animate(_dragging ? .linear(1.ms) : .easeOut(200.ms)),
                child: StyledText('Slide to pay', style: microMuted(14)),
              ),
              Box(
                key: const Key('slide-capsule'),
                style: BoxStyler()
                    .width(done ? _width - 8 : _grip)
                    .height(_grip)
                    .shapeStadium()
                    .color(done ? $success() : $ink())
                    .clipBehavior(.antiAlias)
                    .alignment(.center)
                    .translate(4 + _x, 0)
                    // A non-overshooting spring keeps capsule edges in the track.
                    .animate(
                      _dragging ? .linear(1.ms) : .spring(380.ms, bounce: 0),
                    ),
                // The success face is revealed as the capsule expands; it must
                // not reflow or overflow while the capsule is still grip-sized.
                child: OverflowBox(
                  minWidth: 0,
                  maxWidth: _width - 8,
                  child: done
                      ? RowBox(
                          style: microRow(spacing: 8),
                          children: [
                            StyledIcon(
                              icon: Icons.check_rounded,
                              style: IconStyler().size(18).color($page()),
                            ),
                            StyledText(
                              'Paid',
                              style: microLabel(14).color($page()),
                            ),
                          ],
                        )
                      : busy
                      ? SizedBox(
                          key: const Key('slide-pending'),
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: $page.resolve(context),
                            semanticsLabel: 'Working',
                          ),
                        )
                      : StyledIcon(
                          icon: Icons.arrow_forward_rounded,
                          style: IconStyler().size(20).color($page()),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
