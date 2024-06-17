import 'package:mix_builder/src/helpers/builder_utils.dart';
import 'package:mix_builder/src/helpers/field_info.dart';

String resolveMethodBuilder({
  required String resolvedType,
  required List<ParameterInfo> fields,
  bool withDefaults = false,
  bool isInternalRef = false,
}) {
  final resolveStatements = fields.map((field) {
    final propName = field.name;
    var fieldName = isInternalRef ? field.asInternalRef : field.name;
    var nullableSign = field.nullable ? '?' : '';

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
  @override
  $resolvedType resolve(MixData mix) {

    return $resolvedType(
      $resolveStatements,
    );
  }
''';
}
