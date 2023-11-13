import 'package:flutter/material.dart';

import '../../variants/context_variant.dart';

ContextVariant onNot(ContextVariant variant) {
  return ContextVariant(
    'not(${variant.name})',
    when: (BuildContext context) => !variant.when(context),
  );
}
