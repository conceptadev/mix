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
            child: Padding(padding: EdgeInsets.all(24), child: SwipeToast()),
          ),
        ),
      ),
    );
  }
}

const $card = ColorToken('micro.card');
const $ink = ColorToken('micro.ink');
const $track = ColorToken('micro.track');
const $accent = ColorToken('micro.accent');
const $radiusMd = RadiusToken('micro.radius.md');
const $radiusLg = RadiusToken('micro.radius.lg');

Map<ColorToken, Color> microColors() => {
  $card: const Color(0xFF121218),
  $ink: const Color(0xFFF5F5F7),
  $track: const Color(0xFF27272F),
  $accent: const Color(0xFF7C6AF7),
};

Map<RadiusToken, Radius> microRadii() => {
  $radiusMd: const Radius.circular(12),
  $radiusLg: const Radius.circular(14),
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

TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);

class SwipeToast extends StatefulWidget {
  const SwipeToast({super.key});

  @override
  State<SwipeToast> createState() => _SwipeToastState();
}

class _SwipeToastState extends State<SwipeToast> {
  bool _visible = false;
  bool _burning = false;
  bool _dragging = false;
  bool _canceled = false;
  double _drag = 0;

  void _show() {
    setState(() {
      _visible = true;
      _burning = false;
      _drag = 0;
      _dragging = false;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_visible) return;
      setState(() => _burning = true);
    });
  }

  void _dismiss() {
    if (!mounted || !_visible) return;
    setState(() {
      _visible = false;
      _burning = false;
      _drag = 0;
      _dragging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColumnBox(
      key: const Key('swipe-toast'),
      style: FlexBoxStyler()
          .spacing(12)
          .crossAxisAlignment(.center)
          .mainAxisSize(.min),
      children: [
        PressableBox(
          onPress: _show,
          style: BoxStyler()
              .paddingX(14)
              .paddingY(8)
              .borderRadiusAll($radiusMd())
              .color($track()),
          child: StyledText('Notify', style: microLabel(13)),
        ),
        IgnorePointer(
          ignoring: !_visible,
          child: ExcludeSemantics(
            excluding: !_visible,
            child: ClipRect(
              key: const Key('toast-reveal'),
              child: Box(
                style: BoxStyler()
                    .wrap(
                      WidgetModifierConfig.align(
                        alignment: Alignment.topCenter,
                        widthFactor: 1,
                        heightFactor: _visible ? 1 : 0,
                      ),
                    )
                    .animate(.easeOut(_visible ? 400.ms : 280.ms)),
                child: Listener(
                  onPointerCancel: (_) => setState(() {
                    _canceled = true;
                    _dragging = false;
                    _drag = 0;
                  }),
                  child: GestureDetector(
                    onVerticalDragStart: (_) => setState(() {
                      _dragging = true;
                      _canceled = false;
                    }),
                    onVerticalDragUpdate: (details) {
                      setState(
                        () => _drag = (_drag + details.delta.dy).clamp(
                          0.0,
                          120.0,
                        ),
                      );
                    },
                    onVerticalDragEnd: (_) {
                      if (_canceled) return;
                      setState(() => _dragging = false);
                      if (_drag > 28) {
                        _dismiss();
                      } else {
                        setState(() => _drag = 0);
                      }
                    },
                    onVerticalDragCancel: () => setState(() {
                      _dragging = false;
                      _drag = 0;
                    }),
                    child: Box(
                      style: BoxStyler()
                          .width(220)
                          .paddingAll(12)
                          .borderRadiusAll($radiusLg())
                          .color($card())
                          .border(.color(const Color(0x22FFFFFF)).width(1))
                          .translate(0, _visible ? _drag : 60)
                          .wrap(WidgetModifierConfig.opacity(_visible ? 1 : 0))
                          .animate(
                            _dragging
                                ? .linear(1.ms)
                                : .easeOut(_visible ? 400.ms : 280.ms),
                          ),
                      child: ColumnBox(
                        style: FlexBoxStyler()
                            .spacing(8)
                            .crossAxisAlignment(.start),
                        children: [
                          StyledText(
                            'Mix saved the draft',
                            style: microLabel(13),
                          ),
                          Box(
                            key: const Key('toast-fuse'),
                            style: BoxStyler()
                                .height(3)
                                .shapeStadium()
                                .color($accent())
                                .constraintsOnly(
                                  minWidth: 0,
                                  maxWidth: _burning ? 0 : 196,
                                )
                                .animate(
                                  _burning
                                      ? .linear(2600.ms, onEnd: _dismiss)
                                      : .linear(1.ms),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
