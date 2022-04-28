import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import 'package:mix/src/attributes/pressable/pressable.notifier.dart';
import 'package:mix/src/theme/tokens/breakpoints_token.dart';

/// {@category Variants}
class VariantUtils {
  const VariantUtils._();

  static bool Function(BuildContext) _screenSizeCheck(
    ScreenSizeToken screenSize,
  ) {
    return (BuildContext context) {
      final breakpoints = MixTheme.of(context).breakpoints;
      return breakpoints.getScreenSize(context).index <= screenSize.index;
    };
  }

  /// Short Utils: small
  static Variant<T> small<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.screenSize.value,
      shouldApply: _screenSizeCheck(ScreenSizeToken.small),
    );
  }

  /// Short Utils: xsmall
  static Variant<T> xsmall<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.screenSize.value,
      shouldApply: _screenSizeCheck(ScreenSizeToken.xsmall),
    );
  }

  /// Short Utils: medium
  static Variant<T> medium<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.screenSize.value,
      shouldApply: _screenSizeCheck(ScreenSizeToken.medium),
    );
  }

  /// Short Utils: large
  static Variant<T> large<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.screenSize.value,
      shouldApply: _screenSizeCheck(ScreenSizeToken.large),
    );
  }

  /// Short Utils: portrait
  static Variant<T> portrait<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.orientation.value,
      shouldApply: (BuildContext context) {
        return context.orientation == Orientation.portrait;
      },
    );
  }

  /// Short Utils: landscape
  static Variant<T> landscape<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.orientation.value,
      shouldApply: (BuildContext context) {
        return context.orientation == Orientation.landscape;
      },
    );
  }

  /// Short Utils: dark
  static Variant<T> dark<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.dark.value,
      shouldApply: (BuildContext context) {
        return context.isDarkMode;
      },
    );
  }

  /// Short Utils: light
  static Variant<T> light<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.dark.value,
      shouldApply: (BuildContext context) {
        return context.isDarkMode == false;
      },
    );
  }

  /// Short Utils: disabled
  static Variant<T> disabled<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.disabled.value,
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.disabled == true;
      },
    );
  }

  /// Short Utils: focused
  static Variant<T> focused<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.focus.value,
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.focused == true;
      },
    );
  }

  /// Short utils: pressing
  static Variant<T> pressing<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.pressing.value,
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.pressing == true;
      },
    );
  }

  /// Short Utils: hover
  static Variant<T> hover<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.hover.value,
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.hovering == true;
      },
    );
  }

  static Variant<T> not<T extends Attribute>(Variant<T> other) {
    return other..inverse = true;
  }
}
