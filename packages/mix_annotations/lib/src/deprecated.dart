/// An annotation class used to specify utility generation for a class.
///
library;

import 'annotations.dart';

/// The `MixableClassUtility` annotation is used to configure utility generation
/// for a class. It allows specifying a type to map field utilities and whether
/// to generate a call method.
@Deprecated('Use MixableUtility instead')
class MixableClassUtility {
  /// Map you should use to map the field utilities
  final Type? type;

  /// Whether to generate a call method for this utility class.
  final bool generateCallMethod;

  /// Creates a new instance of `MixableClassUtility` with the specified options.
  ///
  /// The [type] parameter specifies the type to map field utilities.
  /// The [generateCallMethod] parameter determines whether to generate a call method,
  /// defaulting to `true`.
  const MixableClassUtility({this.type, this.generateCallMethod = true});
}

/// An annotation class used to specify utility generation for an enum.
///
/// The `MixableEnumUtility` annotation is used to configure utility generation
/// for an enum. It allows specifying whether to generate a call method.
@Deprecated('Use MixableUtility instead')
class MixableEnumUtility {
  /// Map you should use to map the field utilities

  /// Whether to generate a call method for this utility enum.
  final bool generateCallMethod;

  /// Creates a new instance of `MixableEnumUtility` with the specified options.
  ///
  /// The [generateCallMethod] parameter determines whether to generate a call method,
  /// defaulting to `true`.
  const MixableEnumUtility({this.generateCallMethod = true});
}

@Deprecated('Use MixableProperty instead')
typedef MixableDto = MixableProperty;

@Deprecated('Use MixableFieldProperty instead')
typedef MixableFieldDto = MixableFieldProperty;
