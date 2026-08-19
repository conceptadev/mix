// Ported from package:mix `src/core/converter_registry.dart`, genericized
// over the resolution context type [C].
//
// Changes from the mix version:
// - One registry instance per context type via [MixConverterRegistry.instanceOf],
//   replacing the single global (each platform registers converters for its
//   own value types).
// - Lazy initialization is a settable [MixConverterRegistry.initializer]
//   instead of the hardcoded `initializeMixConverters()` call, so core does
//   not depend on any platform's converter set.
// - The unused `_conversionCache` field was dropped.

import 'package:meta/meta.dart';

import 'mix_element.dart';

/// Provides context for type conversion operations.
///
/// This interface allows converters to perform nested conversions
/// without directly depending on the registry implementation,
/// avoiding circular dependencies and enabling lazy resolution.
abstract interface class ConversionContext<C> {
  /// Attempts to convert a value to its [Mix] representation.
  ///
  /// Returns the converted [Mix] value if a converter is registered,
  /// or `null` if no converter is found for type [T].
  Mix<C, T>? tryConvert<T>(T value);

  /// Checks whether a converter is registered for type [T].
  ///
  /// Returns `true` if a converter exists, `false` otherwise.
  bool canConvert<T>();
}

/// Defines how to convert values to their [Mix] representations.
///
/// Implement this interface to create custom converters for your types.
/// Converters receive a [ConversionContext] to enable nested conversions.
abstract interface class MixConverter<C, T> {
  /// Converts a value to its [Mix] representation.
  ///
  /// Use [context] to convert nested values when needed.
  /// This enables complex conversions without circular dependencies.
  Mix<C, T> toMix(T value, ConversionContext<C> context);
}

/// A registry of type converters, one instance per context type [C].
///
/// The registry manages converters that transform platform value types into
/// their [Mix] equivalents. It implements [ConversionContext] to provide
/// lazy resolution and avoid circular dependencies between converters.
class MixConverterRegistry<C> implements ConversionContext<C> {
  static final Map<Type, Object> _instances = {};

  /// The registry instance for context type [C].
  ///
  /// Platforms access this to register their converters, and the engine
  /// uses it during property resolution.
  static MixConverterRegistry<C> instanceOf<C>() {
    return _instances.putIfAbsent(C, MixConverterRegistry<C>._)
        as MixConverterRegistry<C>;
  }

  final Map<Type, MixConverter<C, Object?>> _converters = {};
  bool _initialized = false;

  /// Called once before the first conversion, letting a platform register
  /// its converter set lazily (mirrors mix's `initializeMixConverters`).
  void Function(MixConverterRegistry<C> registry)? initializer;

  MixConverterRegistry._();

  void _ensureInitialized() {
    if (!_initialized) {
      _initialized = true;
      initializer?.call(this);
    }
  }

  /// Registers a converter for type [T].
  ///
  /// The converter will be used when [tryConvert] or [convert] is called
  /// with a value of type [T].
  void register<T>(MixConverter<C, T> converter) {
    _converters[T] = converter;
  }

  /// Returns the converter registered for type [T].
  ///
  /// Returns `null` if no converter is registered.
  MixConverter<C, T>? get<T>() {
    return _converters[T] as MixConverter<C, T>?;
  }

  /// Converts a value to its [Mix] representation.
  ///
  /// Throws [StateError] if no converter is registered for type [T].
  /// Use [tryConvert] for a non-throwing alternative.
  Mix<C, T> convert<T>(T value) {
    final result = tryConvert<T>(value);
    if (result == null) {
      throw StateError('No converter registered for type $T');
    }

    return result;
  }

  /// Removes all registered converters.
  ///
  /// This method is only available in tests.
  @visibleForTesting
  void clear() {
    _converters.clear();
    _initialized = false;
  }

  @override
  bool canConvert<T>() {
    return _converters.containsKey(T);
  }

  @override
  Mix<C, T>? tryConvert<T>(T value) {
    _ensureInitialized();
    final converter = get<T>();
    if (converter != null) {
      // Use this registry as the conversion context
      return converter.toMix(value, this);
    }

    return null;
  }
}

// Helper implementations

/// A converter that delegates to a function.
///
/// Use this to adapt existing conversion functions to the [MixConverter] interface.
class FunctionMixConverter<C, T> implements MixConverter<C, T> {
  final Mix<C, T> Function(T value, ConversionContext<C> context) _toMix;

  const FunctionMixConverter(this._toMix);

  @override
  Mix<C, T> toMix(T value, ConversionContext<C> context) =>
      _toMix(value, context);
}

/// A converter for types that don't require nested conversions.
///
/// Use this when your conversion logic doesn't need to convert nested values.
/// The [ConversionContext] parameter is ignored.
class SimpleMixConverter<C, T> implements MixConverter<C, T> {
  final Mix<C, T> Function(T value) _toMix;

  const SimpleMixConverter(this._toMix);

  @override
  Mix<C, T> toMix(T value, ConversionContext<C> context) => _toMix(value);
}
