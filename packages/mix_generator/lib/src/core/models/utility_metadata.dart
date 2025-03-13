import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';

import '../utils/annotation_utils.dart';
import '../utils/constructor_utils.dart';
import '../utils/extensions.dart';
import 'base_metadata.dart';

/// Metadata for utility classes, extracted from MixableUtility annotations.
class UtilityMetadata extends BaseMetadata {
  /// The enum element if this is an enum utility
  final EnumElement? enumElement;

  /// The value element if this is a class utility
  final ClassElement? valueElement;

  /// The mapping element if this is a class utility with a mapping type
  final ClassElement? mappingElement;

  final int generateHelpers;

  UtilityMetadata({
    required super.element,
    required super.name,
    required super.fields,
    required super.isConst,
    required super.isDiagnosticable,
    required super.constructor,
    required super.isAbstract,
    this.enumElement,
    this.valueElement,
    this.mappingElement,
    required this.generateHelpers,
  });

  /// Creates a UtilityMetadata from a class element and its annotation
  static UtilityMetadata fromAnnotation(
    ClassElement element,
    ConstantReader annotation,
  ) {
    // Check for MixableUtility annotation and get the generateHelpers value

    // First, try to get the utility type from the class
    final utilityType = _getUtilityType(element);

    if (utilityType == null) {
      throw InvalidGenerationSourceError(
        'The class must extend MixUtility<Attribute, ValueType>',
        element: element,
      );
    }

    // Check if it's an enum utility
    if (utilityType.isEnum) {
      final enumElement = utilityType.element as EnumElement;

      return UtilityMetadata(
        element: element,
        name: element.name,
        fields: [], // Utilities don't have fields
        isConst: element.unnamedConstructor?.isConst ?? false,
        isDiagnosticable: false, // Utilities don't need diagnostics
        constructor: findTargetConstructor(element),
        isAbstract: element.isAbstract,
        enumElement: enumElement,
        generateHelpers: readMixableUtilityHelpers(element),
      );
    }

    // It's a class utility
    final valueElement = utilityType.element as ClassElement;

    // Check if there's a mapping type specified in the annotation
    ClassElement? mappingElement;

    // Only try to get mapping type from MixableFieldUtility annotation
    if (!hasMixableUtility(element)) {
      final mixableUtility = readMixableFieldUtility(element);
      final mappingType = mixableUtility.type;

      if (mappingType != null) {
        final mappingTypeElement = annotation.read('type').typeValue.element;
        if (mappingTypeElement is! ClassElement) {
          throw InvalidGenerationSourceError(
            'The mapping type must be a class',
            element: element,
          );
        }
        mappingElement = mappingTypeElement;
      }
    }

    return UtilityMetadata(
      element: element,
      name: element.name,
      fields: [], // Utilities don't have fields
      isConst: element.unnamedConstructor?.isConst ?? false,
      isDiagnosticable: false, // Utilities don't need diagnostics
      constructor: findTargetConstructor(element),
      isAbstract: element.isAbstract,
      valueElement: valueElement,
      mappingElement: mappingElement,
      generateHelpers: readMixableUtilityHelpers(element),
    );
  }

  /// Checks if this is an enum utility
  bool get isEnumUtility => enumElement != null;

  /// Gets the enum values as strings if this is an enum utility
  List<String> get enumValues {
    if (!isEnumUtility || enumElement == null) {
      return [];
    }

    return enumElement!.fields
        .where((field) => field.isEnumConstant)
        .map((field) => field.name)
        .toList();
  }

  /// Gets the effective mapping element (either mappingElement or valueElement)
  ClassElement? get effectiveMappingElement {
    if (!isEnumUtility && valueElement != null) {
      return mappingElement ?? valueElement;
    }

    return null;
  }
}

/// Gets the utility type from a class that extends MixUtility
DartType? _getUtilityType(ClassElement element) {
  const utilityTypes = ['MixUtility'];

  for (var supertype in element.allSupertypes) {
    if (utilityTypes.contains(supertype.element.name) &&
        supertype.typeArguments.length == 2) {
      return supertype.typeArguments[1];
    }
  }

  return null;
}
