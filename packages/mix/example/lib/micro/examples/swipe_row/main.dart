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
            child: Padding(padding: EdgeInsets.all(24), child: SwipeRow()),
          ),
        ),
      ),
    );
  }
}

const $card = ColorToken('micro.card');
const $ink = ColorToken('micro.ink');
const $muted = ColorToken('micro.muted');
const $danger = ColorToken('micro.danger');
const $radiusXl = RadiusToken('micro.radius.xl');

Map<ColorToken, Color> microColors() => {
  $card: const Color(0xFF121218),
  $ink: const Color(0xFFF5F5F7),
  $muted: const Color(0xFF8B8B93),
  $danger: const Color(0xFFFF5C7A),
};

Map<RadiusToken, Radius> microRadii() => {$radiusXl: const Radius.circular(16)};

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

AnimationConfig microFollow({required bool live}) {
  return live ? .linear(1.ms) : .spring(320.ms, bounce: 0.18);
}

TextStyler microLabel([double size = 14]) =>
    TextStyler().color($ink()).fontSize(size).fontWeight(FontWeight.w600);
TextStyler microMuted([double size = 12]) =>
    TextStyler().color($muted()).fontSize(size).fontWeight(FontWeight.w500);

class SwipeRow extends StatefulWidget {
  const SwipeRow({super.key});

  @override
  State<SwipeRow> createState() => _SwipeRowState();
}

class _SwipeRowState extends State<SwipeRow> {
  double _x = 0;
  bool _gone = false;
  bool _dragging = false;
  bool _canceled = false;

  @override
  Widget build(BuildContext context) {
    return StackBox(
      key: const Key('swipe-row'),
      style: StackBoxStyler()
          .size(260, 56)
          .color(Colors.transparent)
          .stackAlignment(.center)
          .clipBehavior(.hardEdge),
      children: [
        IgnorePointer(
          ignoring: !_gone,
          child: ExcludeSemantics(
            excluding: !_gone,
            child: PressableBox(
              onPress: () => setState(() {
                _gone = false;
                _x = 0;
              }),
              style: BoxStyler()
                  .paddingAll(12)
                  .wrap(WidgetModifierConfig.opacity(_gone ? 1 : 0))
                  .animate(.easeOut(200.ms)),
              child: StyledText('Restore row', style: microMuted()),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: _gone,
          child: ExcludeSemantics(
            excluding: _gone,
            child: Box(
              style: BoxStyler()
                  .translate(_gone ? -260 : 0, 0)
                  .wrap(WidgetModifierConfig.opacity(_gone ? 0 : 1))
                  .animate(.easeOut(240.ms)),
              child: SizedBox(
                width: 260,
                height: 56,
                child: StackBox(
                  style: StackBoxStyler()
                      .borderRadiusAll($radiusXl())
                      .clipBehavior(.antiAlias)
                      .color($card()),
                  children: [
                    PressableBox(
                      onPress: () => setState(() => _gone = true),
                      style: BoxStyler()
                          .color(_x < 0 ? $danger() : $card())
                          .paddingX(18)
                          .alignment(.centerRight)
                          .height(56),
                      child: StyledText(
                        'Delete',
                        style: TextStyler()
                            .fontWeight(FontWeight.w700)
                            .color($ink()),
                      ),
                    ),
                    Listener(
                      onPointerCancel: (_) => setState(() {
                        _canceled = true;
                        _dragging = false;
                        _x = 0;
                      }),
                      child: GestureDetector(
                        onHorizontalDragStart: (_) => setState(() {
                          _dragging = true;
                          _canceled = false;
                        }),
                        onHorizontalDragUpdate: (details) {
                          setState(
                            () =>
                                _x = (_x + details.delta.dx).clamp(-180.0, 0.0),
                          );
                        },
                        onHorizontalDragEnd: (_) {
                          if (_canceled) return;
                          setState(() {
                            _dragging = false;
                            if (_x < -120) {
                              _gone = true;
                            } else {
                              _x = _x < -56 ? -88 : 0;
                            }
                          });
                        },
                        onHorizontalDragCancel: () => setState(() {
                          _dragging = false;
                          _x = 0;
                        }),
                        child: Box(
                          style: BoxStyler()
                              .color($card())
                              .height(56)
                              .paddingX(16)
                              .alignment(.centerLeft)
                              .translate(_x, 0)
                              .animate(microFollow(live: _dragging)),
                          child: StyledText(
                            'Inbox from Leo',
                            style: microLabel(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
