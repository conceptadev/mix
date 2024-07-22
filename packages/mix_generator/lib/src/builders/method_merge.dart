import 'package:analyzer/dart/element/element.dart';
import 'package:mix_generator/src/helpers/builder_utils.dart';
import 'package:mix_generator/src/helpers/field_info.dart';

String mergeMethodBuilder({
  required String className,
  required ClassVisitorAnnotationContext context,
  bool isInternalRef = false,
  bool shouldMergeLists = true,
}) {
  final fields = context.fields;
  final thisRef = isInternalRef ? ParameterInfo.internalRefPrefix : 'this';

  final namedConstructor = context.element.getNamedConstructor('_');
  final constructor =
      namedConstructor != null ? '.${namedConstructor.name}' : '';

  final fieldStatements = fields.map((field) {
    final propName = field.name;
    final thisName = isInternalRef ? field.asInternalRef : field.name;
    final nullable = '?';

    var propAssignment = '$propName:';

    if (field.isListType) {
      final listNullable = field.nullable ? '?' : '';
      if (shouldMergeLists) {
        return '$propAssignment ${MixHelperRef.mergeList}($thisName, other.$propName)';
      } else {
        return '$propAssignment [...$listNullable$thisName,...${listNullable}other.$propName]';
      }
    }
    if (field.hasDto) {
      final hasTryToMerge = _checkIfHasTryToMerge(field.dartType.element!);
      final tryToMergeExpression =
          '$propAssignment ${field.dtoType}.tryToMerge($thisName, other.$propName)';

      // I have a type name that I want to see if I can get an element
      // to check if it has a tryToMerge method. How can I get that?
      // I need to get the element of the type name.

      if (hasTryToMerge) {
        return tryToMergeExpression;
      }

      // TODO: Hard coded for now, will be removed soon
      if (field.dtoType == 'DecorationDto') {
        return tryToMergeExpression;
      }

      return '$propAssignment $thisName$nullable.merge(other.$propName) ?? other.$propName';
    } else {
      return '$propAssignment other$nullable.$propName ?? $thisName';
    }
  }).join(',\n      ');

  final covariantKey = context.element.isFinal ? '' : 'covariant';

  return '''
  /// Merges the properties of this [$className] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [$className] with the properties of [other] taking precedence over 
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
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
