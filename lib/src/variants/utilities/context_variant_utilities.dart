import 'package:flutter/material.dart';

import '../../extensions/build_context_ext.dart';
import '../../theme/mix_theme.dart';
import '../../theme/tokens/breakpoints.dart';
import '../../widgets/pressable/pressable.notifier.dart';
import '../../widgets/pressable/pressable_state.dart';
import '../context_variant.dart';

final onDisabled = ContextVariant(
  'onDisabled',
  shouldApply: (BuildContext context) {
    final pressable = PressableNotifier.of(context);

    return pressable?.state == PressableState.disabled;
  },
);

final onEnabled = onNot(onDisabled);

final onSmall = _buildScreenSizeVariant('onSmall', ScreenSizeToken.small);

final onXSmall = _buildScreenSizeVariant('onXSmall', ScreenSizeToken.xsmall);

final onMedium = _buildScreenSizeVariant('onMedium', ScreenSizeToken.medium);

final onLarge = _buildScreenSizeVariant('onLarge', ScreenSizeToken.large);

final onPortrait = ContextVariant(
  'onPortrait',
  shouldApply: (BuildContext context) {
    return context.orientation == Orientation.portrait;
  },
);

final onLandscape = ContextVariant(
  'onLandscape',
  shouldApply: (BuildContext context) {
    return context.orientation == Orientation.landscape;
  },
);

final onDark = ContextVariant(
  'onDark',
  shouldApply: (BuildContext context) {
    return context.isDarkMode;
  },
);

final onLight = ContextVariant(
  'onLight',
  shouldApply: (BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  },
);

final onFocus = ContextVariant(
  'onFocus',
  shouldApply: (BuildContext context) {
    final pressable = PressableNotifier.of(context);

    return pressable?.focus == true;
  },
);

final onPress = ContextVariant(
  'onPress',
  shouldApply: (BuildContext context) {
    final pressable = PressableNotifier.of(context);

    return pressable?.state == PressableState.pressed;
  },
);

final onLongPress = ContextVariant(
  'onLongPress',
  shouldApply: (BuildContext context) {
    final pressable = PressableNotifier.of(context);

    return pressable?.state == PressableState.longPressed;
  },
);

final onHover = ContextVariant(
  'onHover',
  shouldApply: (BuildContext context) {
    final pressable = PressableNotifier.of(context);

    return pressable?.state == PressableState.hover;
  },
);

final onRTL = ContextVariant(
  'onRTL',
  shouldApply: (BuildContext context) {
    return context.directionality == TextDirection.rtl;
  },
);

final onLTR = ContextVariant(
  'onLTR',
  shouldApply: (context) {
    return context.directionality == TextDirection.ltr;
  },
);

ContextVariant onNot(ContextVariant variant) {
  return ContextVariant(
    'not(${variant.name})',
    shouldApply: (BuildContext context) {
      return !variant.shouldApply(context);
    },
  );
}

ContextVariant _buildScreenSizeVariant(
  String name,
  ScreenSizeToken screenSize,
) {
  return ContextVariant(
    name,
    shouldApply: (BuildContext context) {
      final breakpoints = MixTheme.of(context).breakpoints;

      return breakpoints.getScreenSize(context).index <= screenSize.index;
    },
  );
}
