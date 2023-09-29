import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../mix.dart';

abstract class MixToken {
  final String name;
  const MixToken(this.name);

  @override
  int get hashCode => runtimeType.hashCode ^ name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MixToken &&
          runtimeType == other.runtimeType &&
          name == other.name;
}

mixin WithReferenceMixin<T> on MixToken {
  // Refernce is negativce for tracking
  // Also reference are passed as double to DTOs

  double get ref => hashCode.toDouble() * -1;
  double call() {
    // Creates a reference from hashcode.
    return ref;
  }
}

typedef TokenReferenceMap<T extends MixToken, V> = Map<T, TokenValueGetter<V?>>;

typedef MixTextStyleTokens = TokenReferenceMap<TextStyleToken, TextStyle>;

typedef TokenValueGetter<T> = T Function(BuildContext);
