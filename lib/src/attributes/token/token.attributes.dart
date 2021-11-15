import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';

class TokenRefAttribute<T extends Attribute> extends Attribute {
  TokenRefAttribute(Symbol ref) : _ref = ref;

  final Symbol _ref;

  Mix<T> getToken(BuildContext context) {
    final theme = context.mixData();
    final ref = theme.getToken<T>(_ref);
    if (ref == null) throw Exception('TokenRefAttribute: $ref not found');
    return ref;
  }
}
