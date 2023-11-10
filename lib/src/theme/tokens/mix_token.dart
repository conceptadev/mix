import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';

abstract class MixToken<T> {
  final String name;
  const MixToken(this.name);

  T resolve(MixData mix);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    if (runtimeType != other.runtimeType) return false;

    return other is MixToken && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

mixin TokenValueRef<T> on MixToken<T> {
  T get ref;

  T call() => ref;
}

typedef DesignTokenMap<T extends MixToken<V>, V>
    = Map<T, V Function(BuildContext context)>;
