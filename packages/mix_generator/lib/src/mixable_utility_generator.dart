// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generator/src/builders/utility/mixin_utility.dart';
import 'package:mix_generator/src/helpers/dart_type_ext.dart';
// ignore_for_file: prefer_relative_imports
import 'package:mix_generator/src/helpers/field_info.dart';
import 'package:source_gen/source_gen.dart';

import 'helpers/builder_utils.dart';

class MixableUtilityGenerator
    extends GeneratorForAnnotation<MixableScalarUtility> {
  MixableUtilityGenerator();

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader reader,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'The annotation can only be applied to a class.',
        element: element,
      );
    }

    final valueType = _getUtilityType(element);

    if (valueType == null) {
      throw InvalidGenerationSourceError(
        'The annotation can only be applied to a class that extends MixUtility<Attribute, ValueType>',
        element: element,
      );
    }

    final annotation = _readAnnotation(element);
    final el = annotation.type?.element ?? valueType.element;

    final fields = <FieldInfo>[];

    if (el is EnumElement) {
      el.fields.forEach((field) {
        fields.add(FieldInfo(
          name: field.name,
          dartType: field.type,
          type: field.type.getTypeAsString(),
          nullable: field.type.isNullableType,
          documentationComment: field.documentationComment,
          annotation: readFieldAnnotation(field),
        ));
      });
    } else if (el is ClassElement) {
      el.fields.forEach((field) {
        final isSameType = field.type.isAssignableTo(valueType);

        if (field.isStatic && field.isConst && isSameType) {
          fields.add(FieldInfo(
            name: field.name,
            dartType: field.type,
            type: field.type.getTypeAsString(),
            nullable: field.type.isNullableType,
            documentationComment: field.documentationComment,
            annotation: readFieldAnnotation(field),
          ));
        }
      });
    }

    if (annotation.type == null) {}

    final context = UtilityAnnotationContext(
      element: element,
      annotation: annotation,
      valueType: valueType,
      fields: fields.map(ParameterInfo.fromFieldInfo).toList(),
    );

    final output = StringBuffer();

    output.writeln(utilityMixin(context));

    final result = context.generate(output.toString());

    return result;
  }
}

const _typeChecker = TypeChecker.fromRuntime(MixableScalarUtility);

MixableScalarUtilityAnnotation _readAnnotation(ClassElement element) {
  final annotation = _typeChecker.firstAnnotationOfExact(element);
  final reader = ConstantReader(annotation);
  final mapType = reader.peek('mapType')?.typeValue;
  return MixableScalarUtilityAnnotation(type: mapType);
}

DartType? _getUtilityType(ClassElement element) {
  const utilityTypes = ['MixUtility', 'EnumUtility', 'ScalarUtility'];

  for (var supertype in element.allSupertypes) {
    if (utilityTypes.contains(supertype.element.name) &&
        supertype.typeArguments.length == 2) {
      return supertype.typeArguments[1];
    }
  }

  return null;
}

class MixableScalarUtilityAnnotation {
  final DartType? type;
  const MixableScalarUtilityAnnotation({this.type});
}
