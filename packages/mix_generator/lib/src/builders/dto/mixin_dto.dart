import 'package:mix_annotations/mix_annotations.dart';
import '../getter_self_reference.dart';
import '../method_equality.dart';
import '../method_merge.dart';
import '../method_resolve.dart';
import '../../helpers/field_info.dart';

String dtoMixin(ClassBuilderContext<MixableDto> context) {
  final mixinName = context.generatedName;
  final el = context.classElement;

  // Check if ClassElement has method getters called props, resolve, and merge
  final hasEquality = el.methods.any((method) => method.name == 'props');
  final hasResolve = el.methods.any((method) => method.name == 'resolve');
  final hasMerge = el.methods.any((method) => method.name == 'merge');

  // Get the generic type argument of Dto

  final instance =
      ClassInfo.ofElement(context.classElement, asInternalRef: true);

  final referenceName = context.referenceClass.name;

  final resolveMethod = !hasResolve
      ? resolveMethodBuilder(
          instance,
          resolvedName: referenceName,
          resolvedConstructor: '',
          withDefaults: true,
        )
      : '';

  final mergeMethod = !hasMerge
      ? mergeMethodBuilder(
          instance,
          shouldMergeLists: context.annotation.mergeLists,
        )
      : '';

  final propsGetter = !hasEquality ? getterPropsBuilder(instance) : '';

  final selfGetter = getterSelfBuilder(instance);

  return '''
base mixin $mixinName on Dto<$referenceName> {
  $resolveMethod

  $mergeMethod

  $propsGetter

  $selfGetter
}
''';
}
