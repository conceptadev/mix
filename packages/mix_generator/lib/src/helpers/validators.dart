import 'package:analyzer/dart/element/element.dart';
import 'package:mix_generator/src/helpers/field_info.dart';
import 'package:source_gen/source_gen.dart';

void validOrThrowIfHasRequiredParameters(List<ParameterElement> params) {
  final hasRequiredParameter =
      params.any((parameter) => parameter.isRequiredNamed);
  if (hasRequiredParameter) {
    throw InvalidGenerationSourceError(
      'Spec definition parameters cannot have the `required` keyword.',
    );
  }
}

void validOrThrowIfHasRequiredFields(List<ParameterInfo> fields) {
  // Check if any field is required (non-nullable)
  final hasRequiredField = fields.any((field) => !field.nullable);
  if (hasRequiredField) {
    throw InvalidGenerationSourceError(
      'All fields of a Spec definition in the class must be nullable.',
    );
  }
}

// void validateOrThrowHasAnyFields(List<FieldElement> fields) {
//   // Check if any field is required (non-nullable)
//   final hasFields = fields.isNotEmpty;
//   if (hasFields) {
//     throw InvalidGenerationSourceError(
//       'Spec definition must only have contructor parameters',
//     );
//   }
// }
