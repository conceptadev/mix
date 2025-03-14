import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../type_registry.dart';
import '../utils/annotation_utils.dart';
import '../utils/constructor_utils.dart';
import '../utils/dart_type_utils.dart';
import '../utils/extensions.dart';

/// Represents metadata about a field or parameter for code generation.
///
/// This class encapsulates all information about a field needed for code
/// generation, including its type, nullability, annotations, and relationships
/// to other types (like DTO mappings).
class FieldMetadata {
  /// The name of the field
  final String name;

  /// The Dart type of the field
  final DartType dartType;

  /// The annotation associated with this field
  final MixableField annotation;

  /// Documentation comment for the field, if any
  final String? documentationComment;

  /// Whether the field is marked as deprecated
  final bool hasDeprecated;

  /// Whether the field is nullable
  final bool nullable;

  /// Whether this is a super parameter
  final bool isSuper;

  /// Whether this is a positional parameter
  final bool isPositional;

  /// Whether this parameter is required (named or positional)
  final bool isRequired;

  /// The type registry to use for type resolution
  final TypeRegistry typeRegistry;

  /// Creates a new [FieldMetadata] instance
  FieldMetadata({
    required this.name,
    required this.dartType,
    required this.annotation,
    this.documentationComment,
    required this.hasDeprecated,
    required this.nullable,
    this.isSuper = false,
    this.isPositional = false,
    this.isRequired = false,
    TypeRegistry? typeRegistry,
  }) : typeRegistry = typeRegistry ?? TypeRegistry.instance;

  /// Creates a [FieldMetadata] from a class field
  factory FieldMetadata.fromField(
    FieldElement element, {
    TypeRegistry? typeRegistry,
  }) {
    return FieldMetadata(
      name: element.name,
      dartType: element.type,
      annotation: readMixableField(element),
      documentationComment: element.documentationComment,
      hasDeprecated: element.hasDeprecated,
      nullable: element.type.nullabilitySuffix == NullabilitySuffix.question,
      typeRegistry: typeRegistry ?? TypeRegistry.instance,
    );
  }

  /// Creates a [FieldMetadata] from a constructor parameter
  factory FieldMetadata.fromParameter(
    ParameterElement parameter, {
    TypeRegistry? typeRegistry,
  }) {
    final existingFieldInfo = _getFieldFromParameter(parameter);

    final isNullable =
        parameter.type.nullabilitySuffix == NullabilitySuffix.question;

    return FieldMetadata(
      name: parameter.name,
      dartType: parameter.type,
      annotation: existingFieldInfo?.annotation ?? const MixableField(),
      documentationComment: existingFieldInfo?.documentationComment,
      hasDeprecated:
          existingFieldInfo?.hasDeprecated ?? parameter.hasDeprecated,
      nullable: existingFieldInfo?.nullable ?? isNullable,
      isSuper: parameter.isSuperFormal,
      isPositional: parameter.isPositional,
      isRequired: parameter.isRequiredNamed || parameter.isRequiredPositional,
      typeRegistry: typeRegistry ?? TypeRegistry.instance,
    );
  }

  /// Extracts field metadata from a class
  static List<FieldMetadata> extractFromClass(
    ClassElement element, {
    TypeRegistry? typeRegistry,
  }) {
    final targetConstructor = findTargetConstructor(element);

    return targetConstructor.parameters
        .map((param) => FieldMetadata.fromParameter(
              param,
              typeRegistry: typeRegistry,
            ))
        .toList();
  }

  /// Gets the field type as a string (without nullability marker)
  String get type => dartType.getDisplayString(withNullability: false);

  /// Gets the field type with nullability marker
  String get typeWithNullability => '$type${nullable ? '?' : ''}';

  /// Checks if the field type is dynamic
  bool get isDynamic => dartType is DynamicType;

  /// Checks if the field type is a List
  bool get isListType => dartType.isList;

  bool get isDtoListType =>
      isListType && TypeUtils.isDto(dartType.firstTypeArgument!);

  /// Checks if the field type is a Map
  bool get isMapType => dartType.isMap;

  /// Checks if the field type is a Set
  bool get isSetType => dartType.isSet;

  /// Gets the representation type for this field
  TypeReference? get representationType {
    // Check for manually specified DTO in the annotation
    if (annotation.dto != null && annotation.dto!.typeAsString != null) {
      return TypeReference(annotation.dto!.typeAsString!);
    }

    // Otherwise, use the registry
    return typeRegistry.getRepresentationForType(dartType);
  }

  bool get isSpec => TypeUtils.isSpec(dartType);

  bool get isDto => TypeUtils.isDto(dartType);

  bool get isSpecAttribute => TypeUtils.isSpecAttribute(dartType);

  /// Gets the utility name for this field
  String get utilityName {
    // Check for manually specified utility in the annotation
    final utilities = annotation.utilities;
    if (utilities != null && utilities.isNotEmpty) {
      final firstUtility = utilities.first;
      if (firstUtility.typeAsString != null) {
        return typeRegistry
            .getUtilityNameFromTypeName(firstUtility.typeAsString!);
      }

      if (firstUtility.alias != null) {
        return firstUtility.alias!;
      }
    }

    // Otherwise use the type registry
    return typeRegistry.getUtilityForType(dartType)?.name ?? '';
  }

  /// Checks if this field has a representation (DTO or Attribute)
  bool get hasRepresentation => representationType != null;

  bool get hasDto => hasRepresentation;

  /// Gets the internal reference for this field
  String get asInternalRef => '_\$this.$name';

  /// Creates a list of utility properties specified in the annotation
  List<UtilityProperty> get utilityProperties {
    final result = <UtilityProperty>[];

    final utilities = annotation.utilities;
    if (utilities == null || utilities.isEmpty) {
      return [
        UtilityProperty(name: name, path: name, utilityName: utilityName),
      ];
    }

    for (final util in utilities) {
      final aliasName = util.alias ?? name;
      final utilType = util.typeAsString != null
          ? typeRegistry.getUtilityNameFromTypeName(util.typeAsString!)
          : utilityName;

      result.add(UtilityProperty(
        name: aliasName,
        path: name,
        utilityName: utilType,
      ));

      // Add nested properties
      for (final nested in util.properties) {
        result.add(UtilityProperty(
          name: nested.alias,
          path: '$aliasName.${nested.path}',
          utilityName: utilType,
        ));
      }
    }

    return result;
  }

  /// Gets the field reference based on whether to use internal refs
  String getReference(bool useInternalRef) =>
      useInternalRef ? asInternalRef : name;
}

/// Represents a utility property mapping for code generation
class UtilityProperty {
  final String name;
  final String path;
  final String utilityName;

  const UtilityProperty({
    required this.name,
    required this.path,
    required this.utilityName,
  });
}

/// Attempts to get the corresponding field for a constructor parameter
FieldMetadata? _getFieldFromParameter(ParameterElement parameter) {
  final element = parameter.enclosingElement;
  if (element is! ConstructorElement) return null;

  final classElement = element.enclosingElement as ClassElement;

  // Search up the class hierarchy for the field
  ClassElement? current = classElement;
  while (current != null) {
    final field = current.fields
        .firstWhereOrNull((field) => field.name == parameter.name);

    if (field != null) {
      return FieldMetadata.fromField(field);
    }

    // Move up to the superclass
    current = current.supertype?.element as ClassElement?;
  }

  return null;
}
