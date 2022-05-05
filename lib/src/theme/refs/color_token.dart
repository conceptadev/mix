import 'package:flutter/widgets.dart';

import '../mix_theme.dart';
import 'tokens.dart';

class ColorToken extends Color implements MixToken<Color> {
  const ColorToken(this.id) : super(0);

  @override
  final String id;

  @override
  Color resolve(BuildContext context) {
    final refValue = MixTheme.of(context).designTokens.tokens[this];
    if (refValue == null) {
      throw Exception('Ref $id not found');
    }
    final color = refValue(context);

    return color;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColorToken && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'ColorToken(id: $id)';
}
