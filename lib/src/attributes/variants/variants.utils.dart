import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/pressable/pressable.notifier.dart';
import 'package:mix/src/theme/tokens/breakpoints_token.dart';

class VariantUtils {
  const VariantUtils._();

  static _screenSizeCheck(ScreenSizeToken screenSize) {
    return (BuildContext context) {
      final breakpoints = MixTheme.of(context).breakpoints;
      return breakpoints.getScreenSize(context).index <= screenSize.index;
    };
  }

  static Var<T> small<T extends Attribute>() {
    return Var<T>(
      SystemVariants.screenSize.value,
      checkFn: _screenSizeCheck(ScreenSizeToken.small),
    );
  }

  static Var<T> xsmall<T extends Attribute>() {
    return Var<T>(
      SystemVariants.screenSize.value,
      checkFn: _screenSizeCheck(ScreenSizeToken.xsmall),
    );
  }

  static Var<T> medium<T extends Attribute>() {
    return Var<T>(
      SystemVariants.screenSize.value,
      checkFn: _screenSizeCheck(ScreenSizeToken.medium),
    );
  }

  static Var<T> large<T extends Attribute>() {
    return Var<T>(
      SystemVariants.screenSize.value,
      checkFn: _screenSizeCheck(ScreenSizeToken.large),
    );
  }

  static Var<T> portrait<T extends Attribute>() {
    return Var<T>(
      SystemVariants.orientation.value,
      checkFn: (BuildContext context) {
        return context.orientation == Orientation.portrait;
      },
    );
  }

  static Var<T> landscape<T extends Attribute>() {
    return Var<T>(
      SystemVariants.orientation.value,
      checkFn: (BuildContext context) {
        return context.orientation == Orientation.landscape;
      },
    );
  }

  static Var<T> dark<T extends Attribute>() {
    return Var<T>(
      SystemVariants.dark.value,
      checkFn: (BuildContext context) {
        return context.isDarkMode;
      },
    );
  }

  static Var<T> disabled<T extends Attribute>() {
    return Var<T>(
      SystemVariants.disabled.value,
      checkFn: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.disabled == true;
      },
    );
  }

  static Var<T> focused<T extends Attribute>() {
    return Var<T>(
      SystemVariants.focus.value,
      checkFn: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.focused == true;
      },
    );
  }

  static Var<T> pressing<T extends Attribute>() {
    return Var<T>(
      SystemVariants.pressing.value,
      checkFn: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.pressing == true;
      },
    );
  }

  static Var<T> hover<T extends Attribute>() {
    return Var<T>(
      SystemVariants.hover.value,
      checkFn: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.hovering == true;
      },
    );
  }
}
