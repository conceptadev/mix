// Orientation context variants

import 'package:flutter/material.dart';

import '../../helpers/extensions/string_ext.dart';
import '../../variants/context_variant.dart';

final onPortrait = onOrientation(Orientation.portrait);

final onLandscape = onOrientation(Orientation.landscape);

ContextVariant onOrientation(Orientation orientation) {
  return ContextVariant(
    'on-${orientation.name.paramCase}',
    when: (BuildContext context) =>
        MediaQuery.orientationOf(context) == orientation,
  );
}
