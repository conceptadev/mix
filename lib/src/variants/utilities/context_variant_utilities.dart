import 'package:flutter/material.dart';

import '../../helpers/extensions.dart';
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

  static ContextVariant onSmall() {
    return ContextVariant(
      'onSmall',
      shouldApply: _screenSizeCheck(ScreenSizeToken.small),
    );
  }

  static ContextVariant onXsmall() {
    return ContextVariant(
      'onXsmall',
      shouldApply: _screenSizeCheck(ScreenSizeToken.xsmall),
    );
  }

  static ContextVariant onMedium() {
    return ContextVariant(
      'onMedium',
      shouldApply: _screenSizeCheck(ScreenSizeToken.medium),
    );
  }

  static ContextVariant onLarge() {
    return ContextVariant(
      'onLarge',
      shouldApply: _screenSizeCheck(ScreenSizeToken.large),
    );
  }

  static ContextVariant onPortrait() {
    return ContextVariant(
      'onPortrait',
      shouldApply: (BuildContext context) {
        return context.orientation == Orientation.portrait;
      },
    );
  }

  static ContextVariant onLandscape() {
    return ContextVariant(
      'onLandscape',
      shouldApply: (BuildContext context) {
        return context.orientation == Orientation.landscape;
      },
    );
  }

  static ContextVariant onDark() {
    return ContextVariant(
      'onDark',
      shouldApply: (BuildContext context) {
        return context.isDarkMode;
      },
    );
  }

  static ContextVariant onLight() {
    return ContextVariant(
      'onLight',
      shouldApply: (BuildContext context) {
        return Theme.of(context).brightness == Brightness.light;
      },
    );
  }

  static ContextVariant onDisabled() {
    return ContextVariant(
      'onDisabled',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.state == PressableState.disabled;
      },
    );
  }

  static ContextVariant onFocus() {
    return ContextVariant(
      'onFocus',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.focus == true;
      },
    );
  }

  static ContextVariant onPress() {
    return ContextVariant(
      'onPress',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.state == PressableState.pressed;
      },
    );
  }

  static ContextVariant onLongPress() {
    return ContextVariant(
      'onLongPress',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.state == PressableState.longPressed;
      },
    );
  }

  static ContextVariant onHover() {
    return ContextVariant(
      'onHover',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.state == PressableState.hover;
      },
    );
  }

  static T onNot<T extends ContextVariant>(T other) {
    return other.inverseInstance() as T;
  }

  static ContextVariant onRTL() {
    return ContextVariant(
      'onRTL',
      shouldApply: (BuildContext context) {
        return context.directionality == TextDirection.rtl;
      },
    );
  }
}
