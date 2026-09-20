import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

// Paste this entire file into https://dartpad.dev/ to run the example.
void main() => runApp(
  WidgetsApp(
    color: const Color(0xFFFFFFFF),
    debugShowCheckedModeBanner: false,
    builder: (_, _) => const ColoredBox(
      color: Color(0xFFFFFFFF),
      child: Center(child: SquishSwitch()),
    ),
  ),
);

StackBoxStyler squishTrackStyle({
  required bool isOn,
  required bool reduceMotion,
}) {
  final track = StackBoxStyler()
      .size(76, 38)
      .color(isOn ? const Color(0xFF7C3AED) : const Color(0xFFD1D5DB))
      .borderRounded(19)
      .stackAlignment(.topLeft);
  if (reduceMotion) return track;
  return track.onPressed(.scale(0.92)).animate(.spring(300.ms, bounce: 0.12));
}

BoxStyler squishTravelStyle({required bool isOn, required bool reduceMotion}) {
  final travel = BoxStyler().translate(isOn ? 42 : 4, 4);
  return reduceMotion ? travel : travel.animate(.spring(360.ms, bounce: 0.24));
}

BoxStyler squishThumbStyle({
  required Listenable trigger,
  required bool reduceMotion,
}) {
  final thumb = BoxStyler()
      .size(30, 30)
      .color(const Color(0xFFFFFFFF))
      .border(.color(const Color(0xFFE5E7EB)).width(1))
      .borderRounded(15);
  if (reduceMotion) return thumb;
  return thumb.keyframeAnimation(
    trigger: trigger,
    timeline: [
      KeyframeTrack<double>('squish', [
        .easeOut(1.16, 90.ms),
        .easeInOut(0.95, 150.ms),
        .easeOut(1, 120.ms),
      ], initial: 1),
    ],
    styleBuilder: (values, style) {
      final scale = values.get<double>('squish');
      return style.wrap(WidgetModifierConfig.scale(x: scale, y: 1 / scale));
    },
  );
}

class SquishSwitch extends StatefulWidget {
  const SquishSwitch({super.key});

  @override
  State<SquishSwitch> createState() => _SquishSwitchState();
}

class _SquishSwitchState extends State<SquishSwitch> {
  bool _on = false;
  final _squish = ValueNotifier(0);

  @override
  void dispose() {
    _squish.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _on = !_on);
    // Trigger after the new styles have been built.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !MediaQuery.disableAnimationsOf(context)) _squish.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final track = squishTrackStyle(isOn: _on, reduceMotion: reduceMotion);
    final travel = squishTravelStyle(isOn: _on, reduceMotion: reduceMotion);
    final thumb = squishThumbStyle(
      trigger: _squish,
      reduceMotion: reduceMotion,
    );

    return Semantics(
      label: 'Squish switch',
      toggled: _on,
      child: Pressable(
        key: const Key('squish-switch'),
        semanticsRole: PressableSemanticsRole.none,
        onPress: _toggle,
        child: track(
          key: ValueKey(reduceMotion),
          children: [travel(child: thumb())],
        ),
      ),
    );
  }
}
