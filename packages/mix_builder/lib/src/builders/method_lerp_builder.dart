// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:mix_builder/src/helpers/builder_utils.dart';
import 'package:mix_builder/src/helpers/field_info.dart';

String lerpMethodBuilder({
  required AnnotationContext context,
  bool isInternalRef = false,
}) {
  final className = context.name;
  final lerpStatements = context.fields.map((field) {
    final fieldName = isInternalRef ? field.asInternalRef : field.name;
    final lerpExpression = _getLerpExpression(fieldName, field, context);
    return '${field.name}: $lerpExpression,';
  }).join('\n');

  final thisRef = isInternalRef ? ParameterInfo.internalRefPrefix : 'this';

  return '''
  @override
  $className lerp($className? other, double t) {
    if (other == null) return $thisRef;

    return $className(
      $lerpStatements
    );
  }
''';
}

String _getLerpExpression(
    String fieldName, ParameterInfo field, AnnotationContext context) {
  final typeName = field.type;

  final defaultExpression = 't < 0.5 ? $fieldName : other.$fieldName';

  if (field.element == null) {
    return defaultExpression;
  }

  final lerpParams = '$fieldName, other.$fieldName, t';

  final hasLerp = _checkIfFieldHasLerp(field.element!);

  // We need a custom TextStyle lerp for now
  // Due to the shadow list merge behavior
  // Later check if the min Flutter version has the Shadow lerp list
  if (hasLerp && typeName != 'TextStyle') {
    return '$typeName.lerp($lerpParams)';
  }

  final helpers = context.declarationProvider;

  switch (typeName) {
    case 'double':
      return '${helpers.lerpDouble}($lerpParams)';
    case 'Matrix4':
      return '${helpers.lerpMatrix4}($lerpParams)';
    case 'StrutStyle':
      return '${helpers.lerpStrutStyle}($lerpParams)';

    case 'TextStyle':
      return '${helpers.lerpTextStyle}($lerpParams)';
    default:
      return defaultExpression;
  }
}

bool _checkIfFieldHasLerp(Element element) {
  if (element is! ClassElement) {
    return false;
  }

  for (final type in [
    element,
    ...element.allSupertypes
        .where((e) => !e.isDartCoreObject)
        .map((e) => e.element),
  ]) {
    for (final method in type.methods) {
      if (method.name == 'lerp' &&
          method.isStatic &&
          method.isPublic &&
          method.parameters.length == 3 &&
          method.parameters.last.type.isDartCoreDouble) {
        return true;
      }
    }
  }

  return false;
}
