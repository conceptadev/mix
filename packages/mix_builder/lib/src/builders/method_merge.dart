import 'package:analyzer/dart/element/element.dart';
import 'package:mix_builder/src/helpers/builder_utils.dart';
import 'package:mix_builder/src/helpers/field_info.dart';

String mergeMethodBuilder({
  required String className,
  required AnnotationContext context,
  bool isInternalRef = false,
  bool shouldMergeLists = false,
}) {
  final fields = context.fields;
  final thisRef = isInternalRef ? ParameterInfo.internalRefPrefix : 'this';

  final helpers = context.declarationProvider;

  final namedConstructor = context.element.getNamedConstructor('_');
  final constructor =
      namedConstructor != null ? '.${namedConstructor.name}' : '';

  final fieldStatements = fields.map((field) {
    final propName = field.name;
    final thisName = isInternalRef ? field.asInternalRef : field.name;
    final nullable = field.nullable ? '?' : '';

    var propAssignment = '$propName:';
    if (field.isPositioned) {
      propAssignment = '';
    }

    if (field.hasDto) {
      if (field.isListType) {
        return '$propAssignment Dto.mergeList($thisName, other.$propName)';
      } else {
        final hasTryToMerge = _checkIfHasTryToMerge(field.element!);
        if (hasTryToMerge) {
          return '$propAssignment ${field.baseType}.tryToMerge($thisName, other.$propName)';
        }
        return '$propAssignment $thisName$nullable.merge(other.$propName) ?? other.$propName';
      }
    } else {
      if (field.isListType) {
        if (shouldMergeLists) {
          return '$propAssignment ${helpers.merge}($thisName, other.$propName)';
        } else {
          return '$propAssignment [...$nullable$thisName,...${nullable}other.$propName]';
        }
      } else {
        if (field.nullable) {
          return '$propAssignment other.$propName ?? $thisName';
        } else {
          return '$propAssignment other.$propName';
        }
      }
    }
  }).join(',\n      ');

  final covariantKey = context.element.isFinal ? '' : 'covariant';

  return '''
  @override
  $className merge($covariantKey $className? other) {
    if (other == null) return $thisRef;

    return $className$constructor(
      $fieldStatements,
    );
  }
''';
}

bool _checkIfHasTryToMerge(Element element) {
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
      if (method.name == 'tryToMerge' &&
          method.isStatic &&
          method.isPublic &&
          method.parameters.length == 2) {
        return true;
      }
    }
  }

  return false;
}
