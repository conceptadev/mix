import 'package:mix_generator/src/helpers/builder_utils.dart';
import 'package:mix_generator/src/helpers/field_info.dart';
import 'package:mix_generator/src/helpers/helpers.dart';

String resolveMethodBuilder({
  required String className,
  required String resolvedType,
  required List<ParameterInfo> fields,
  bool withDefaults = false,
  bool isInternalRef = false,
}) {
  final resolveStatements = fields.map((field) {
    final propName = field.name;
    var fieldName = isInternalRef ? field.asInternalRef : field.name;
    var nullableSign = '?';

    final fallbackExpression =
        field.nullable && withDefaults ? '?? $kDefaultValueRef.$propName' : '';

    if (field.hasDto) {
      if (field.isListType) {
        return '$propName: $fieldName$nullableSign.map((e) => e.resolve(mix)).toList() $fallbackExpression';
      } else {
        if (field.dtoType == 'AnimatedDataDto') {
          return '$propName: $fieldName$nullableSign.resolve(mix) ?? mix.animation';
        }
        return '$propName: $fieldName$nullableSign.resolve(mix) $fallbackExpression';
      }
    }

    return '$propName: $fieldName $fallbackExpression';
  }).join(',\n');

  return '''
  /// Resolves to [$resolvedType] using the provided [MixData].
  /// 
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `$kDefaultValueRef` for that property.
  ///
  /// ```dart
  /// final ${resolvedType.lowercaseFirst} = $className(...).resolve(mix);
  /// ```
  @override
  $resolvedType resolve(MixData mix) {

    return $resolvedType(
      $resolveStatements,
    );
  }
''';
}
