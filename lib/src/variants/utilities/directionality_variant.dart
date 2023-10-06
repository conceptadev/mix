import 'package:flutter/material.dart';

import '../../extensions/build_context_ext.dart';
import '../../extensions/string_ext.dart';
import '../context_variant.dart';

final onRTL = _directionalityVariant(TextDirection.rtl);
final onLTR = _directionalityVariant(TextDirection.ltr);

ContextVariant _directionalityVariant(TextDirection direction) {
  return ContextVariant(
    'on-${direction.name.paramCase}',
    shouldApply: (BuildContext context) {
      return context.directionality == direction;
    },
  );
}
