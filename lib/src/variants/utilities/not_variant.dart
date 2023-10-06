import 'package:flutter/material.dart';

import '../context_variant.dart';

ContextVariant onNot(ContextVariant variant) {
  return ContextVariant(
    'not-(${variant.name})',
    shouldApply: (BuildContext context) {
      return !variant.shouldApply(context);
    },
  );
}
