import 'package:flutter/material.dart';

import '../../extensions/string_ext.dart';
import '../context_variant.dart';

final onDark = _brightnessVariant(Brightness.dark);

final onLight = _brightnessVariant(Brightness.light);

ContextVariant _brightnessVariant(Brightness brightness) {
  return ContextVariant(
    'on-${brightness.name.paramCase}',
    shouldApply: (BuildContext context) {
      return Theme.of(context).brightness == brightness;
    },
  );
}
