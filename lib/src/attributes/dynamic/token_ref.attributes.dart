import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/common/attribute.dart';

class TokenRefAttribute<T extends Mix> extends Attribute {
  TokenRefAttribute(Symbol ref) : _ref = ref;

  final Symbol _ref;

  getReference(BuildContext context) {
    // return context.getRef(_ref);
  }
}
