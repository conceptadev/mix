import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import '../utils/annotation_utils.dart';
import '../utils/constructor_utils.dart';
import '../utils/extensions.dart';
import 'base_metadata.dart';

/// Metadata for enum utility classes, extracted from MixableEnumUtility annotations.
class EnumUtilityMetadata extends BaseMetadata {
  /// The enum element that this utility is for
  final EnumElement enumElement;

  /// Whether to generate a call method
  final bool generateCallMethod;

  EnumUtilityMetadata({
    required super.element,
    required super.name,
    required super.fields,
    required super.isConst,
    required super.isDiagnosticable,
    required super.constructor,
    required super.isAbstract,
    required this.enumElement,
    required this.generateCallMethod,
  });

  /// Creates an EnumUtilityMetadata from a class element and its annotation
  static EnumUtilityMetadata fromAnnotation(
    ClassElement element,
    ConstantReader annotation,
  ) {
    final mixableEnumUtility = readMixableEnumUtility(element);
    final enumElement = getEnumTypeFromUtility(element);

    if (enumElement == null) {
      throw InvalidGenerationSourceError(
        'The class must extend MixUtility<Attribute, EnumType>',
        element: element,
      );
    }

    return EnumUtilityMetadata(
      element: element,
      name: element.name,
      fields: [], // Enum utilities don't have fields
      isConst: element.unnamedConstructor?.isConst ?? false,
      isDiagnosticable: false, // Enum utilities don't need diagnostics
      constructor: findTargetConstructor(element), // Use the constructor finder
      isAbstract: element.isAbstract,
      enumElement: enumElement,
      generateCallMethod: mixableEnumUtility.generateCallMethod,
    );
  }

  /// Gets the enum values as strings
  List<String> get enumValues {
    return enumElement.fields
        .where((field) => field.isEnumConstant)
        .map((field) => field.name)
        .toList();
  }
}

/// Gets the enum type from a utility class
EnumElement? getEnumTypeFromUtility(ClassElement element) {
  for (var supertype in element.allSupertypes) {
    if (supertype.element.name == 'MixUtility' &&
        supertype.typeArguments.length == 2) {
      final enumType = supertype.typeArguments[1];
      if (enumType.isEnum) {
        return enumType.element as EnumElement;
      }
    }
  }

  return null;
}
