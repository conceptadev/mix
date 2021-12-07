import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/pressable/pressable.notifier.dart';
import 'package:mix/src/helpers/extensions.dart';
import 'package:mix/src/helpers/variants.dart';
import 'package:mix/src/theme/mix_theme.dart';
import 'package:mix/src/theme/tokens/breakpoints_token.dart';

class VariantUtils {
  const VariantUtils._();

  static _screenSizeCheck(ScreenSizeToken screenSize) {
    return (BuildContext context) {
      final breakpoints = MixTheme.of(context).breakpoints;
      return breakpoints.getScreenSize(context).index <= screenSize.index;
    };
  }

  static Variant<T> small<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.screenSize.value,
      checkFn: _screenSizeCheck(ScreenSizeToken.small),
    );
  }

  static Variant<T> xsmall<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.screenSize.value,
      checkFn: _screenSizeCheck(ScreenSizeToken.xsmall),
    );
  }

  static Variant<T> medium<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.screenSize.value,
      checkFn: _screenSizeCheck(ScreenSizeToken.medium),
    );
  }

  static Variant<T> large<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.screenSize.value,
      checkFn: _screenSizeCheck(ScreenSizeToken.large),
    );
  }

  static Variant<T> portrait<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.orientation.value,
      checkFn: (BuildContext context) {
        return context.orientation == Orientation.portrait;
      },
    );
  }

  static Variant<T> landscape<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.orientation.value,
      checkFn: (BuildContext context) {
        return context.orientation == Orientation.landscape;
      },
    );
  }

  static Variant<T> dark<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.dark.value,
      checkFn: (BuildContext context) {
        return context.isDarkMode;
      },
    );
  }

  static Variant<T> disabled<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.disabled.value,
      checkFn: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.disabled == true;
      },
    );
  }

  static Variant<T> focused<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.focus.value,
      checkFn: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.focused == true;
      },
    );
  }

  static Variant<T> pressing<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.pressing.value,
      checkFn: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.pressing == true;
      },
    );
  }

  static Variant<T> hover<T extends Attribute>() {
    return Variant<T>(
      SystemVariants.hover.value,
      checkFn: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.hovering == true;
      },
    );
  }
}
