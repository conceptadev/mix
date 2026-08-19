// The converter registry lives in package:mix_core, generic over an opaque
// resolution-context type `C`; mix uses the `BuildContext`-bound instance.

import 'package:flutter/widgets.dart';
import 'package:mix_core/mix_core.dart' as core;

import 'internal/mix_bindings.dart';

/// Provides context for type conversion operations.
typedef ConversionContext = core.ConversionContext<BuildContext>;

/// Defines how to convert values to their Mix representations.
typedef MixConverter<T> = core.MixConverter<BuildContext, T>;

/// A converter that delegates to a function.
typedef FunctionMixConverter<T> = core.FunctionMixConverter<BuildContext, T>;

/// A converter for types that don't require nested conversions.
typedef SimpleMixConverter<T> = core.SimpleMixConverter<BuildContext, T>;

/// Access point for the type converter registry used by mix.
///
/// The registry manages converters that transform Flutter types into their
/// Mix equivalents. Converters are automatically initialized on first use.
abstract final class MixConverterRegistry {
  /// The registry instance for the Flutter (`BuildContext`) platform.
  ///
  /// Access this to register custom converters or perform conversions.
  static core.MixConverterRegistry<BuildContext> get instance {
    ensureMixBindings();

    return core.MixConverterRegistry.instanceOf<BuildContext>();
  }
}
