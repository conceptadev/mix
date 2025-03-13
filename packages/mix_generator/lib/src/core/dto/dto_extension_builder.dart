import 'package:analyzer/dart/element/nullability_suffix.dart';

import '../models/dto_metadata.dart';
import '../utils/code_builder.dart';

/// Builder for generating extension methods to convert between value types and DTOs.
class DtoExtensionBuilder extends CodeBuilder {
  /// The metadata for the DTO class
  final DtoMetadata metadata;

  /// Creates a new DtoExtensionBuilder
  DtoExtensionBuilder(this.metadata);

  @override
  String build() {
    final className = metadata.name;
    final resolvedTypeName = metadata.resolvedType.name;
    final resolvedElement = metadata.resolvedType;

    // Get the fields from the resolved type
    final resolvedFields = resolvedElement.fields;

    final fieldStatements = metadata.fields.map((field) {
      final fieldName = field.name;

      // Check if the field exists in the resolved type and if it's nullable
      final resolvedField =
          resolvedFields.where((f) => f.name == fieldName).firstOrNull;
      final isNullableInResolvedType =
          resolvedField?.type.nullabilitySuffix == NullabilitySuffix.question;

      // Always use the nullability from the resolved type if available
      final paramIsNullable =
          resolvedField != null ? isNullableInResolvedType : field.nullable;

      if (field.isDto) {
        final fieldNameRef = paramIsNullable ? '$fieldName?' : fieldName;

        if (field.isListType) {
          return '$fieldName: $fieldNameRef.map((e) => e.toDto()).toList(),';
        } else if (field.isMapType) {
          return '$fieldName: $fieldNameRef.map((k, v) => MapEntry(k, v.toDto())),';
        } else if (field.isSetType) {
          return '$fieldName: $fieldNameRef.map((e) => e.toDto()).toSet(),';
        }

        return '$fieldName: $fieldNameRef.toDto(),';
      }

      return '$fieldName: $fieldName,';
    }).join('\n      ');

    // Build the extension for the value type
    final valueExtension = '''
/// Extension methods to convert [$resolvedTypeName] to [$className].
extension ${resolvedTypeName}MixExt on $resolvedTypeName {
  /// Converts this [$resolvedTypeName] to a [$className].
  $className toDto() {
    return $className(
      $fieldStatements
    );
  }
}
''';

    // Build the extension for List<ValueType>
    final listExtension = '''
/// Extension methods to convert List<[$resolvedTypeName]> to List<[$className]>.
extension List${resolvedTypeName}MixExt on List<$resolvedTypeName> {
  /// Converts this List<[$resolvedTypeName]> to a List<[$className]>.
  List<$className> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
''';

    return '$valueExtension\n$listExtension';
  }
}
