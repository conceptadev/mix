/// A specification class defining the mixable behavior of a generated class.
///
/// Use `MixableSpec` to configure whether the generated class should include
/// `copyWith`, equality, and `lerp` methods, and to specify a prefix for the
/// generated code.
///
/// To use the default configuration, create an instance without any arguments:
///
/// ```dart
/// const mixable = MixableSpec();
/// ```
class MixableSpec {
  /// Whether to generate a `copyWith` method for the class.
  final bool withCopyWith;

  /// Whether to generate equality methods (`==` and `hashCode`) for the class.
  final bool withEquality;

  /// Whether to generate a `lerp` method for the class.
  final bool withLerp;

  /// Whether to skip generating utility methods (`copyWith`, equality, `lerp`).
  final bool skipUtility;

  /// The prefix to add to the generated code.
  final String prefix;

  /// Creates a `MixableSpec` with the given configuration.
  const MixableSpec({
    this.withCopyWith = true,
    this.withEquality = true,
    this.withLerp = true,
    this.skipUtility = false,
    this.prefix = '',
  });
}

/// Annotation of `MixableDto` with the specified options.
///
/// Indicates the generator to generate code for this class.
///
/// The [mergeLists] parameter determines whether to merge lists based on
/// their position when mixing list properties. It defaults to `true`.
///
/// The [generateValueExtension] parameter specifies whether to generate
/// value extensions for the DTO. It defaults to `true`.
///
/// The [generateUtility] parameter specifies whether to generate a utility
/// class for the DTO. It defaults to `true`.
///
/// If the annotated class contains a merge method, it will not be generated
class MixableDto {
  /// If true it will merge the items in the list in its position
  /// if false list items will just be added to the list
  final bool mergeLists;

  /// Generates of ValueExt on Ext
  final bool generateValueExtension;

  /// Generate generation of DtoUtility
  final bool generateUtility;

  const MixableDto({
    this.mergeLists = true,
    this.generateValueExtension = true,
    this.generateUtility = true,
  });
}

/// An annotation class used to specify a mixable property for code generation.
///
/// The `MixableProperty` annotation is used to mark a property as mixable
/// during code generation. It allows specifying an associated `MixableFieldDto`
/// and a list of `MixableUtility` instances that provide additional options for
/// code generation.
///
/// Example usage:
/// ```dart
/// @MixableProperty(
///   dto: MixableFieldDto(type: BoxConstraintsDto),
///   utilities: [
///     MixableUtility(
///       properties: [
///         (path: 'minWidth', alias: 'minWidth'),
///         (path: 'maxWidth', alias: 'maxWidth'),
///       ],
///     ),
///   ],
/// )
/// final BoxConstraints? constraints;
/// ```
class MixableProperty {
  /// The associated `MixableFieldDto` for this property.
  ///
  /// This property represents the data transfer object (DTO) associated with
  /// the mixable property. It provides options for code generation, such as
  /// specifying the type of the generated field.
  final MixableFieldDto? dto;

  /// The list of `MixableUtility` instances associated with this property.
  ///
  /// This property represents the utilities that provide additional options for
  /// code generation. Each utility can specify a set of properties with their
  /// corresponding paths and aliases.
  final List<MixableUtility>? utilities;

  /// Determines whether the property can be linearly interpolated (lerped).
  ///
  /// If set to `false`, the property will be excluded from the lerp method,
  /// and the generated code will not include this property in the lerp implementation.
  /// If set to `true`, the property will be included in the lerp method.
  ///
  /// This flag affects the behavior of the generated `lerp` method:
  ///
  ///
  /// @override
  /// ExampleSpec lerp(ExampleSpec? other, double t) {
  ///   if (other == null) return _$this;
  ///
  ///   return ExampleSpec(
  ///     // When isLerpable is false:
  ///     nonLerpableParameter: other.nonLerpableParameter,
  ///     // When isLerpable is true:
  ///     lerpableParameter: lerpableParameter.lerp(other.lerpableParameter, t),
  ///   );
  /// }
  ///
  ///
  /// Setting `isLerpable` to `true` is particularly useful for properties
  /// that represent continuous values (e.g., numbers, colors, or sizes)
  /// which can be smoothly interpolated between two states.
  final bool isLerpable;

  /// Creates a new instance of `MixableProperty` with the specified [dto] and
  /// [utilities].
  const MixableProperty({this.dto, this.utilities, this.isLerpable = true});
}

/// An annotation class used to specify a mixable field DTO for code generation.
///
/// The `MixableFieldDto` annotation is used to provide options for generating
/// a mixable field. It allows specifying the type of the generated field.
class MixableFieldDto {
  /// The type of the generated field.
  ///
  /// This property represents the type that will be used for the generated
  /// field during code generation.
  final Object? type;

  /// Creates a new instance of `MixableFieldDto` with the specified [type].
  const MixableFieldDto({this.type});

  /// Returns the string representation of the type.
  ///
  /// If the type is a `String`, it is returned as is. Otherwise, the
  /// `toString()` method is called on the type.
  String? get typeAsString {
    return type is String ? type as String : type?.toString();
  }
}

/// A typedef representing a utility property for code generation.
///
/// The `MixableUtilityProps` typedef defines a utility property with a [path]
/// and an [alias]. It is used to specify the mapping between a property path
/// and its corresponding alias during code generation.
typedef MixableUtilityProps = ({String path, String alias});

/// An annotation class used to specify a mixable utility for code generation.
///
/// The `MixableUtility` annotation is used to provide additional options for
/// code generation. It allows specifying an alias, a type, and a list of
/// `MixableUtilityProps` instances that define the mapping between property
/// paths and their corresponding aliases.
///
/// Example usage:
/// ```dart
///  @MixableProperty(
///    utilities: MixableUtility(
///      type: BoxDecoration,
///      properties: [
///        (path: 'color', alias: 'color'),
///        (path: 'border', alias: 'border'),
///        (path: 'borderRadius', alias: 'borderRadius'),
///      ],
/// );
/// final Decoration? decoration;
/// ```
class MixableUtility {
  /// The alias for this utility.
  ///
  /// This property represents an alternative name or identifier for the
  /// utility during code generation.
  final String? alias;

  /// The type associated with this utility.
  ///
  /// This property represents the type that will be used for the utility
  /// during code generation.
  final Object? type;

  /// The list of `MixableUtilityProps` instances associated with this utility.
  ///
  /// This property represents the utility properties that define the mapping
  /// between property paths and their corresponding aliases during code
  /// generation.
  final List<MixableUtilityProps> properties;

  /// Creates a new instance of `MixableUtility` with the specified [alias],
  /// [type], and [properties].
  const MixableUtility({this.alias, this.type, this.properties = const []});

  /// Returns the string representation of the type.
  ///
  /// If the type is a `String`, it is returned as is. Otherwise, the
  /// `toString()` method is called on the type.
  String? get typeAsString {
    return type is String ? type as String : type?.toString();
  }
}

class MixableClassUtility {
  /// Map you should use to map the field utilities
  final Type? type;
  final bool generateCallMethod;
  const MixableClassUtility({this.type, this.generateCallMethod = true});
}

class MixableEnumUtility {
  /// Map you should use to map the field utilities

  final bool generateCallMethod;
  const MixableEnumUtility({this.generateCallMethod = true});
}

sealed class MixDeprecated {
  const MixDeprecated();
}

class MixDeprecatedRenamed extends MixDeprecated {
  final String updatedName;
  final String version;
  final String message;

  const MixDeprecatedRenamed({
    required this.message,
    required this.version,
    required this.updatedName,
  });
}

class MixableToken {
  const MixableToken();
}

class MixableTokenField {
  final Object? type;

  const MixableTokenField(this.type);
}
