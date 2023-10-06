import 'package:flutter/material.dart';

import '../../extensions/build_context_ext.dart';
import '../../extensions/string_ext.dart';
import '../context_variant.dart';

final onPortrait = _orientationVariant(Orientation.portrait);

final onLandscape = _orientationVariant(Orientation.landscape);

ContextVariant _orientationVariant(Orientation orientation) {
  return ContextVariant(
    'on-${orientation.name.paramCase}',
    shouldApply: (BuildContext context) {
      return context.orientation == orientation;
    },
  );
}
