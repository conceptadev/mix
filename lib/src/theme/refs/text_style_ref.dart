import 'package:flutter/widgets.dart';

import '../mix_theme.dart';
import 'refs.dart';

class TextStyleRef extends TextStyle implements MixRef<TextStyle> {
  const TextStyleRef(this.id) : super();
  @override
  final String id;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextStyleRef && other.id == id;
  }

  @override
  TextStyle resolve(BuildContext context) {
    final refValue = MixTheme.of(context).contextRef.tokens[this];
    if (refValue == null) {
      throw Exception('Ref $id not found');
    }
    final style = refValue(context);
    return style;
  }

  @override
  int get hashCode => id.hashCode;
}
