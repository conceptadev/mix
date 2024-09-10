import '../../helpers/builder_utils.dart';
import '../../helpers/field_info.dart';
import '../getter_self_reference.dart';
import '../method_equality.dart';
import '../method_merge.dart';
import '../method_resolve.dart';
import '../method_to_map.dart';

String classMixin(ClassBuilderContext context) {
  final mixinName = context.generatedName;
  final el = context.classElement;

  // Check if ClassElement has method getters called props, resolve, and merge
  final hasEquality = el.methods.any((method) => method.name == 'props');
  final hasResolve = el.methods.any((method) => method.name == 'resolve');
  final hasMerge = el.methods.any((method) => method.name == 'merge');

  final extendType = el.isDto ? 'Dto' : 'SpecAttribute';

  final instance =
      ClassInfo.ofElement(context.classElement, asInternalRef: true);

  final referenceName = context.classElement.genericType.name;

  final resolveMethod = !hasResolve
      ? resolveMethodBuilder(
          instance,
          resolvedName: referenceName,
          resolvedConstructor: '',
          withDefaults: el.isDto,
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

  final toMapMethod = methodToMapBuilder(instance);

  return '''
mixin $mixinName on $extendType<$referenceName> {
  $resolveMethod

  $mergeMethod

  $propsGetter

  $selfGetter

  $toMapMethod
}
''';
}
