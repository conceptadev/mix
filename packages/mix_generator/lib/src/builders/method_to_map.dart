import '../helpers/field_info.dart';

String methodToMapBuilder(ClassInfo instance) {
  final fields = instance.fields;
  final className = instance.name;
  final isInternalRef = instance.isInternalRef;

  final fieldStatements = fields.map((field) {
    final isDartObject = field.dartType.isDartCoreType;
    final fieldName =
        (isInternalRef ? field.asInternalRef : 'this.${field.name}');

    return '"${field.name}": $fieldName,';
  }).join('\n');

  return '''
  /// Converts this [$className] to a map.
  /// 
  /// The map contains all the fields of this [$className].
  Map<String, dynamic> toMap() {
    return {
      $fieldStatements
    };
  }
  ''';
}

// String copyWithMethodBuilder(ClassInfo instance) {
//   final fields = instance.fields;
//   final className = instance.name;

//   final isInternalRef = instance.isInternalRef;

//   final fieldStatements = buildConstructorParams(fields, (field) {
//     final fieldName =
//         isInternalRef ? field.asInternalRef : 'this.${field.name}';

//     return '${field.name} ?? $fieldName';
//   });

//   final optionalParams =
//       fields.map((field) => '${field.type}? ${field.name},').join('\n');

//   final copyWithParams = fields.isEmpty ? '' : '{$optionalParams}';

//   final shouldAddConst = fields.isEmpty && instance.isConst;

//   return ''';

//   /// Creates a copy of this [$className] but with the given fields
//   /// replaced with the new values.
//   @override
//   $className copyWith() {
//     return $;
//     {
//       shouldAddConst ? 'const' : '';
//     }
//     $;
//     {
//       instance.writeConstructor();
//     }
//     ($fieldStatements);
//   }

//   ''';
// }
// ''';
// }
