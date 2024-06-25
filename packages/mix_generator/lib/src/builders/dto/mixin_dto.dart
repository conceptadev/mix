import 'package:mix_generator/src/builders/getter_self_reference.dart';
import 'package:mix_generator/src/builders/method_equality.dart';
import 'package:mix_generator/src/builders/method_merge.dart';
import 'package:mix_generator/src/builders/method_resolve.dart';
import 'package:mix_generator/src/helpers/builder_utils.dart';
import 'package:source_gen/source_gen.dart';

String dtoMixin(DtoAnnotationContext context) {
  final className = context.name;
  final mixinName = context.mixinExtensionName;
  final fields = context.fields;

  final el = context.element;

  if (!el.isDto) {
    throw InvalidGenerationSource(
      'The class $className must extend a class that extends Dto.',
      element: el,
    );
  }

  // Check if ClassElement has method getters called props, resolve, and merge
  final hasEquality = el.methods.any((method) => method.name == 'props');
  final hasResolve = el.methods.any((method) => method.name == 'resolve');
  final hasMerge = el.methods.any((method) => method.name == 'merge');

  // Get the generic type argument of Dto
  final valueType = el.getGenericTypeOfSuperclass();

  if (valueType == null) {
    throw InvalidGenerationSource(
      'The class $className must extend a class that extends Dto.',
      element: el,
    );
  }

  final valueTypeName = valueType.getTypeAsString();

  final resolveMethod = !hasResolve
      ? resolveMethodBuilder(
          className: className,
          resolvedType: valueTypeName,
          fields: fields,
          isInternalRef: true,
          withDefaults: true,
        )
      : '';

  final mergeMethod = !hasMerge
      ? mergeMethodBuilder(
          className: className,
          context: context,
          isInternalRef: true,
          shouldMergeLists: context.annotation.mergeLists,
        )
      : '';

  final propsGetter = !hasEquality
      ? getterPropsBuilder(
          className: className,
          fields: fields,
          isInternalRef: true,
        )
      : '';

  final selfGetter = getterSelfBuilder(className: className);

  return '''
base mixin $mixinName on Dto<$valueType> {
  $resolveMethod

  $mergeMethod

  $propsGetter

  $selfGetter
}
''';
}
