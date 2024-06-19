// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:mix_generator/src/helpers/builder_utils.dart';
import 'package:mix_generator/src/helpers/field_info.dart';

String lerpMethodBuilder({
  required AnnotationContext context,
  bool isInternalRef = false,
}) {
  final className = context.name;
  final lerpMethods = <String, List<String>>{};
  final stepMethod = <String>[];

  for (final field in context.fields) {
    final method = _getLerpMethod(field, context);

    if (method != null) {
      lerpMethods.putIfAbsent(method, () => []).add(field.name);
    } else {
      stepMethod.add(field.name);
    }
  }
  final lerpStatements = context.fields.map((field) {
    final lerpExpression = _getLerpExpression(field, context, isInternalRef);
    return '${field.name}: $lerpExpression,';
  }).join('\n');

  final thisRef = isInternalRef ? ParameterInfo.internalRefPrefix : 'this';

  return '''
/// Linearly interpolates between this [$className] and another [$className] based on the given parameter [t].
///
/// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
/// When [t] is 0.0, the current [$className] is returned. When [t] is 1.0, the [other] [$className] is returned.
/// For values of [t] between 0.0 and 1.0, an interpolated [$className] is returned.
///
/// If [other] is null, this method returns the current [$className] instance.
///
/// The interpolation is performed on each property of the [$className] using the appropriate
/// interpolation method:
///
${lerpMethods.entries.map((entry) => '/// - [${entry.key}] for ${entry.value.map((e) => '[$e]').join(' and ')}.\n').join()}
/// For ${stepMethod.map((e) => '[$e]').join(' and ')}, the interpolation is performed using a step function.
/// If [t] is less than 0.5, the value from the current [$className] is used. Otherwise, the value
/// from the [other] [$className] is used.
/// 
/// This method is typically used in animations to smoothly transition between
/// different [$className] configurations.
  @override
  $className lerp($className? other, double t) {
    if (other == null) return $thisRef;

    return $className(
      $lerpStatements
    );
  }
''';
}

String? _getLerpMethod(
  ParameterInfo field,
  AnnotationContext context,
) {
  final typeName = field.type;
  final hasLerp = _checkIfFieldHasLerp(field.dartType.element!);

  // We need a custom TextStyle lerp for now
  // Due to the shadow list merge behavior
  // Later check if the min Flutter version has the Shadow lerp list
  if (hasLerp && typeName != 'TextStyle') {
    return '$typeName.lerp';
  }
  switch (typeName) {
    case 'double':
      return MixHelperRef.lerpDouble;
    case 'Matrix4':
      return MixHelperRef.lerpMatrix4;
    case 'StrutStyle':
      return MixHelperRef.lerpStrutStyle;

    case 'TextStyle':
      return MixHelperRef.lerpTextStyle;
    default:
      return null;
  }
}

String _getLerpExpression(
  ParameterInfo field,
  AnnotationContext context,
  bool isInternalRef,
) {
  final thisFieldName = isInternalRef ? field.asInternalRef : field.name;
  final otherFieldName = 'other.${field.name}';

  final defaultExpression = 't < 0.5 ? $thisFieldName : $otherFieldName';

  final nullable = field.nullable ? '?' : '';

  if (field.dartType.element == null) {
    return defaultExpression;
  }

  final hasLerpMethod = _checkIfInstanceHasLerp(field.dartType.element!);

  if (hasLerpMethod) {
    return '$thisFieldName$nullable.lerp($otherFieldName, t) ${field.nullable ? '?? $otherFieldName' : ''}';
  }

  final lerpParams = '$thisFieldName, $otherFieldName, t';

  final hasLerpStatic = _getLerpMethod(field, context);

  if (hasLerpStatic == null) {
    return defaultExpression;
  }

  return '$hasLerpStatic($lerpParams)';
}

bool _checkIfInstanceHasLerp(Element element) {
  if (element is! ClassElement) {
    return false;
  }

  // Check if the class element or any of its mixins have a method called lerp
  bool hasLerpMethod(InterfaceElement classElement) {
    final methods = classElement.methods;
    if (methods.isNotEmpty) {
      for (final method in methods) {
        if (method.name == 'lerp' &&
            method.isPublic &&
            method.parameters.length == 2 &&
            method.parameters.last.type.isDartCoreDouble) {
          return true;
        }
      }
    }
    return false;
  }

  if (hasLerpMethod(element)) {
    return true;
  }

  // Check mixins for the lerp method
  for (final mixin in element.mixins) {
    if (hasLerpMethod(mixin.element)) {
      return true;
    }
  }

  return false;
}

bool _checkIfFieldHasLerp(Element element) {
  if (element is! ClassElement) {
    return false;
  }

  final hasLerp = _checkIfInstanceHasLerp(element);

  if (hasLerp) {
    return true;
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
