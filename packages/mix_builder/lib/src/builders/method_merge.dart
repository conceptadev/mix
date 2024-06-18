import 'package:analyzer/dart/element/element.dart';
import 'package:mix_builder/src/helpers/builder_utils.dart';
import 'package:mix_builder/src/helpers/field_info.dart';

String mergeMethodBuilder({
  required String className,
  required AnnotationContext context,
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
    final nullable = field.nullable ? '?' : '';

    var propAssignment = '$propName:';

    if (field.isListType) {
      if (shouldMergeLists) {
        return '$propAssignment ${MixHelperRef.mergeList}($thisName, other.$propName)';
      } else {
        return '$propAssignment [...$nullable$thisName,...${nullable}other.$propName]';
      }
    }
    if (field.hasDto) {
      final hasTryToMerge = _checkIfHasTryToMerge(field.dartType.element!);
      final tryToMergeExpression =
          '$propAssignment ${field.dtoType}.tryToMerge($thisName, other.$propName)';
      if (hasTryToMerge) {
        return tryToMergeExpression;
      }

      // TODO: Hard coded for now, will be removed soon
      if (field.dtoType == 'DecorationDto') {
        return tryToMergeExpression;
      }

      return '$propAssignment $thisName$nullable.merge(other.$propName) ?? other.$propName';
    } else {
      if (field.nullable) {
        return '$propAssignment other.$propName ?? $thisName';
      } else {
        return '$propAssignment other.$propName';
      }
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
