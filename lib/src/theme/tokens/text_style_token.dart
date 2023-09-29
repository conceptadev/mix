import 'package:flutter/widgets.dart';

import 'mix_token.dart';

class TextStyleToken extends TextStyle implements MixToken {
  @override
  final String name;

  const TextStyleToken(this.name);

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextStyleToken &&
          runtimeType == other.runtimeType &&
          name == other.name;
}
