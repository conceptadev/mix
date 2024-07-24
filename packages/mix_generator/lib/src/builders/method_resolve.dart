import 'package:mix_generator/src/helpers/builder_utils.dart';
import 'package:mix_generator/src/helpers/field_info.dart';
import 'package:mix_generator/src/helpers/helpers.dart';

String resolveMethodBuilder(
  ClassInfo instance, {
  required String resolvedName,
  required String resolvedConstructor,
  required bool withDefaults,
}) {
  final fields = instance.fields;
  final isInternalRef = instance.isInternalRef;

  final resolveStatements = buildConstructorParams(fields, (field) {
    final propName = field.name;
    var fieldName = isInternalRef ? field.asInternalRef : field.name;
    var nullableSign = '?';

    final fallbackExpression =
        field.nullable && withDefaults ? '?? $kDefaultValueRef.$propName' : '';

    if (field.hasDto) {
      if (field.isListType) {
        return '$fieldName$nullableSign.map((e) => e.resolve(mix)).toList() $fallbackExpression';
      } else {
        if (field.dtoType == 'AnimatedDataDto') {
          return '$fieldName$nullableSign.resolve(mix) ?? mix.animation';
        }
        return '$fieldName$nullableSign.resolve(mix) $fallbackExpression';
      }
    }

    return '$fieldName $fallbackExpression';
  });

  return '''
  /// Resolves to [$resolvedName] using the provided [MixData].
  /// 
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `$kDefaultValueRef` for that property.
  ///
  /// ```dart
  /// final ${resolvedName.lowercaseFirst} = ${instance.name}(...).resolve(mix);
  /// ```
  @override
  $resolvedName resolve(MixData mix) {
    return $resolvedName$resolvedConstructor(
      $resolveStatements
    );
  }
''';
}
