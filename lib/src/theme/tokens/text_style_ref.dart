import 'package:flutter/widgets.dart';

import '../../factory/exports.dart';
import 'mix_token.dart';

class TextStyleRef extends TextStyle implements ResolvableTokenRef<TextStyle> {
  @override
  final String name;

  const TextStyleRef(this.name);

  @override
  TextStyle resolve(MixData mix) {
    return mix.resolver.textStyle(this);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextStyleRef && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
