import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';

class TokenRefAttribute<T extends Attribute> extends Attribute {
  const TokenRefAttribute(this.ref);

  final String ref;

  T getToken(BuildContext context) {
    final theme = context.mixData;
    final value = theme.getToken(ref, context);

    return value as T;
  }
}
