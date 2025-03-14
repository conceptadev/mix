import '../metadata/field_metadata.dart';
import '../utils/helpers.dart';
import '../utils/string_utils.dart';

class ResolvableMethods {
  const ResolvableMethods._();

  /// Generates a resolve method implementation
  static String generateResolveMethod({
    required String className,
    required String constructorRef,
    required List<ParameterMetadata> fields,
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

      if (field.hasResolvable) {
        return '$fieldName?.resolve(mix)$fallbackExpression';
      }

      return '$fieldName$fallbackExpression';
    });

    final constIgnoreRule =
        fields.isEmpty && isConst ? '// ignore: prefer_const_constructors' : '';

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
  $constIgnoreRule
    return $resolvedType$constructorRef(
      $params
    );
  }''';
  }

  /// Generates a merge method implementation
  static String generateMergeMethod({
    required String className,
    required List<ParameterMetadata> fields,
    required bool isAbstract,
    required bool shouldMergeLists,
    required bool useInternalRef,
  }) {
    final mergeStatements = fields.map((field) {
      final fieldName = field.name;
      final fieldNameRef = useInternalRef ? field.asInternalRef : fieldName;

      // Handle list fields with proper null-aware spread
      if (field.isListType) {
        return shouldMergeLists
            ? '$fieldName: MixHelpers.mergeList($fieldNameRef, other.$fieldName),'
            : '$fieldName: [...? $fieldNameRef, ...? other.$fieldName],';
      } else if (field.hasResolvable) {
        final resolvable = field.resolvable;
        // Build a default merge statement using the merge() method if available
        final defaultMerge =
            '$fieldName: $fieldNameRef?.merge(other.$fieldName) ?? other.$fieldName,';

        // Extract the element from the representation type (if it exists)

        if (resolvable == null) {
          return defaultMerge;
        }

        if (resolvable.tryToMergeType) {
          return '$fieldName: ${resolvable.type}.tryToMerge($fieldNameRef, other.$fieldName),';
        }

        return defaultMerge;
      }

      // Default: use the value from other if non-null, otherwise fallback to this value

      return '$fieldName: other.$fieldName ?? $fieldNameRef,';
    }).join('\n');

    final thisRef = useInternalRef ? '_\$this' : 'this';
    final returnCode =
        fields.isEmpty ? 'other' : '$className($mergeStatements)';

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
