import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:mix_builder/src/helpers/field_info.dart';

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
        type: element.type,
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

      if (fieldInfo?.annotation == null) {
        print((element.enclosingElement as ClassElement).name);
        print(param.name);
      }

      parameters[param.name] = ParameterInfo(
        name: param.name,
        isPositioned: param.isPositional,
        type: param.type,
        fieldInfo: fieldInfo,
        isSuper: param.isSuperFormal,
        documentationComment: fieldInfo?.documentationComment,
        annotation: fieldInfo!.annotation,
      );
    }
  }
}
