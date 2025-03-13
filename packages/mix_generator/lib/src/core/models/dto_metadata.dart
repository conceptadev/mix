import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import '../utils/annotation_utils.dart';
import '../utils/constructor_utils.dart';
import '../utils/dart_type_utils.dart';
import 'base_metadata.dart';
import 'field_metadata.dart';

/// Metadata for DTO classes, extracted from MixableDto annotations.
class DtoMetadata extends BaseMetadata {
  /// Whether to merge lists when merging DTOs
  final bool mergeLists;

  /// Whether to generate an extension for converting the value type to DTO
  final bool generateValueExtension;

  /// Whether to generate a utility class
  final bool generateUtility;

  /// The resolved value type (from Dto<T>)
  final ClassElement resolvedType;

  DtoMetadata({
    required super.element,
    required super.name,
    required super.fields,
    required super.isConst,
    required super.isDiagnosticable,
    required super.constructor,
    required super.isAbstract,
    required this.mergeLists,
    required this.generateValueExtension,
    required this.generateUtility,
    required this.resolvedType,
  });

  /// Creates a DtoMetadata from a class element and its annotation
  static DtoMetadata fromAnnotation(
    ClassElement element,
    ConstantReader annotation,
  ) {
    final mixableDto = readMixableDto(element);
    final constructor = findTargetConstructor(element);
    final fields = FieldMetadata.extractFromClass(element);

    return DtoMetadata(
      element: element,
      name: element.name,
      fields: fields,
      isConst: element.unnamedConstructor?.isConst ?? false,
      isDiagnosticable: element.allSupertypes.any(
        (e) => e.element.name == 'Diagnosticable',
      ),
      constructor: constructor,
      isAbstract: element.isAbstract,
      mergeLists: mixableDto.mergeLists,
      generateValueExtension: mixableDto.generateValueExtension,
      generateUtility: mixableDto.generateUtility,
      resolvedType: _getResolvedType(element),
    );
  }

  /// Extracts the value type from a Dto<Value> class
  static ClassElement _getResolvedType(ClassElement element) {
    final resolvedType = TypeUtils.extractDtoTypeArgument(element);

    if (resolvedType == null) {
      throw Exception('No resolved type found for $element');
    }

    return resolvedType.element as ClassElement;
  }
}
