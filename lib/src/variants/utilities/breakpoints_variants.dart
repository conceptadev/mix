import 'package:flutter/material.dart';

import '../../extensions/string_ext.dart';
import '../../theme/mix_theme.dart';
import '../../theme/tokens/breakpoints.dart';
import '../context_variant.dart';

final onSmall = _breakpointVariant(ScreenSizeToken.small);

final onXSmall = _breakpointVariant(ScreenSizeToken.xsmall);

final onMedium = _breakpointVariant(ScreenSizeToken.medium);

final onLarge = _breakpointVariant(ScreenSizeToken.large);

ContextVariant _breakpointVariant(ScreenSizeToken screenSize) {
  return ContextVariant(
    'on-${screenSize.name.paramCase}',
    shouldApply: (BuildContext context) {
      final breakpoints = MixTheme.of(context).breakpoints;

      return breakpoints.getScreenSize(context).index <= screenSize.index;
    },
  );
}
