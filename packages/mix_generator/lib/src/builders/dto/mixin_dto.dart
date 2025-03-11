import 'package:mix_annotations/mix_annotations.dart';

import '../../helpers/field_info.dart';
import '../../helpers/type_ref_repository.dart';
import '../methods.dart';

enum MixinType {
  dto,
  spec,
}

class DtoMixinBuilder {
  final AnnotatedClassBuilderContext<MixableDto> context;
  final MixinType type;

  const DtoMixinBuilder({required this.context, required this.type});

  String build() {
    final mixinName = '_\$${context.name}';
    final isDto = type == MixinType.dto;
    final extendType = isDto ? $Dto : $SpecAttribute;

    final hasResolve = context.hasMethod('resolve');
    final hasMerge = context.hasMethod('merge');
    final hasEquality = context.hasMethod('props');

    final genericType = context.genericSuperType;

    final resolveMethod = !hasResolve
        ? resolveMethodBuilder(
            classDefinition: context.definition,
            resolvedType: genericType,
            usePrivateRef: true,
            resolvedTypeConstructor: '',
            withDefaults: isDto,
          )
        : '';

    final mergeMethod = !hasMerge
        ? mergeMethodBuilder(
            ownerClass: context.definition,
            usePrivateRef: true,
            shouldMergeLists: context.annotation.mergeLists,
          )
        : '';

    final propsGetter = !hasEquality
        ? getterPropsBuilder(
            ownerClass: context.definition,
            usePrivateRef: true,
          )
        : '';

    final selfGetter = getterSelfBuilder(context.definition);

    return '''
mixin $mixinName on $extendType<$genericType> {
  $resolveMethod

  $mergeMethod

  $propsGetter

  $selfGetter

}
''';
  }
}
