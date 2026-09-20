import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

// Paste this entire file into https://dartpad.dev/ to run the example.
void main() => runApp(
  WidgetsApp(
    color: _pageColor,
    debugShowCheckedModeBanner: false,
    builder: (_, _) => const ColoredBox(
      color: _pageColor,
      child: Center(child: SquishSwitch()),
    ),
  ),
);

const _pageColor = Color(0xFF07070B);
const _inkColor = Color(0xFFF5F5F7);
const _trackColor = Color(0xFF27272F);
const _trackOnColor = Color(0xFFF5F5F5);

const _switchWidth = 76.0;
const _switchHeight = 38.0;
const _switchInset = 4.0;
const _thumbSize = 30.0;

StackBoxStyler squishTrackStyle({required bool isOn}) => StackBoxStyler()
    .size(_switchWidth, _switchHeight)
    .color(isOn ? _trackOnColor : _trackColor)
    .borderRounded(_switchHeight / 2)
    .clipBehavior(.antiAlias)
    .stackAlignment(.topLeft)
    .animate(.spring(380.ms, bounce: 0.12));

BoxStyler squishThumbStyle({
  required bool isOn,
  required double x,
  required double stretch,
  required bool isDragging,
}) => BoxStyler()
    .size(_thumbSize, _thumbSize)
    .color(isOn ? _pageColor : _inkColor)
    .borderRounded(_thumbSize / 2)
    // Separate modifiers let translation and stretch interpolate independently.
    .wrap(
      WidgetModifierConfig.translate(x: x, y: _switchInset)
          .scale(stretch, 1 / stretch)
          .orderOfModifiers(const [TranslateModifier, ScaleModifier]),
    )
    .animate(isDragging ? .linear(1.ms) : .spring(320.ms, bounce: 0.18));

class SquishSwitch extends StatefulWidget {
  const SquishSwitch({super.key});

  @override
  State<SquishSwitch> createState() => _SquishSwitchState();
}

class _SquishSwitchState extends State<SquishSwitch> {
  static double get _min => _switchInset;
  static double get _max => _switchWidth - _switchInset - _thumbSize;

  bool _on = false;
  bool _dragging = false;
  double _x = _min;
  double _stretch = 1;

  void _commit(bool next) {
    if (_on == next) return;
    setState(() => _on = next);
  }

  @override
  Widget build(BuildContext context) {
    final target = _on ? _max : _min;
    final x = _dragging ? _x : target;
    final track = squishTrackStyle(isOn: _on);
    final thumb = squishThumbStyle(
      isOn: _on,
      x: x,
      stretch: _stretch,
      isDragging: _dragging,
    );

    return GestureDetector(
      onHorizontalDragStart: (details) {
        setState(() {
          _dragging = true;
          _x = target;
        });
      },
      onHorizontalDragUpdate: (details) {
        final next = (_x + details.delta.dx).clamp(_min, _max);
        setState(() {
          _stretch = (1 + details.delta.dx.abs() / 28).clamp(1.0, 1.35);
          _x = next;
          _on = next > (_min + _max) / 2;
        });
      },
      onHorizontalDragEnd: (_) {
        setState(() {
          _dragging = false;
          _stretch = 1;
          _x = _on ? _max : _min;
        });
      },
      onHorizontalDragCancel: () => setState(() {
        _dragging = false;
        _stretch = 1;
      }),
      child: Semantics(
        label: 'Squish switch',
        toggled: _on,
        child: Pressable(
          key: const Key('squish-switch'),
          onPress: _dragging ? null : () => _commit(!_on),
          child: track(children: [thumb()]),
        ),
      ),
    );
  }
}
