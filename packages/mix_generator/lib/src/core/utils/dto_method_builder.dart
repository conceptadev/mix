import '../metadata/field_metadata.dart';
import '../type_registry.dart';
import 'helpers.dart';
import 'string_utils.dart';

class DtoMethods {
  const DtoMethods._();

  /// Generates a resolve method implementation
  static String generateResolveMethod({
    required String className,
    required String constructorRef,
    required List<FieldMetadata> fields,
    required bool isConst,
    required String resolvedType,
    required bool withDefaults,
    required bool useInternalRef,
  }) {
    final params = buildParameters(fields, (field) {
      final fieldName = useInternalRef ? field.asInternalRef : field.name;
      // Use the default constant (e.g. $kDefaultValueRef) as in the old implementation
      final fallbackExpression = field.nullable && withDefaults
          ? ' ?? defaultValue.${field.name}'
          : '';

      if (field.isDtoListType) {
        return '$fieldName?.map((e) => e.resolve(mix)).toList()$fallbackExpression';
      }

      if (field.isDto || field.isSpecAttribute) {
        return '$fieldName?.resolve(mix)$fallbackExpression';
      }

      return '$fieldName$fallbackExpression';
    });

    final constModifier = fields.isEmpty && isConst ? 'const ' : '';

    const defaultValueRef = 'defaultValue';

    return '''
  /// Resolves to [$resolvedType] using the provided [MixData].
  /// 
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `$defaultValueRef` for that property.
  ///
  /// ```dart
  /// final ${resolvedType.lowerCaseFirst} = $className(...).resolve(mix);
  /// ```
  @override
  $resolvedType resolve(MixData mix) {
    return $constModifier$resolvedType$constructorRef(
      $params
    );
  }''';
  }

  /// Generates a merge method implementation
  static String generateMergeMethod({
    required String className,
    required List<FieldMetadata> fields,
    required bool isAbstract,
    required bool shouldMergeLists,
    required bool useInternalRef,
  }) {
    print('Generating merge method for $className');
    print('  Fields: ${fields.map((f) => f.name).join(', ')}');

    final mergeStatements = fields.map((field) {
      final fieldName = field.name;
      final fieldNameRef = useInternalRef ? field.asInternalRef : fieldName;
      print(
        '  Processing field: $fieldName (isDto: ${field.isDto}, isSpecAttribute: ${field.isSpecAttribute}, isListType: ${field.isListType})',
      );

      // Handle list fields with proper null-aware spread
      if (field.isListType) {
        print('    Field is a list type');

        return shouldMergeLists
            ? '$fieldName: MixHelpers.mergeList($fieldNameRef, other.$fieldName),'
            : '$fieldName: [...? $fieldNameRef, ...? other.$fieldName],';
      } else if (field.isDto || field.isSpecAttribute) {
        print('    Field is a DTO or SpecAttribute');
        final representationType = field.representationType;
        // Build a default merge statement using the merge() method if available
        final defaultMerge =
            '$fieldName: $fieldNameRef?.merge(other.$fieldName) ?? other.$fieldName,';

        // Extract the element from the representation type (if it exists)
        final representationElement = representationType?.type?.element;
        if (representationElement == null) {
          print('    No representation element found, using default merge');

          return defaultMerge;
        }

        final elementName = representationElement.name ?? '';
        print('    Representation element name: $elementName');

        // Special case for BoxDecorationDto and ShapeDecorationDto
        // They should use DecorationDto.tryToMerge
        if (elementName == 'BoxDecorationDto' ||
            elementName == 'ShapeDecorationDto') {
          print('    Using DecorationDto.tryToMerge for $elementName');

          return '$fieldName: DecorationDto.tryToMerge($fieldNameRef, other.$fieldName),';
        }

        // Check if a custom merge method (e.g., tryToMerge) exists for this element
        final hasCustomMerge = TypeRegistry.instance.hasTryToMerge(elementName);
        print('    Has custom merge (tryToMerge): $hasCustomMerge');

        // Use the custom merge if available; otherwise, fall back to the default merge
        if (hasCustomMerge) {
          print('    Using custom tryToMerge method');

          return '$fieldName: $elementName.tryToMerge($fieldNameRef, other.$fieldName),';
        }
        print('    Using default merge method');

        return defaultMerge;
      }

      // Default: use the value from other if non-null, otherwise fallback to this value
      print('    Using simple merge (other ?? this)');

      return '$fieldName: other.$fieldName ?? $fieldNameRef,';
    }).join('\n');

    final thisRef = useInternalRef ? '_\$this' : 'this';
    final returnCode =
        fields.isEmpty ? 'other' : '$className($mergeStatements)';

    print('Generated merge method for $className');

    return '''
    /// Merges the properties of this [$className] with the properties of [other].
    ///
    /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
    /// [$className] with the properties of [other] taking precedence over 
    /// the corresponding properties of this instance.
    ///
    /// Properties from [other] that are null will fall back
    /// to the values from this instance.
    @override
    $className merge(${isAbstract ? 'covariant ' : ''}$className? other) {
      if (other == null) return $thisRef;

      return $returnCode;
    }''';
  }
}
