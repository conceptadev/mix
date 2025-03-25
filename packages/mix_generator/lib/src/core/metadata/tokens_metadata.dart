import 'package:analyzer/dart/element/element.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

import '../utils/constructor_utils.dart';
import '../utils/dart_type_utils.dart';
import 'base_metadata.dart';
import 'field_metadata.dart';

/// Metadata for token classes, extracted from MixableToken annotations.
class TokensMetadata extends BaseMetadata {
  /// The type of token
  final Object type;

  /// The namespace for the token
  final String? namespace;

  /// Whether to generate utility extensions
  final bool utilityExtension;

  /// Whether to generate context extensions
  final bool contextExtension;

  /// Predefined token settings for common types
  static const _predefinedTokens = {
    'Color': (
      token: 'ColorToken',
      utilities: ['ColorMixUtility'],
      defaultNamespace: 'color',
    ),
    'TextStyle': (
      token: 'TextStyleToken',
      utilities: ['TextStyleMixUtility'],
      defaultNamespace: 'textStyle',
    ),
    'double': (
      token: 'SpaceToken',
      utilities: ['SpacingSideUtility', 'GapUtility'],
      defaultNamespace: 'space',
    ),
    'Radius': (
      token: 'RadiusToken',
      utilities: ['RadiusUtility'],
      defaultNamespace: 'radius',
    ),
  };

  TokensMetadata({
    required super.element,
    required super.name,
    required super.parameters,
    required super.isConst,
    required super.isDiagnosticable,
    required super.constructor,
    required super.isAbstract,
    required this.type,
    required this.namespace,
    required this.utilityExtension,
    required this.contextExtension,
  });

  /// Creates a TokensMetadata from a class element and its annotation
  static TokensMetadata fromAnnotation(
    ClassElement element,
    MixableToken annotation,
  ) {
    final constructor = findTargetConstructor(element);
    final parameters = ParameterMetadata.extractFromConstructor(element);

    return TokensMetadata(
      element: element,
      name: element.name,
      parameters: parameters,
      isConst: element.constructors.any((c) => c.isConst),
      isDiagnosticable: element.allSupertypes.any(
        (t) => t.element.name == 'Diagnosticable',
      ),
      constructor: constructor,
      isAbstract: element.isAbstract,
      type: annotation.type,
      namespace: annotation.namespace,
      utilityExtension: annotation.utilityExtension,
      contextExtension: annotation.contextExtension,
    );
  }

  /// Get the token settings for this type
  ///
  /// Returns the predefined token settings for the type or throws
  /// an [InvalidGenerationSourceError] if the type is not supported.
  ({String token, List<String> utilities, String defaultNamespace})
      get tokenSettings {
    final typeStr = type.toString();
    if (!_predefinedTokens.containsKey(typeStr)) {
      throw InvalidGenerationSourceError(
        'Unsupported token type: $typeStr. Supported types are: ${_predefinedTokens.keys.join(', ')}',
        element: element,
      );
    }

    return _predefinedTokens[typeStr]!;
  }

  /// Maps fields to their SwatchColorToken annotations, if any
  ///
  /// Creates a map of field elements to their MixableSwatchColorToken annotation,
  /// or null if the field doesn't have this annotation.
  Map<FieldElement, MixableSwatchColorToken?> get swatchColorTokens {
    final result = <FieldElement, MixableSwatchColorToken?>{};

    // Use collectClassMembers for consistency with other generators
    final members = collectClassMembers(element);

    for (final field in members.fields) {
      // Skip private fields
      if (field.isPrivate) continue;

      // Skip static fields
      if (field.isStatic) continue;

      result[field] = getMixableSwatchColorToken(field);
    }

    return result;
  }

  /// Gets the fields that should be included in token generation
  List<FieldElement> get tokenFields {
    // Use collectClassMembers for consistency with other generators
    final members = collectClassMembers(element);

    return members.fields
        .where((field) => !field.isPrivate && !field.isStatic)
        .toList();
  }

  /// Validates this metadata for token generation
  ///
  /// Ensures the token class has at least one field, a constructor,
  /// and that all fields match the declared token type.
  void validate() {
    if (tokenFields.isEmpty) {
      throw InvalidGenerationSourceError(
        'The class must have at least one field.',
        element: element,
      );
    }

    if (element.constructors.isEmpty) {
      throw InvalidGenerationSourceError(
        'The class must have at least one constructor.',
        element: element,
      );
    }

    final typeStr = type.toString();
    for (final field in tokenFields) {
      if (!field.type.toString().contains(typeStr)) {
        throw InvalidGenerationSourceError(
          'The field ${field.name} must have the same type as the class annotation ($typeStr).',
          element: field,
        );
      }
    }
  }
}

/// Gets the MixableSwatchColorToken annotation from a field element
MixableSwatchColorToken? getMixableSwatchColorToken(FieldElement element) {
  const tokenChecker = TypeChecker.fromRuntime(MixableSwatchColorToken);
  final annotation = tokenChecker.firstAnnotationOfExact(element);
  if (annotation == null) return null;

  final reader = ConstantReader(annotation);
  final scale = reader.read('scale').intValue;
  final defaultValue = reader.read('defaultValue').intValue;

  return MixableSwatchColorToken(scale: scale, defaultValue: defaultValue);
}
