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
@Deprecated('Use Mixable instead')
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

class Mixable {
  final int generateHelpers;
  const Mixable({this.generateHelpers = GenerateHelpers.all});
}

/// An annotation class used to mark a constructor for code generation.
///
/// The `MixableConstructor` annotation is used to indicate that a constructor
/// should be included in the generated code. This allows for specific constructors
/// to be recognized by the code generator.
class MixableConstructor {
  /// Creates a new instance of `MixableConstructor`.
  ///
  /// Use this annotation on constructors that should be processed by the code generator.
  const MixableConstructor();
}

/// An annotation class used to mark a utility class for code generation.
///
/// The `MixableUtility` annotation is used to indicate that a class should be
/// treated as a utility class during code generation. Utility classes typically
/// provide helper methods and functionality that can be used by the generated code.
class MixableUtility {
  final int generateHelpers;

  /// Type will be used to create constructors for the same API as the reference type
  final Type? referenceType;

  /// Creates a new instance of `MixableUtility`.
  ///
  /// Use this annotation on classes that should be treated as utility classes
  /// by the code generator.
  const MixableUtility({
    this.generateHelpers = GenerateHelpers.all,
    this.referenceType,
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
@Deprecated('Use Mixable instead')
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
/// The `MixableField` annotation is used to mark a property as mixable
/// during code generation. It allows specifying an associated `MixableFieldDto`
/// and a list of `MixableFieldUtility` instances that provide additional options for
/// code generation.
///
/// Example usage:
/// ```dart
/// @MixableField(
///   dto: MixableFieldDto(type: BoxConstraintsDto),
///   utilities: [
///     MixableFieldUtility(
///       properties: [
///         (path: 'minWidth', alias: 'minWidth'),
///         (path: 'maxWidth', alias: 'maxWidth'),
///       ],
///     ),
///   ],
/// )
/// final BoxConstraints? constraints;
/// ```
class MixableField {
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
  final List<MixableFieldUtility>? utilities;

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

  /// Creates a new instance of `MixableField` with the specified options.
  ///
  /// The [dto] parameter specifies the data transfer object associated with this field.
  /// The [utilities] parameter provides a list of utility configurations for this field.
  /// The [isLerpable] parameter determines whether this field can be linearly interpolated,
  /// defaulting to `true`.
  const MixableField({this.dto, this.utilities, this.isLerpable = true});
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
///  @MixableField(
///    utilities: MixableFieldUtility(
///      type: BoxDecoration,
///      properties: [
///        (path: 'color', alias: 'color'),
///        (path: 'border', alias: 'border'),
///        (path: 'borderRadius', alias: 'borderRadius'),
///      ],
/// );
/// final Decoration? decoration;
/// ```
class MixableFieldUtility {
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

  /// Creates a new instance of `MixableFieldUtility` with the specified options.
  ///
  /// The [alias] parameter provides an alternative name for this utility.
  /// The [type] parameter specifies the type associated with this utility.
  /// The [properties] parameter defines the mapping between property paths and aliases,
  /// defaulting to an empty list.
  const MixableFieldUtility({
    this.alias,
    this.type,
    this.properties = const [],
  });

  /// Returns the string representation of the type.
  ///
  /// If the type is a `String`, it is returned as is. Otherwise, the
  /// `toString()` method is called on the type.
  String? get typeAsString {
    return type is String ? type as String : type?.toString();
  }
}

/// An annotation class used to specify utility generation for a class.
///
/// The `MixableClassUtility` annotation is used to configure utility generation
/// for a class. It allows specifying a type to map field utilities and whether
/// to generate a call method.
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

/// An annotation class used to specify a mixable token for code generation.
///
/// The `MixableToken` annotation is used to mark a token for code generation.
/// It allows specifying the type, namespace, and extension generation options.
class MixableToken {
  /// The type of the token.
  final Object type;

  /// The namespace for the token.
  final String? namespace;

  /// Whether to generate a utility extension for this token.
  final bool utilityExtension;

  /// Whether to generate a context extension for this token.
  final bool contextExtension;

  /// Creates a new instance of `MixableToken` with the specified options.
  ///
  /// The [type] parameter specifies the type of the token.
  /// The [namespace] parameter provides a namespace for the token.
  /// The [utilityExtension] parameter determines whether to generate a utility extension,
  /// defaulting to `true`.
  /// The [contextExtension] parameter determines whether to generate a context extension,
  /// defaulting to `true`.
  const MixableToken(
    this.type, {
    this.namespace,
    this.utilityExtension = true,
    this.contextExtension = true,
  });
}

/// An annotation class used to specify a swatch color token for code generation.
///
/// The `MixableSwatchColorToken` annotation is used to configure a swatch color token
/// for code generation. It allows specifying the scale and default value.
class MixableSwatchColorToken {
  /// The scale of the swatch color.
  final int scale;

  /// The default value of the swatch color.
  final int defaultValue;

  /// Creates a new instance of `MixableSwatchColorToken` with the specified options.
  ///
  /// The [scale] parameter specifies the scale of the swatch color, defaulting to 3.
  /// The [defaultValue] parameter specifies the default value, defaulting to 1.
  const MixableSwatchColorToken({this.scale = 3, this.defaultValue = 1});
}

/// Collection of constants to indicate which methods and extensions to generate for a specific class.
class GenerateSpecHelpers {
  static const copyWithMethod = 1;
  static const equalsMethod = 2;
  static const lerpMethod = 3;
  static const utilityClass = 4;
  static const attributeClass = 5;
  const GenerateSpecHelpers._();
}

class GenerateHelpers {
  static const none = 0;
  // needs to be as high as the highest helpers
  static const all = 0 | 1 | 2 | 3 | 4 | 5;

  const GenerateHelpers._();
}

class GenerateDtoHelpers {
  static const utilityClass = 1;
  static const toDtoExtension = 2;
  const GenerateDtoHelpers._();
}

class GenerateUtilityHelpers {
  static const callMethod = 1;
  const GenerateUtilityHelpers._();
}
