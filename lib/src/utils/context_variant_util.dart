import 'package:flutter/material.dart';

import '../helpers/extensions/string_ext.dart';
import '../variants/context_variant.dart';

// Brighness context variants
final onDark = onBrightness(Brightness.dark);

final onLight = onBrightness(Brightness.light);

ContextVariant onBrightness(Brightness brightness) {
  return ContextVariant(
    'on-${brightness.name.paramCase}',
    when: (BuildContext context) {
      return Theme.of(context).brightness == brightness;
    },
  );
}

// Directionality context variants
final onRTL = _onDirectionality(TextDirection.rtl);
final onLTR = _onDirectionality(TextDirection.ltr);

ContextVariant _onDirectionality(TextDirection direction) {
  return ContextVariant(
    'on-${direction.name.paramCase}',
    when: (BuildContext context) => Directionality.of(context) == direction,
  );
}

ContextVariant onNot(ContextVariant variant) {
  return ContextVariant(
    'not(${variant.name})',
    when: (BuildContext context) => !variant.when(context),
  );
}
