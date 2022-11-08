import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../helpers/extensions.dart';
import '../../theme/mix_theme.dart';
import '../../theme/tokens/breakpoints.dart';
import '../../widgets/pressable/pressable.notifier.dart';
import '../variant_condition.dart';
import '../variants.dart';

/// {@category Variants}
class DynamicVariantUtilities {
  const DynamicVariantUtilities._();

  static _screenSizeCheck(ScreenSizeToken screenSize) {
    return (BuildContext context) {
      final breakpoints = MixTheme.of(context).breakpoints;

      return breakpoints.getScreenSize(context).index <= screenSize.index;
    };
  }

  static Variant<T> onSmall<T extends Attribute>() {
    return Variant<T>(
      'onSmall',
      shouldApply: _screenSizeCheck(ScreenSizeToken.small),
    );
  }

  static Variant<T> onXsmall<T extends Attribute>() {
    return Variant<T>(
      'onXsmall',
      shouldApply: _screenSizeCheck(ScreenSizeToken.xsmall),
    );
  }

  static Variant<T> onMedium<T extends Attribute>() {
    return Variant<T>(
      'onMedium',
      shouldApply: _screenSizeCheck(ScreenSizeToken.medium),
    );
  }

  static Variant<T> onLarge<T extends Attribute>() {
    return Variant<T>(
      'onLarge',
      shouldApply: _screenSizeCheck(ScreenSizeToken.large),
    );
  }

  static Variant<T> onPortrait<T extends Attribute>() {
    return Variant<T>(
      'onPortrait',
      shouldApply: (BuildContext context) {
        return context.orientation == Orientation.portrait;
      },
    );
  }

  static Variant<T> onLandscape<T extends Attribute>() {
    return Variant<T>(
      'onLandscape',
      shouldApply: (BuildContext context) {
        return context.orientation == Orientation.landscape;
      },
    );
  }

  static Variant<T> onDark<T extends Attribute>() {
    return Variant<T>(
      'onDark',
      shouldApply: (BuildContext context) {
        return context.isDarkMode;
      },
    );
  }

  static Variant<T> onLight<T extends Attribute>() {
    return Variant<T>(
      'onLight',
      shouldApply: (BuildContext context) {
        return Theme.of(context).brightness == Brightness.light;
      },
    );
  }

  static Variant<T> onDisabled<T extends Attribute>() {
    return Variant<T>(
      'onDisabled',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.disabled == true;
      },
    );
  }

  static Variant<T> onFocus<T extends Attribute>() {
    return Variant<T>(
      'onFocus',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.focused == true;
      },
    );
  }

  static Variant<T> onPress<T extends Attribute>() {
    return Variant<T>(
      'onPress',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.pressing == true;
      },
    );
  }

  static Variant<T> onHover<T extends Attribute>() {
    return Variant<T>(
      'onHover',
      shouldApply: (BuildContext context) {
        final pressable = PressableNotifier.of(context);

        return pressable?.hovering == true;
      },
    );
  }

  static Variant<T> onNot<T extends Attribute>(Variant<T> other) {
    return other.inverseInstance();
  }

  static WhenVariant<T> when<T extends Attribute>(bool apply) {
    return WhenVariant<T>('when', apply);
  }
}
