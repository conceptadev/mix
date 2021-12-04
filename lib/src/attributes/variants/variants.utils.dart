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

  static VariantAttribute<T> small<T extends Attribute>(
    List<T> attributes,
  ) {
    return VariantAttribute<T>(
      screenSizeVariant,
      attributes,
      checkFn: _screenSizeCheck(ScreenSizeToken.small),
    );
  }

  static VariantAttribute<T> xsmall<T extends Attribute>(
    List<T> attributes,
  ) {
    return VariantAttribute<T>(
      screenSizeVariant,
      attributes,
      checkFn: _screenSizeCheck(ScreenSizeToken.xsmall),
    );
  }

  static VariantAttribute<T> medium<T extends Attribute>(
    List<T> attributes,
  ) {
    return VariantAttribute<T>(
      screenSizeVariant,
      attributes,
      checkFn: _screenSizeCheck(ScreenSizeToken.medium),
    );
  }

  static VariantAttribute<T> large<T extends Attribute>(
    List<T> attributes,
  ) {
    return VariantAttribute<T>(
      screenSizeVariant,
      attributes,
      checkFn: _screenSizeCheck(ScreenSizeToken.large),
    );
  }

  static VariantAttribute<T> portrait<T extends Attribute>(
    List<T> attributes,
  ) {
    return VariantAttribute<T>(
      orientationVariant,
      attributes,
      checkFn: (BuildContext context) {
        return context.orientation == Orientation.portrait;
      },
    );
  }

  static VariantAttribute<T> landscape<T extends Attribute>(
    List<T> attributes,
  ) {
    return VariantAttribute<T>(
      orientationVariant,
      attributes,
      checkFn: (BuildContext context) {
        return context.orientation == Orientation.landscape;
      },
    );
  }

  static VariantAttribute<T> dark<T extends Attribute>(List<T> attributes) {
    return VariantAttribute<T>(
      darkVariant,
      attributes,
      checkFn: (BuildContext context) {
        return context.isDarkMode;
      },
    );
  }

  static VariantAttribute<T> disabled<T extends Attribute>(List<T> attributes) {
    return VariantAttribute<T>(
      disabledVariant,
      attributes,
      checkFn: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.disabled == true;
      },
    );
  }

  static VariantAttribute<T> focused<T extends Attribute>(List<T> attributes) {
    return VariantAttribute<T>(
      focusVariant,
      attributes,
      checkFn: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.focused == true;
      },
    );
  }

  static VariantAttribute<T> pressing<T extends Attribute>(List<T> attributes) {
    return VariantAttribute<T>(
      pressingVariant,
      attributes,
      checkFn: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.pressing == true;
      },
    );
  }

  static VariantAttribute<T> hover<T extends Attribute>(List<T> attributes) {
    return VariantAttribute<T>(
      hoverVariant,
      attributes,
      checkFn: (BuildContext context) {
        final pressable = PressableNotifier.of(context);
        return pressable?.hovering == true;
      },
    );
  }

  // final pressable = PressableNotifier.of(context);
  //   return pressable?.disabled == true;

  static VariantAttribute variant<T extends Attribute>(
    Var variant,
    List<T> attributes, {
    bool Function(BuildContext)? checkFn,
  }) {
    return VariantAttribute(
      variant,
      attributes,
      checkFn: checkFn,
    );
  }
}
