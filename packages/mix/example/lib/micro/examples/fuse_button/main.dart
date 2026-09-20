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
            child: Padding(padding: EdgeInsets.all(24), child: FuseButton()),
          ),
        ),
      ),
    );
  }
}

const $ink = ColorToken('micro.ink');
const $track = ColorToken('micro.track');
const $hover = ColorToken('micro.hover');
const $warning = ColorToken('micro.warning');

Map<ColorToken, Color> microColors() => {
  $ink: const Color(0xFFF5F5F7),
  $track: const Color(0xFF27272F),
  $hover: const Color(0xFF32323C),
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

FlexBoxStyler microRow({double spacing = 10}) => FlexBoxStyler()
    .spacing(spacing)
    .crossAxisAlignment(.center)
    .mainAxisSize(.min);
TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);

class FuseButton extends StatefulWidget {
  const FuseButton({super.key});

  @override
  State<FuseButton> createState() => _FuseButtonState();
}

class _FuseButtonState extends State<FuseButton>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  bool _armed = false;
  bool _canPauseOnHover = false;
  bool _hoverPaused = false;
  bool _hidden = false;
  late final AnimationController _fuse;

  @override
  void initState() {
    super.initState();
    _fuse = AnimationController(vsync: this, duration: 4000.ms)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) setState(() => _armed = false);
      });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _fuse.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _hidden = state != AppLifecycleState.resumed;
    _syncCountdown();
  }

  void _syncCountdown() {
    if (!_armed) return;
    if (_hoverPaused || _hidden) {
      _fuse.stop();
    } else {
      _fuse.forward();
    }
  }

  void _press() {
    if (_armed) {
      _fuse.stop();
      setState(() => _armed = false);
    } else {
      setState(() {
        _armed = true;
        _canPauseOnHover = false;
        _hoverPaused = false;
      });
      _fuse.forward(from: 0);
      _syncCountdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _hoverPaused = _canPauseOnHover;
        _syncCountdown();
      },
      onExit: (_) {
        _canPauseOnHover = true;
        _hoverPaused = false;
        _syncCountdown();
      },
      child: PressableBox(
        key: const Key('fuse-button'),
        onPress: _press,
        style: BoxStyler()
            .size(148, 44)
            .shapeStadium()
            .color($track())
            .clipBehavior(.antiAlias)
            .onHovered(.color($hover()))
            .onPressed(.scale(0.97))
            .animate(.easeOut(160.ms)),
        child: CustomPaint(
          key: const Key('fuse-outline'),
          // Path drawing and pausable elapsed time are the custom part;
          // the two faces and all ordinary chrome remain Mix styles.
          foregroundPainter: _armed
              ? _FuseOutline(_fuse, $warning.resolve(context))
              : null,
          child: StackBox(
            style: StackBoxStyler().stackAlignment(.center),
            children: [
              for (final undo in [false, true])
                IgnorePointer(
                  ignoring: _armed != undo,
                  child: ExcludeSemantics(
                    excluding: _armed != undo,
                    child: Box(
                      style: BoxStyler()
                          .size(148, 44)
                          .alignment(.center)
                          .wrap(
                            WidgetModifierConfig.opacity(
                              _armed == undo ? 1 : 0,
                            ),
                          )
                          .animate(.easeOut(200.ms)),
                      child: RowBox(
                        style: microRow(spacing: 8),
                        children: [
                          StyledIcon(
                            icon: undo
                                ? Icons.undo_rounded
                                : Icons.archive_outlined,
                            style: IconStyler().size(15).color($ink()),
                          ),
                          StyledText(
                            undo ? 'Undo' : 'Archive',
                            style: microLabel(14),
                          ),
                        ],
                      ),
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

class _FuseOutline extends CustomPainter {
  _FuseOutline(this.progress, this.color) : super(repaint: progress);

  final Animation<double> progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 1.5;
    final rect = (Offset.zero & size).deflate(stroke / 2);
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 2)),
      );
    final metric = path.computeMetrics().first;
    canvas.drawPath(
      metric.extractPath(metric.length * progress.value, metric.length),
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_FuseOutline oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
