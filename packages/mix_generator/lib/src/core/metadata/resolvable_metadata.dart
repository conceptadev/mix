import 'package:analyzer/dart/element/element.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../utils/constructor_utils.dart';
import '../utils/dart_type_utils.dart';
import 'base_metadata.dart';
import 'field_metadata.dart';

/// Metadata for DTO classes, extracted from MixableDto annotations.
class ResolvableMetadata extends BaseMetadata {
  /// Whether to merge lists when merging DTOs
  final bool mergeLists;

  /// Whether to generate an extension for converting the value type to DTO
  final bool generateValueExtension;

  /// Whether to generate a utility class
  final bool generateUtility;

  /// The resolved value type (from Dto<T>)
  final ClassElement resolvedElement;

  /// The resolved field accessors
  final List<FieldMetadata> resolvableFields;

  ResolvableMetadata({
    required super.element,
    required super.name,
    required super.parameters,
    required super.isConst,
    required super.isDiagnosticable,
    required super.constructor,
    required super.isAbstract,
    required this.mergeLists,
    required this.generateValueExtension,
    required this.generateUtility,
    required this.resolvedElement,
    required this.resolvableFields,
  });

  /// Creates a ResolvableMetadata from a class element and its annotation
  static ResolvableMetadata fromAnnotation(
    ClassElement element,
    MixableDto annotation,
  ) {
    final constructor = findTargetConstructor(element);
    final parameters = ParameterMetadata.extractFromConstructor(element);
    final resolvedElement = _getResolvedType(element);
    final resolvedFieldsAndAccessors = collectClassMembers(resolvedElement);
    final List<FieldMetadata> resolvedFields = [];

    for (final param in parameters) {
      // Check for field first
      final field = resolvedFieldsAndAccessors.getField(param.name);
      if (field != null) {
        resolvedFields.add(FieldMetadata.fromField(field));
        continue; // Skip accessor check if field exists
      }

      // Check for accessor if no field was found
      final accessor = resolvedFieldsAndAccessors.getAccessor(param.name);
      if (accessor != null) {
        resolvedFields.add(FieldMetadata.fromPropertyAccessor(accessor));
      }
    }

    return ResolvableMetadata(
      element: element,
      name: element.name,
      parameters: parameters,
      isConst: element.unnamedConstructor?.isConst ?? false,
      isDiagnosticable: element.allSupertypes.any(
        (e) => e.element.name == 'Diagnosticable',
      ),
      constructor: constructor,
      isAbstract: element.isAbstract,
      mergeLists: annotation.mergeLists,
      generateValueExtension: annotation.generateValueExtension,
      generateUtility: annotation.generateUtility,
      resolvedElement: resolvedElement,
      resolvableFields: resolvedFields,
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
