import 'package:mix_generator/src/builders/getter_self_reference.dart';
import 'package:mix_generator/src/builders/method_equality.dart';
import 'package:mix_generator/src/builders/method_merge.dart';
import 'package:mix_generator/src/builders/method_resolve.dart';
import 'package:mix_generator/src/helpers/builder_utils.dart';
import 'package:mix_generator/src/helpers/types.dart';
import 'package:source_gen/source_gen.dart';

String dtoMixin(DtoAnnotationContext context) {
  final className = context.name;
  final mixinName = context.mixinExtensionName;
  final fields = context.fields;
  final dtoRef = MixTypes.foundation.dto.symbol!;
  final element = context.element;

  // Find the supertype that matches Dto
  final dtoSupertype = element.allSupertypes.firstWhere(
    checkIfElementIsDto,
    orElse: () => throw InvalidGenerationSource(
      'The class $className must extend Dto.',
      element: element,
    ),
  );

  // Check if ClassElement has method getters called props, resolve, and merge
  final hasEquality = element.methods.any((method) => method.name == 'props');
  final hasResolve = element.methods.any((method) => method.name == 'resolve');
  final hasMerge = element.methods.any((method) => method.name == 'merge');

  // Get the generic type argument of Dto
  final valueType = dtoSupertype.typeArguments.first;
  final valueTypeName = getTypeNameFromDartType(valueType);

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
base mixin $mixinName on $dtoRef<$valueType> {
  $resolveMethod

  $mergeMethod

  $propsGetter

  $selfGetter

}
''';
}
