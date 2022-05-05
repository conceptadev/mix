import 'package:flutter/widgets.dart';

import '../mix_theme.dart';
import 'tokens.dart';

class TextStyleToken extends TextStyle implements MixToken<TextStyle> {
  const TextStyleToken(this.id) : super();

  @override
  final String id;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextStyleToken && other.id == id;
  }

  @override
  TextStyle resolve(BuildContext context) {
    final refValue = MixTheme.of(context).designTokens.tokens[this];
    if (refValue == null) {
      throw Exception('Token $id not found');
    }
    final style = refValue(context);

    return style;
  }

  @override
  int get hashCode => id.hashCode;
}
