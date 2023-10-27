import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import 'text_style_ref.dart';

abstract class TokenRef<T> {
  final String name;
  const TokenRef(this.name);

  T resolve(MixData mix);
}

mixin WithReferenceMixin<T> on TokenRef {
  // Refernce is negativce for tracking
  // Also reference are passed as double to DTOs

  double get ref => hashCode.toDouble() * -1;
  double call() {
    // Creates a reference from hashcode.
    return ref;
  }
}

typedef TokenReferenceMap<T extends TokenRef, V> = Map<T, TokenValueGetter<V?>>;

typedef MixTextStyleTokens = TokenReferenceMap<TextStyleRef, TextStyle>;

typedef TokenValueGetter<T> = T Function(BuildContext context);
