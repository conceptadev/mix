import 'package:flutter/widgets.dart';

import 'tokens.dart';

class TextStyleToken extends TextStyle implements MixToken<TextStyle> {
  const TextStyleToken(this.id, this.getter) : super();

  @override
  final String id;

  @override
  final TokenValueGetter<TextStyle> getter;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextStyleToken && other.id == id;
  }

  @override
  TextStyle resolve(BuildContext context) {
    return getter(context);
  }

  @override
  int get hashCode => id.hashCode;
}
