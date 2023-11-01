import 'package:flutter/material.dart';

import '../core/variants/context_variant.dart';
import '../helpers/extensions/string_ext.dart';
import '../theme/mix_theme.dart';
import '../theme/tokens/breakpoints.dart';

// Breakpoint context variants
final onSmall = _breakpointVariant(ScreenSizeToken.small);

final onXSmall = _breakpointVariant(ScreenSizeToken.xsmall);

final onMedium = _breakpointVariant(ScreenSizeToken.medium);

final onLarge = _breakpointVariant(ScreenSizeToken.large);

// Brighness context variants
final onDark = _brightnessVariant(Brightness.dark);

final onLight = _brightnessVariant(Brightness.light);

// Directionality context variants
final onRTL = _directionalityVariant(TextDirection.rtl);
final onLTR = _directionalityVariant(TextDirection.ltr);

// Not variant
const onNot = _onNot;

// Orientation context variants

final onPortrait = _orientationVariant(Orientation.portrait);

final onLandscape = _orientationVariant(Orientation.landscape);

ContextVariant _directionalityVariant(TextDirection direction) {
  return ContextVariant(
    'on-${direction.name.paramCase}',
    when: (BuildContext context) => Directionality.of(context) == direction,
  );
}

ContextVariant _brightnessVariant(Brightness brightness) {
  return ContextVariant(
    'on-${brightness.name.paramCase}',
    when: (BuildContext context) => Theme.of(context).brightness == brightness,
  );
}

ContextVariant _breakpointVariant(ScreenSizeToken screenSize) {
  return ContextVariant(
    'on-${screenSize.name.paramCase}',
    when: (BuildContext context) {
      final breakpoints = MixTheme.of(context).breakpoints;

      return breakpoints.getScreenSize(context).index <= screenSize.index;
    },
  );
}

ContextVariant _onNot(ContextVariant variant) {
  return ContextVariant(
    'not-(${variant.name})',
    when: (BuildContext context) => !variant.when(context),
  );
}

ContextVariant _orientationVariant(Orientation orientation) {
  return ContextVariant(
    'on-${orientation.name.paramCase}',
    when: (BuildContext context) =>
        MediaQuery.orientationOf(context) == orientation,
  );
}
