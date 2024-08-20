import 'package:analyzer/dart/element/element.dart';
import '../helpers/builder_utils.dart';
import '../helpers/field_info.dart';
import '../helpers/helpers.dart';

String mergeMethodBuilder(
  ClassInfo instance, {
  bool shouldMergeLists = true,
}) {
  final isInternalRef = instance.isInternalRef;
  final thisRef = isInternalRef ? ParameterInfo.internalRefPrefix : 'this';

  final fields = instance.fields;
  final enclosedClass = instance.name;

  final isFinal = instance.isFinal;

  final fieldStatements = buildConstructorParamsAsNamed(fields, (field) {
    final propName = field.name;
    final thisName = isInternalRef ? field.asInternalRef : field.name;
    const nullable = '?';

    if (field.isListType) {
      final listNullable = field.nullable ? '?' : '';
      if (shouldMergeLists) {
        return '${MixHelperRef.mergeList}($thisName, other.$propName)';
      } else {
        return '[...$listNullable$thisName,...${listNullable}other.$propName]';
      }
    }
    if (field.hasDto) {
      final hasTryToMerge = _checkIfHasTryToMerge(field.dartType.element!);
      final tryToMergeExpression =
          '${field.dtoType}.tryToMerge($thisName, other.$propName)';

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

      return '$thisName$nullable.merge(other.$propName) ?? other.$propName';
    } else {
      return 'other.$propName ?? $thisName';
    }
  });

  final covariantKey = isFinal ? '' : 'covariant';

  final returnCode = fields.isEmpty
      ? 'other'
      : '''
    ${instance.writeConstructor()}(
      $fieldStatements
    )
  ''';

  return '''
  /// Merges the properties of this [$enclosedClass] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [$enclosedClass] with the properties of [other] taking precedence over 
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  $enclosedClass merge($covariantKey $enclosedClass? other) {
    if (other == null) return $thisRef;

    return $returnCode;
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
