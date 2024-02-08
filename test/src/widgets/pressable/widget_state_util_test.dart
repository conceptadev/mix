// Import necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';

import '../../../helpers/testing_utils.dart';

void main() {
  group('Pressable Util', () {
    const attribute1 = MockBooleanScalarAttribute(true);
    const attribute2 = MockStringScalarAttribute('attribute2');
    const attribute3 = MockIntScalarAttribute(3);
    testWidgets('press state', (tester) async {
      await tester.pumpWithPressable(
        Container(),
        state: PressableState.pressed,
        focus: true,
      );

      final context = tester.element(find.byType(Container));

      final onPressAttr = onPressed(attribute1, attribute2, attribute3);

      expect(onPressAttr.when(context), true);
      expect(onPressAttr.value, Style(attribute1, attribute2, attribute3));
      expect(onPressAttr.variant.name, 'on-pressed');
      expect(onPressAttr.variant.when(context), true);
    });

    testWidgets('long press state', (tester) async {
      await tester.pumpWithPressable(
        Container(),
        state: PressableState.longPressed,
        focus: true,
      );

      final context = tester.element(find.byType(Container));

      final onLongPressAttr = onLongPressed(attribute1, attribute2, attribute3);

      expect(onLongPressAttr.when(context), true);
      expect(
        onLongPressAttr.value,
        Style(attribute1, attribute2, attribute3),
      );
      expect(onLongPressAttr.variant.name, 'on-long-pressed');
      expect(onLongPressAttr.variant.when(context), true);
    });

    testWidgets('hover state', (tester) async {
      await tester.pumpWithPressable(
        Container(),
        state: PressableState.hovered,
        focus: true,
      );

      final context = tester.element(find.byType(Container));

      final onHoverAttr = onHover(attribute1, attribute2, attribute3);

      expect(onHoverAttr.when(context), true);
      expect(onHoverAttr.value, Style(attribute1, attribute2, attribute3));
      expect(onHoverAttr.variant.name, 'on-hover');
      expect(onHoverAttr.variant.when(context), true);
    });

    testWidgets('disabled state', (tester) async {
      await tester.pumpWithPressable(
        Container(),
        disabled: true,
        focus: true,
      );

      final context = tester.element(find.byType(Container));

      final onDisabledAttr = onDisabled(attribute1, attribute2, attribute3);

      expect(onDisabledAttr.when(context), true);
      expect(
        onDisabledAttr.value,
        Style(attribute1, attribute2, attribute3),
      );
      expect(onDisabledAttr.variant.name, 'on-disabled');
      expect(onDisabledAttr.variant.when(context), true);
    });

    // onEnabled
    testWidgets('enabled state', (tester) async {
      await tester.pumpWithPressable(
        Container(),
        state: PressableState.pressed,
        focus: true,
      );

      final context = tester.element(find.byType(Container));

      final onEnabledAttr = onEnabled(attribute1, attribute2, attribute3);

      expect(onEnabledAttr.when(context), true);
      expect(onEnabledAttr.value, Style(attribute1, attribute2, attribute3));
      expect(onEnabledAttr.variant.name, 'on-enabled');
      expect(onEnabledAttr.variant.when(context), true);
    });

    // onFocus
    testWidgets('focus state', (tester) async {
      await tester.pumpWithPressable(
        Container(),
        state: PressableState.pressed,
        focus: true,
      );

      final context = tester.element(find.byType(Container));

      final onFocusAttr = onFocused(attribute1, attribute2, attribute3);

      expect(onFocusAttr.when(context), true);
      expect(onFocusAttr.value, Style(attribute1, attribute2, attribute3));
      expect(onFocusAttr.variant.name, 'on-focused');
      expect(onFocusAttr.variant.when(context), true);
    });
  });
}
