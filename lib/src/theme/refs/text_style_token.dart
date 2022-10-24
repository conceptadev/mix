import 'package:flutter/widgets.dart';

import 'tokens.dart';

class TextStyleToken extends TextStyle implements MixToken<TextStyle> {
  const TextStyleToken(this.valueGetter) : super();

  @override
  final TokenValueGetter<TextStyle> valueGetter;

  @override
  TextStyle resolve(BuildContext context) {
    return valueGetter(context);
  }
}
