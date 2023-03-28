import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../helpers/extensions.dart';
import '../../theme/mix_theme.dart';
import '../../theme/tokens/breakpoints.dart';
import '../../widgets/pressable/pressable.notifier.dart';
import '../../widgets/pressable/pressable_state.dart';
import '../context_variant.dart';
import '../variant_condition.dart';

/// {@category Variants}
class DynamicVariantUtilities {
  const DynamicVariantUtilities._();

  static _screenSizeCheck(ScreenSizeToken screenSize) {
    return (BuildContext context) {
      final breakpoints = MixTheme.of(context).breakpoints;

      return breakpoints.getScreenSize(context).index <= screenSize.index;
    };
  }

  static ContextVariant onSmall<T extends Attribute>() {
    return ContextVariant(
      'onSmall',
      shouldApply: _screenSizeCheck(ScreenSizeToken.small),
    );
  }

  static ContextVariant onXsmall<T extends Attribute>() {
    return ContextVariant(
      'onXsmall',
      shouldApply: _screenSizeCheck(ScreenSizeToken.xsmall),
    );
  }

  static ContextVariant onMedium<T extends Attribute>() {
    return ContextVariant(
      'onMedium',
      shouldApply: _screenSizeCheck(ScreenSizeToken.medium),
    );
  }

  static ContextVariant onLarge<T extends Attribute>() {
    return ContextVariant(
      'onLarge',
      shouldApply: _screenSizeCheck(ScreenSizeToken.large),
    );
  }

  static ContextVariant onPortrait<T extends Attribute>() {
    return ContextVariant(
      'onPortrait',
      shouldApply: (BuildContext context) {
        return context.orientation == Orientation.portrait;
      },
    );
  }

  static ContextVariant onLandscape<T extends Attribute>() {
    return ContextVariant(
      'onLandscape',
      shouldApply: (BuildContext context) {
        return context.orientation == Orientation.landscape;
      },
    );
  }

  static ContextVariant onDark<T extends Attribute>() {
    return ContextVariant(
      'onDark',
      shouldApply: (BuildContext context) {
        return context.isDarkMode;
      },
    );
  }

  static ContextVariant onLight<T extends Attribute>() {
    return ContextVariant(
      'onLight',
      shouldApply: (BuildContext context) {
        return Theme.of(context).brightness == Brightness.light;
      },
    );
  }

  static ContextVariant onDisabled<T extends Attribute>() {
    return ContextVariant(
      'onDisabled',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.state == PressableState.disabled;
      },
    );
  }

  static ContextVariant onFocus<T extends Attribute>() {
    return ContextVariant(
      'onFocus',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.focus == true;
      },
    );
  }

  static ContextVariant onPress<T extends Attribute>() {
    return ContextVariant(
      'onPress',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.state == PressableState.pressed;
      },
    );
  }

  static ContextVariant onLongPress<T extends Attribute>() {
    return ContextVariant(
      'onLongPress',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.state == PressableState.longPressed;
      },
    );
  }

  static ContextVariant onHover<T extends Attribute>() {
    return ContextVariant(
      'onHover',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.state == PressableState.hover;
      },
    );
  }

//TODO: change this API
  static T onNot<T extends ContextVariant>(T other) {
    return other.inverseInstance() as T;
  }

  static ContextVariant onRTL<T extends Attribute>() {
    return ContextVariant(
      'onRTL',
      shouldApply: (BuildContext context) {
        return context.directionality == TextDirection.rtl;
      },
    );
  }

  static WhenVariant when(bool apply) {
    return WhenVariant('when', apply);
  }
}
