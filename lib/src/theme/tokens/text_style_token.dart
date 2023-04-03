import 'package:flutter/widgets.dart';

import 'mix_token.dart';

class TextStyleToken extends TextStyle implements MixToken {
  const TextStyleToken(this.name);

  @override
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextStyleToken &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode;
}
