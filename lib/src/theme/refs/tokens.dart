import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class MixToken<T> {
  const MixToken(this.valueGetter);

  final TokenValueGetter<T> valueGetter;
  T resolve(BuildContext context);
}

typedef TokenMap<T extends MixToken<V>, V> = Map<T, TokenValueGetter<V>>;

typedef TokenValueGetter<T> = T Function(BuildContext);
