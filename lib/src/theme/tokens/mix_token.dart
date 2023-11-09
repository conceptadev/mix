import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/equality/compare_mixin.dart';
import '../../factory/mix_provider_data.dart';
import 'text_style_ref.dart';

abstract class MixToken {
  final String name;
  const MixToken(this.name);
}

abstract class ResolvableTokenRef<T> extends MixToken {
  const ResolvableTokenRef(super.name);

  T resolve(MixData mix);
}

abstract class TokenRef<T> extends MixToken with Comparable {
  const TokenRef(super.name);

  T get ref;

  T call() => ref;

  @override
  get props => [name];
}

typedef MixTokenMap<T extends MixToken, V> = Map<T, TokenValueGetter<V?>>;

typedef MixTextStyleTokens = MixTokenMap<TextStyleRef, TextStyle>;

typedef TokenValueGetter<T> = T Function(BuildContext context);
