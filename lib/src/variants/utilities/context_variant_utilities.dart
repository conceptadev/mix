import 'package:flutter/material.dart';

import '../../extensions/build_context_ext.dart';
import '../../theme/mix_theme.dart';
import '../../theme/tokens/breakpoints.dart';
import '../../widgets/pressable/pressable.notifier.dart';
import '../../widgets/pressable/pressable_state.dart';
import '../context_variant.dart';

class ContextVariantUtilities {
  const ContextVariantUtilities._();

  static _screenSizeCheck(ScreenSizeToken screenSize) {
    return (BuildContext context) {
      final breakpoints = MixTheme.of(context).breakpoints;

      return breakpoints.getScreenSize(context).index <= screenSize.index;
    };
  }

  static ContextStyleVariant onSmall() {
    return ContextStyleVariant(
      'onSmall',
      shouldApply: _screenSizeCheck(ScreenSizeToken.small),
    );
  }

  static ContextStyleVariant onXsmall() {
    return ContextStyleVariant(
      'onXsmall',
      shouldApply: _screenSizeCheck(ScreenSizeToken.xsmall),
    );
  }

  static ContextStyleVariant onMedium() {
    return ContextStyleVariant(
      'onMedium',
      shouldApply: _screenSizeCheck(ScreenSizeToken.medium),
    );
  }

  static ContextStyleVariant onLarge() {
    return ContextStyleVariant(
      'onLarge',
      shouldApply: _screenSizeCheck(ScreenSizeToken.large),
    );
  }

  static ContextStyleVariant onPortrait() {
    return ContextStyleVariant(
      'onPortrait',
      shouldApply: (BuildContext context) {
        return context.orientation == Orientation.portrait;
      },
    );
  }

  static ContextStyleVariant onLandscape() {
    return ContextStyleVariant(
      'onLandscape',
      shouldApply: (BuildContext context) {
        return context.orientation == Orientation.landscape;
      },
    );
  }

  static ContextStyleVariant onDark() {
    return ContextStyleVariant(
      'onDark',
      shouldApply: (BuildContext context) {
        return context.isDarkMode;
      },
    );
  }

  static ContextStyleVariant onLight() {
    return ContextStyleVariant(
      'onLight',
      shouldApply: (BuildContext context) {
        return Theme.of(context).brightness == Brightness.light;
      },
    );
  }

  static ContextStyleVariant onDisabled() {
    return ContextStyleVariant(
      'onDisabled',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.state == PressableState.disabled;
      },
    );
  }

  static ContextStyleVariant onFocus() {
    return ContextStyleVariant(
      'onFocus',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.focus == true;
      },
    );
  }

  static ContextStyleVariant onPress() {
    return ContextStyleVariant(
      'onPress',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.state == PressableState.pressed;
      },
    );
  }

  static ContextStyleVariant onLongPress() {
    return ContextStyleVariant(
      'onLongPress',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.state == PressableState.longPressed;
      },
    );
  }

  static ContextStyleVariant onHover() {
    return ContextStyleVariant(
      'onHover',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.state == PressableState.hover;
      },
    );
  }

  static T onNot<T extends ContextStyleVariant>(T other) {
    return other.inverseInstance() as T;
  }

  static ContextStyleVariant onRTL() {
    return ContextStyleVariant(
      'onRTL',
      shouldApply: (BuildContext context) {
        return context.directionality == TextDirection.rtl;
      },
    );
  }
}
