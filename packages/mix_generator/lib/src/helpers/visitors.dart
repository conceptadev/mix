import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:mix_generator/src/helpers/builder_utils.dart';
import 'package:mix_generator/src/helpers/field_info.dart';

class ClassVisitor extends SimpleElementVisitor<void> {
  final Map<String, FieldInfo> fields = {};
  final Map<String, ParameterInfo> parameters = {};
  final Map<String, List<bool>> hasInternalAnnotations = {};
  bool constructorSelected = false;

  @override
  Future<void> visitFieldElement(FieldElement element) async {
    if (element.isFinal) {
      fields[element.name] = FieldInfo(
        name: element.name,
        dartType: element.type,
        type: element.type.getTypeAsString(),
        nullable: element.type.nullabilitySuffix == NullabilitySuffix.question,
        documentationComment: element.documentationComment,
        annotation: readFieldAnnotation(element),
      );
    }
  }

  void visitConstructorElement(ConstructorElement element) {
    if (element.name != '_' && !element.isDefaultConstructor) {
      return;
    }

    if (constructorSelected) return;

    constructorSelected = true;

    for (final param in element.parameters) {
      final fieldInfo = getFieldInfoFromParameter(param);

      final field = fields[param.name];

      final isNullable =
          param.type.nullabilitySuffix == NullabilitySuffix.question;

      parameters[param.name] = ParameterInfo(
        name: param.name,
        dartType: param.type,
        type: param.type.getTypeAsString(),
        nullable: field?.nullable ?? isNullable,
        isSuper: param.isSuperFormal,
        documentationComment: fieldInfo?.documentationComment,
        annotation: fieldInfo!.annotation,
      );
    }
  }
}
