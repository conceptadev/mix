import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../helpers/extensions.dart';
import '../../theme/mix_theme.dart';
import '../../theme/tokens/breakpoints.dart';
import '../context_variant.dart';
import '../variant.dart';
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

  static const onDisabled = Variant('onDisabled');
  static const onFocus = Variant('onFocus');
  static const onPress = Variant('onPress');
  static const onLongPress = Variant('onLongPress');
  static const onHover = Variant('onHover');

  static T onNot<T extends Variant>(T other) {
    return other.inverseInstance() as T;
  }

  static WhenVariant when(bool apply) {
    return WhenVariant('when', apply);
  }
}
