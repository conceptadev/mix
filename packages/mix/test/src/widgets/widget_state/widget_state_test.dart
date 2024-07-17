// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/internal/widget_state/gesturable_builder.dart';
import 'package:mix/src/internal/widget_state/interactive_widget.dart';
import 'package:mix/src/internal/widget_state/widget_state.dart';

class TrackingText<T> extends StatefulWidget {
  final String text;
  final T Function(BuildContext) stateBuilder;

  const TrackingText(
      {super.key, required this.text, required this.stateBuilder});

  @override
  // ignore: library_private_types_in_public_api
  _TrackingTextState createState() => _TrackingTextState();
}

class _TrackingTextState extends State<TrackingText> {
  int _rebuildCount = 0;

  @override
  Widget build(BuildContext context) {
    _rebuildCount++;

    return Text(
      '${widget.text}: Rebuilds($_rebuildCount), State(${widget.stateBuilder(context)})',
    );
  }
}

void main() {
  testWidgets('PressableState updates widgets correctly', (
    WidgetTester tester,
  ) async {
    bool hovered = false;
    bool pressed = false;
    bool longPressed = false;
    bool focused = false;

    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: [
                GesturableState(
                  pressed: pressed,
                  longPressed: longPressed,
                  child: InteractiveState(
                    enabled: true,
                    hovered: hovered,
                    focused: focused,
                    pointerPosition: null,
                    child: Builder(
                      builder: (BuildContext context) {
                        final bool enabled =
                            WidgetStateModel.enabledOf(context);
                        final bool hovered = WidgetStateModel.hoverOf(context);
                        final bool pressed = WidgetStateModel.pressOf(context);
                        final bool longPressed =
                            WidgetStateModel.longPressOf(context);
                        final state = WidgetStateModel.stateOf(context);
                        return Column(
                          children: [
                            Text('Enabled: $enabled'),
                            Text('Hovered: $hovered'),
                            Text('LongPressed: $longPressed'),
                            Text('Pressed: $pressed'),
                            Text('Current State: $state'),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      hovered = !hovered;
                      pressed = !pressed;
                      longPressed = !longPressed;
                      focused = !focused;
                    });
                  },
                  child: const Text('Update State'),
                ),
              ],
            );
          },
        ),
      ),
    );

    expect(find.text('Enabled: true'), findsOneWidget);
    expect(find.text('Hovered: false'), findsOneWidget);
    expect(find.text('Pressed: false'), findsOneWidget);
    expect(find.text('LongPressed: false'), findsOneWidget);
    expect(find.text('Focused: false'), findsNothing);
    expect(find.text('Current State: ${WidgetMixState.idle}'), findsOneWidget);

    await tester.tap(find.text('Update State'));
    await tester.pump();

    expect(find.text('Enabled: true'), findsOneWidget);
    expect(find.text('Hovered: true'), findsOneWidget);
    expect(find.text('Pressed: true'), findsOneWidget);
    expect(find.text('LongPressed: true'), findsOneWidget);
    expect(find.text('Focused: true'), findsNothing);
    expect(find.text('Current State: ${WidgetMixState.longPressed}'),
        findsOneWidget);
  });

  testWidgets('PressableState updates inherit model',
      (WidgetTester tester) async {
    final PressableStateTestWidgetController controller =
        PressableStateTestWidgetController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: PressableStateTestWidget(controller: controller)),
      ),
    );

    expect(find.text('Enabled: Rebuilds(1), State(true)'), findsOneWidget);
    expect(find.text('Hovered: Rebuilds(1), State(false)'), findsOneWidget);
    expect(find.text('Pressed: Rebuilds(1), State(false)'), findsOneWidget);
    expect(find.text('LongPressed: Rebuilds(1), State(false)'), findsOneWidget);
    expect(
      find.text('Current State: Rebuilds(1), State(${WidgetMixState.idle})'),
      findsOneWidget,
    );

    controller.updateHovered(true);
    await tester.pump();

    expect(find.text('Enabled: Rebuilds(1), State(true)'), findsOneWidget);
    expect(find.text('Hovered: Rebuilds(2), State(true)'), findsOneWidget);
    expect(find.text('Pressed: Rebuilds(1), State(false)'), findsOneWidget);
    expect(find.text('LongPressed: Rebuilds(1), State(false)'), findsOneWidget);
    expect(
      find.text('Current State: Rebuilds(2), State(${WidgetMixState.hovered})'),
      findsOneWidget,
    );

    controller.updatePressed(true);
    await tester.pump();

    expect(find.text('Enabled: Rebuilds(1), State(true)'), findsOneWidget);
    expect(find.text('Hovered: Rebuilds(2), State(true)'), findsOneWidget);
    expect(find.text('Pressed: Rebuilds(2), State(true)'), findsOneWidget);
    expect(find.text('LongPressed: Rebuilds(1), State(false)'), findsOneWidget);
    expect(
      find.text('Current State: Rebuilds(3), State(${WidgetMixState.pressed})'),
      findsOneWidget,
    );

    controller.updateLongPressed(true);
    await tester.pump();

    expect(find.text('Enabled: Rebuilds(1), State(true)'), findsOneWidget);
    expect(find.text('Hovered: Rebuilds(2), State(true)'), findsOneWidget);
    expect(find.text('Pressed: Rebuilds(2), State(true)'), findsOneWidget);
    expect(find.text('LongPressed: Rebuilds(2), State(true)'), findsOneWidget);
    expect(
      find.text(
          'Current State: Rebuilds(4), State(${WidgetMixState.longPressed})'),
      findsOneWidget,
    );
  });
}

class PressableStateTestWidgetController {
  late void Function(bool) updateHovered;
  late void Function(bool) updatePressed;
  late void Function(bool) updateLongPressed;
  late void Function(bool) updateFocused;
}

class PressableStateTestWidget extends StatefulWidget {
  final PressableStateTestWidgetController controller;

  const PressableStateTestWidget({super.key, required this.controller});

  @override
  // ignore: library_private_types_in_public_api
  _PressableStateTestWidgetState createState() =>
      _PressableStateTestWidgetState();
}

class _PressableStateTestWidgetState extends State<PressableStateTestWidget> {
  bool hovered = false;
  bool pressed = false;
  bool longPressed = false;
  bool focused = false;

  @override
  void initState() {
    super.initState();
    widget.controller.updateHovered = (value) {
      setState(() {
        hovered = value;
      });
    };
    widget.controller.updatePressed = (value) {
      setState(() {
        pressed = value;
      });
    };
    widget.controller.updateLongPressed = (value) {
      setState(() {
        longPressed = value;
      });
    };
    widget.controller.updateFocused = (value) {
      setState(() {
        focused = value;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GesturableState(
          pressed: pressed,
          longPressed: longPressed,
          child: InteractiveState(
            enabled: true,
            hovered: hovered,
            focused: focused,
            pointerPosition: null,
            child: Builder(
              builder: (BuildContext context) {
                return Column(
                  children: [
                    const TrackingText(
                      text: 'Enabled',
                      stateBuilder: WidgetStateModel.enabledOf,
                    ),
                    const TrackingText(
                      text: 'Hovered',
                      stateBuilder: WidgetStateModel.hoverOf,
                    ),
                    const TrackingText(
                      text: 'Pressed',
                      stateBuilder: WidgetStateModel.pressOf,
                    ),
                    const TrackingText(
                      text: 'LongPressed',
                      stateBuilder: WidgetStateModel.longPressOf,
                    ),
                    TrackingText(
                      text: 'Current State',
                      stateBuilder: (BuildContext context) {
                        return WidgetStateModel.stateOf(context).toString();
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
