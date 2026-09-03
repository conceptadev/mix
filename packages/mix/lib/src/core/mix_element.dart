// The engine's element types live in package:mix_core, generic over an opaque
// resolution-context type `C`. This file binds them to Flutter's
// [BuildContext] under the original public names, so the mix API is
// unchanged: `Mix<T>` here is `core.Mix<BuildContext, T>`.

import 'package:flutter/widgets.dart';
import 'package:mix_core/mix_core.dart' as core;

export 'package:mix_core/mix_core.dart'
    show Buildable, ContextMergeable, DefaultValue, Mixable;

/// Mixin for types that can be resolved to a value using a [BuildContext].
///
/// Provides the ability to resolve context-dependent values like tokens,
/// responsive properties, or theme-dependent values.
typedef Resolvable<V> = core.Resolvable<BuildContext, V>;

/// Base class for Mix-compatible styling elements that are both mixable and
/// resolvable.
///
/// Combines the abilities to merge with other instances and resolve to
/// concrete values using a [BuildContext]. This is the foundation for all
/// styling elements in Mix.
///
/// An alias rather than a subclass: the engine type is the same type, so
/// values flow between mix and mix_core without casts.
typedef Mix<T> = core.Mix<BuildContext, T>;
