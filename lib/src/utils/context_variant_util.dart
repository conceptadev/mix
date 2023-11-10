import 'package:flutter/material.dart';

import '../helpers/extensions/string_ext.dart';
import '../theme/mix_theme.dart';
import '../theme/tokens/breakpoints.dart';
import '../variants/context_variant.dart';

// Breakpoint context variants
final onSmall = _screenSizeVariant(BreakpointToken.small);

final onXSmall = _screenSizeVariant(BreakpointToken.xsmall);

final onMedium = _screenSizeVariant(BreakpointToken.medium);

final onLarge = _screenSizeVariant(BreakpointToken.large);

ContextVariant onBreakpoint({
  minWidth = 0,
  maxWidth = double.infinity,
  orientation = BreakpointOrientation.all,
}) {
  final constraints = BreakpointConstraint(
    minWidth: minWidth,
    maxWidth: maxWidth,
    orientation: orientation,
  );
  final constraintName =
      'minWidth-${constraints.minWidth}-maxWidth-${constraints.maxWidth}-orientation-${constraints.orientation}';

  return ContextVariant(
    'on-$constraintName',
    when: (BuildContext context) {
      final size = MediaQuery.sizeOf(context);

      return constraints.matches(size);
    },
  );
}

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
    when: (BuildContext context) {
      return Theme.of(context).brightness == brightness;
    },
  );
}

ContextVariant _screenSizeVariant(BreakpointToken screenSize) {
  return ContextVariant(
    'on-${screenSize.name.paramCase}',
    when: (BuildContext context) {
      final breakpoints = MixTheme.of(context).breakpoints;

      final size = MediaQuery.sizeOf(context);

      final selectedbreakpoint = breakpoints[screenSize];

      assert(
        selectedbreakpoint != null,
        'Breakpoint ${screenSize.name} is not defined in the theme',
      );

      return selectedbreakpoint?.call(context).matches(size) ?? false;
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
