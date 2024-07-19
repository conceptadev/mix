// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/src/core/internal/mix_state/widget_state_controller.dart';

class TrackRebuildWidget<T> extends StatefulWidget {
  final String text;
  final T Function(BuildContext) stateBuilder;

  const TrackRebuildWidget({
    super.key,
    required this.text,
    required this.stateBuilder,
  });

  @override
  // ignore: library_private_types_in_public_api
  TrackRebuildWidgetState createState() => TrackRebuildWidgetState();

  static TrackRebuildWidgetState findState(WidgetTester tester, String text) {
    return tester.state(find.byWidgetPredicate(
      (widget) => widget is TrackRebuildWidget && widget.text == text,
    ));
  }
}

class TrackRebuildWidgetState extends State<TrackRebuildWidget> {
  int buildCount = 0;
  bool state = false;

  @override
  Widget build(BuildContext context) {
    buildCount++;
    state = widget.stateBuilder(context);

    return Text(widget.text);
  }
}

void main() {
  group('MixWidgetStateController', () {
    test('initial state values', () {
      final controller = MixWidgetStateController();
      expect(controller.disabled, isFalse);
      expect(controller.hovered, isFalse);
      expect(controller.focused, isFalse);
      expect(controller.pressed, isFalse);
      expect(controller.dragged, isFalse);
      expect(controller.selected, isFalse);
      expect(controller.longPressed, isFalse);
    });

    test('update individual state', () {
      final controller = MixWidgetStateController();

      controller.disabled = true;
      expect(controller.disabled, isTrue);

      controller.hovered = true;
      expect(controller.hovered, isTrue);

      controller.focused = true;
      expect(controller.focused, isTrue);

      controller.pressed = true;
      expect(controller.pressed, isTrue);

      controller.dragged = true;
      expect(controller.dragged, isTrue);

      controller.selected = true;
      expect(controller.selected, isTrue);

      controller.longPressed = true;
      expect(controller.longPressed, isTrue);
    });

    test('batch update states', () {
      final controller = MixWidgetStateController();

      controller.batch([
        (MixWidgetState.disabled, true),
        (MixWidgetState.hovered, true),
        (MixWidgetState.focused, true),
      ]);

      expect(controller.disabled, isTrue);
      expect(controller.hovered, isTrue);
      expect(controller.focused, isTrue);
      expect(controller.pressed, isFalse);
      expect(controller.dragged, isFalse);
      expect(controller.selected, isFalse);
      expect(controller.longPressed, isFalse);
    });

    test('notifyListeners called on state change', () {
      final controller = MixWidgetStateController();

      var notifyListenersCallCount = 0;
      controller.addListener(() => notifyListenersCallCount++);

      controller.disabled = true;
      expect(notifyListenersCallCount, 1);

      controller.batch([
        (MixWidgetState.hovered, true),
        (MixWidgetState.focused, true),
      ]);
      expect(notifyListenersCallCount, 2);

      // No change, should not notify
      controller.pressed = false;
      expect(notifyListenersCallCount, 2);
    });
  });
  group('MixWidgetStateModel', () {
    testWidgets('of finds model', (tester) async {
      final controller = MixWidgetStateController();

      controller.disabled = true;
      controller.hovered = true;
      controller.focused = true;
      controller.pressed = true;
      controller.dragged = true;
      controller.selected = true;
      controller.longPressed = true;

      await tester.pumpWidget(
        MaterialApp(
          home: MixWidgetStateModel(
            disabled: controller.disabled,
            hovered: controller.hovered,
            focused: controller.focused,
            pressed: controller.pressed,
            dragged: controller.dragged,
            selected: controller.selected,
            longPressed: controller.longPressed,
            child: Container(),
          ),
        ),
      );
      final foundModel =
          MixWidgetStateModel.of(tester.element(find.byType(Container)));
      expect(foundModel, isNotNull);
      expect(foundModel!.disabled, isTrue);
      expect(foundModel.hovered, isTrue);
      expect(foundModel.focused, isTrue);
      expect(foundModel.pressed, isTrue);
      expect(foundModel.dragged, isTrue);
      expect(foundModel.selected, isTrue);
      expect(foundModel.longPressed, isTrue);
    });

    testWidgets('hasStateOf returns if state is set', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MixWidgetStateModel(
            disabled: true,
            hovered: false,
            focused: false,
            pressed: false,
            dragged: false,
            selected: false,
            longPressed: false,
            child: Builder(
              builder: (context) {
                expect(
                    MixWidgetStateModel.hasStateOf(
                      context,
                      MixWidgetState.disabled,
                    ),
                    isTrue);
                expect(
                    MixWidgetStateModel.hasStateOf(
                      context,
                      MixWidgetState.hovered,
                    ),
                    isFalse);
                return Container();
              },
            ),
          ),
        ),
      );
    });

    test('updateShouldNotify returns true if value changed', () {
      final oldModel = MixWidgetStateModel(
        disabled: false,
        hovered: false,
        focused: false,
        pressed: false,
        dragged: false,
        selected: false,
        longPressed: false,
        child: Container(),
      );
      final newModel = MixWidgetStateModel(
        disabled: true,
        hovered: false,
        focused: false,
        pressed: false,
        dragged: false,
        selected: false,
        longPressed: false,
        child: Container(),
      );

      expect(newModel.updateShouldNotify(oldModel), isTrue);
    });

    test('updateShouldNotifyDependent returns if a dependency changed', () {
      final oldModel = MixWidgetStateModel(
        disabled: false,
        hovered: false,
        focused: false,
        pressed: false,
        dragged: false,
        selected: false,
        longPressed: false,
        child: Container(),
      );
      final newModel = MixWidgetStateModel(
        disabled: true,
        hovered: false,
        focused: false,
        pressed: false,
        dragged: false,
        selected: false,
        longPressed: false,
        child: Container(),
      );

      expect(
          newModel
              .updateShouldNotifyDependent(oldModel, {MixWidgetState.disabled}),
          isTrue);
      expect(
          newModel
              .updateShouldNotifyDependent(oldModel, {MixWidgetState.hovered}),
          isFalse);
    });
  });

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
            final controller = MixWidgetStateController();

            controller.disabled = false;
            controller.hovered = hovered;
            controller.pressed = pressed;
            controller.longPressed = longPressed;
            controller.focused = focused;

            return Column(
              children: [
                MixWidgetStateBuilder(
                  controller: controller,
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Text('Disabled: ${controller.disabled}'),
                        Text('Hovered: ${controller.hovered}'),
                        Text('LongPressed: ${controller.longPressed}'),
                        Text('Pressed: ${controller.pressed}'),
                      ],
                    );
                  },
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

    expect(find.text('Disabled: false'), findsOneWidget);
    expect(find.text('Hovered: false'), findsOneWidget);
    expect(find.text('Pressed: false'), findsOneWidget);
    expect(find.text('LongPressed: false'), findsOneWidget);
    expect(find.text('Focused: false'), findsNothing);

    await tester.tap(find.text('Update State'));
    await tester.pump();

    expect(find.text('Disabled: false'), findsOneWidget);
    expect(find.text('Hovered: true'), findsOneWidget);
    expect(find.text('Pressed: true'), findsOneWidget);
    expect(find.text('LongPressed: true'), findsOneWidget);
    expect(find.text('Focused: true'), findsNothing);
  });

  testWidgets('PressableState updates inherit model',
      (WidgetTester tester) async {
    final controller = MixWidgetStateController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MixWidgetStateBuilder(
              controller: controller,
              builder: (context) {
                return const PressableStateTestWidget();
              }),
        ),
      ),
    );

    TrackRebuildWidgetState getDisabled() {
      return TrackRebuildWidget.findState(tester, 'disabled');
    }

    TrackRebuildWidgetState getHovered() {
      return TrackRebuildWidget.findState(tester, 'hovered');
    }

    TrackRebuildWidgetState getPressed() {
      return TrackRebuildWidget.findState(tester, 'pressed');
    }

    TrackRebuildWidgetState getLongPressed() {
      return TrackRebuildWidget.findState(tester, 'longPressed');
    }

    var disabled = getDisabled();
    var hovered = getHovered();
    var pressed = getPressed();
    var longPressed = getLongPressed();

    expect(disabled.buildCount, 1,
        reason: 'Disabled state should not have rebuilt');
    expect(disabled.state, false,
        reason: 'Disabled state should initially be false');
    expect(hovered.buildCount, 1,
        reason: 'Hovered state should not have rebuilt');
    expect(hovered.state, false,
        reason: 'Hovered state should initially be false');
    expect(pressed.buildCount, 1,
        reason: 'Pressed state should not have rebuilt');
    expect(pressed.state, false,
        reason: 'Pressed state should initially be false');
    expect(longPressed.buildCount, 1,
        reason: 'Long pressed state should not have rebuilt');
    expect(longPressed.state, false,
        reason: 'Long pressed state should initially be false');

    controller.hovered = true;
    await tester.pump();

    disabled = getDisabled();
    hovered = getHovered();
    pressed = getPressed();
    longPressed = getLongPressed();

    expect(disabled.buildCount, 1,
        reason: 'Disabled state should not rebuild when hovered changes');
    expect(disabled.state, false,
        reason: 'Disabled state should remain false when hovered changes');
    expect(hovered.buildCount, 2,
        reason: 'Hovered state should rebuild when set to true');
    expect(hovered.state, true,
        reason: 'Hovered state should be true after being set');
    expect(pressed.buildCount, 1,
        reason: 'Pressed state should not rebuild when hovered changes');
    expect(pressed.state, false,
        reason: 'Pressed state should remain false when hovered changes');
    expect(longPressed.buildCount, 1,
        reason: 'Long pressed state should not rebuild when hovered changes');
    expect(longPressed.state, false,
        reason: 'Long pressed state should remain false when hovered changes');

    controller.pressed = true;
    await tester.pump();

    disabled = getDisabled();
    hovered = getHovered();
    pressed = getPressed();
    longPressed = getLongPressed();

    expect(disabled.buildCount, 1,
        reason: 'Disabled state should not rebuild when pressed changes');
    expect(disabled.state, false,
        reason: 'Disabled state should remain false when pressed changes');
    expect(hovered.buildCount, 2,
        reason: 'Hovered state should not rebuild when pressed changes');
    expect(hovered.state, true,
        reason: 'Hovered state should remain true when pressed changes');
    expect(pressed.buildCount, 2,
        reason: 'Pressed state should rebuild when set to true');
    expect(pressed.state, true,
        reason: 'Pressed state should be true after being set');
    expect(longPressed.buildCount, 1,
        reason: 'Long pressed state should not rebuild when pressed changes');
    expect(longPressed.state, false,
        reason: 'Long pressed state should remain false when pressed changes');

    controller.longPressed = true;
    await tester.pump();

    disabled = getDisabled();
    hovered = getHovered();
    pressed = getPressed();
    longPressed = getLongPressed();

    expect(disabled.buildCount, 1,
        reason: 'Disabled state should not rebuild when long pressed changes');
    expect(disabled.state, false,
        reason: 'Disabled state should remain false when long pressed changes');
    expect(hovered.buildCount, 2,
        reason: 'Hovered state should not rebuild when long pressed changes');
    expect(hovered.state, true,
        reason: 'Hovered state should remain true when long pressed changes');
    expect(pressed.buildCount, 2,
        reason: 'Pressed state should not rebuild when long pressed changes');
    expect(pressed.state, true,
        reason: 'Pressed state should remain true when long pressed changes');
    expect(longPressed.buildCount, 2,
        reason: 'Long pressed state should rebuild when set to true');
    expect(longPressed.state, true,
        reason: 'Long pressed state should be true after being set');

    controller.disabled = true;

    await tester.pump();

    disabled = getDisabled();
    hovered = getHovered();
    pressed = getPressed();
    longPressed = getLongPressed();

    expect(disabled.buildCount, 2,
        reason: 'Disabled state should rebuild when set to true');
    expect(disabled.state, true,
        reason: 'Disabled state should be true after being set');
    expect(hovered.buildCount, 2,
        reason: 'Hovered state should not rebuild when disabled changes');
    expect(hovered.state, true,
        reason: 'Hovered state should remain true when disabled changes');
    expect(pressed.buildCount, 2,
        reason: 'Pressed state should not rebuild when disabled changes');
    expect(pressed.state, true,
        reason: 'Pressed state should remain true when disabled changes');
    expect(longPressed.buildCount, 2,
        reason: 'Long pressed state should not rebuild when disabled changes');
    expect(longPressed.state, true,
        reason: 'Long pressed state should remain true when disabled changes');
  });
}

class PressableStateTestWidget extends StatefulWidget {
  const PressableStateTestWidget({
    super.key,
  });

  @override
  State createState() => _PressableStateTestWidgetState();
}

class _PressableStateTestWidgetState extends State<PressableStateTestWidget> {
  bool Function(BuildContext) _widgetStateOf(MixWidgetState state) {
    return (BuildContext context) {
      return MixWidgetState.hasStateOf(context, state);
    };
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: Column(
        children: [
          TrackRebuildWidget(
            text: 'disabled',
            stateBuilder: _widgetStateOf(MixWidgetState.disabled),
          ),
          TrackRebuildWidget(
            text: 'hovered',
            stateBuilder: _widgetStateOf(MixWidgetState.hovered),
          ),
          TrackRebuildWidget(
            text: 'pressed',
            stateBuilder: _widgetStateOf(MixWidgetState.pressed),
          ),
          TrackRebuildWidget(
            text: 'longPressed',
            stateBuilder: _widgetStateOf(MixWidgetState.longPressed),
          ),
        ],
      ),
    );
  }
}
