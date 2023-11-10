import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class MixToken<T> {
  final String name;
  const MixToken(this.name);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    if (runtimeType != other.runtimeType) return false;

    return other is MixToken && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

abstract class ResolvableMixToken<T> extends MixToken<T> {
  final T Function(BuildContext context) _resolver;
  const ResolvableMixToken(super.name, this._resolver);

  T resolve(BuildContext context) => _resolver(context);
}

mixin TokenValueRef<T> on MixToken<T> {
  T get ref;

  T call() => ref;
}

typedef DesignTokenMap<T extends MixToken<V>, V>
    = Map<T, V Function(BuildContext context)>;
