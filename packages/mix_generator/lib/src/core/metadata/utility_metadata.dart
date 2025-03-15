import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';

import '../utils/annotation_utils.dart';
import '../utils/constructor_utils.dart';
import 'base_metadata.dart';

/// Metadata for utility classes, extracted from MixableUtility annotations.
class UtilityMetadata extends BaseMetadata {
  /// The enum element if this is an enum utility
  final EnumElement? enumElement;

  /// The value element if this is a class utility
  final ClassElement? valueElement;

  /// The mapping element if this is a class utility with a mapping type
  final ClassElement? mappingElement;

  /// The reference element if this is a class utility with a reference type
  final ClassElement? referenceElement;

  final int generateHelpers;

  UtilityMetadata({
    required super.element,
    required super.name,
    required super.parameters,
    required super.isConst,
    required super.isDiagnosticable,
    required super.constructor,
    required super.isAbstract,
    this.enumElement,
    this.valueElement,
    this.mappingElement,
    this.referenceElement,
    required this.generateHelpers,
  });

  /// Creates a UtilityMetadata from a class element
  factory UtilityMetadata.fromElement(ClassElement element) {
    try {
      // Check if it's an enum utility
      final utilityType = _getUtilityType(element);

      if (utilityType == null) {
        throw InvalidGenerationSourceError(
          'The class must extend MixUtility<Attribute, ValueType>',
          element: element,
        );
      }

      // Check if it's an enum utility
      EnumElement? enumElement;
      if (utilityType.element is EnumElement) {
        enumElement = utilityType.element as EnumElement;
      }

      // It's a class utility
      ClassElement? valueElement;
      if (utilityType.element is ClassElement &&
          utilityType.element is! EnumElement) {
        valueElement = utilityType.element as ClassElement;
      }

      return UtilityMetadata(
        // Utilities don't have fields
        element: element,
        name: element.name,
        parameters: [],
        isConst: element.unnamedConstructor?.isConst ?? false,
        isDiagnosticable: false, // Utilities don't need diagnostics
        constructor: findTargetConstructor(element),
        isAbstract: element.isAbstract,
        enumElement: enumElement,
        valueElement: valueElement,
        mappingElement: null, // No mapping element for fromElement
        referenceElement: null, // No reference element for fromElement
        generateHelpers: readMixableUtilityHelpers(element),
      );
    } catch (e) {
      if (e is InvalidGenerationSourceError) {
        rethrow;
      }
      throw InvalidGenerationSourceError(
        'Error creating utility metadata: $e',
        element: element,
      );
    }
  }

  /// Creates a UtilityMetadata from a class element and its annotation
  static UtilityMetadata fromAnnotation(
    ClassElement element,
    ConstantReader annotation,
  ) {
    try {
      // First, try to get the utility type from the class
      final utilityType = _getUtilityType(element);

      if (utilityType == null) {
        throw InvalidGenerationSourceError(
          'The class must extend MixUtility<Attribute, ValueType>',
          element: element,
        );
      }

      // Check if it's an enum utility
      EnumElement? enumElement;
      if (utilityType.element is EnumElement) {
        enumElement = utilityType.element as EnumElement;
      }

      // It's a class utility
      ClassElement? valueElement;
      if (utilityType.element is ClassElement &&
          utilityType.element is! EnumElement) {
        valueElement = utilityType.element as ClassElement;
      }

      // Check if there's a mapping type specified in the annotation
      ClassElement? mappingElement;

      // Only try to get mapping type from MixableFieldUtility annotation
      if (!hasMixableUtility(element)) {
        final mixableUtility = readMixableFieldUtility(element);
        final mappingType = mixableUtility?.type;

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

      // Check if there's a reference type specified in the annotation
      ClassElement? referenceElement;
      final referenceTypeValue = annotation.peek('referenceType');
      if (referenceTypeValue != null && !referenceTypeValue.isNull) {
        final referenceTypeElement = referenceTypeValue.typeValue.element;
        if (referenceTypeElement is ClassElement) {
          referenceElement = referenceTypeElement;
        }
      }

      return UtilityMetadata(
        // Utilities don't have fields
        element: element,
        name: element.name,
        parameters: [],
        isConst: element.unnamedConstructor?.isConst ?? false,
        isDiagnosticable: false, // Utilities don't need diagnostics
        constructor: findTargetConstructor(element),
        isAbstract: element.isAbstract,
        enumElement: enumElement,
        valueElement: valueElement,
        mappingElement: mappingElement,
        referenceElement: referenceElement,
        generateHelpers: readMixableUtilityHelpers(element),
      );
    } catch (e) {
      if (e is InvalidGenerationSourceError) {
        rethrow;
      }
      throw InvalidGenerationSourceError(
        'Error creating utility metadata: $e',
        element: element,
      );
    }
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
