// lib/src/builders/dto/dto_mixin_builder.dart
import '../metadata/dto_metadata.dart';
import '../utils/code_builder.dart';
import '../utils/method_generators.dart';

class DtoMixinBuilder extends CodeBuilder {
  final DtoMetadata metadata;

  DtoMixinBuilder(this.metadata);

  @override
  String build() {
    final mixinName = '_\$${metadata.name}';
    final resolvedTypeName = metadata.resolvedType.name;

    print(
      'Building DTO mixin for ${metadata.name} (resolved type: $resolvedTypeName)',
    );

    // Check if custom methods are already defined
    final hasResolve = metadata.element.methods.any((m) => m.name == 'resolve');
    final hasMerge = metadata.element.methods.any((m) => m.name == 'merge');
    final hasProps = metadata.element.methods.any((m) => m.name == 'props');

    print(
      '  Custom methods defined: resolve=$hasResolve, merge=$hasMerge, props=$hasProps',
    );

    // Only generate methods that aren't already defined
    final resolveMethod = !hasResolve
        ? MethodGenerators.generateResolveMethod(
            className: metadata.name,
            constructorRef: '',
            fields: metadata.fields,
            isConst: metadata.isConst,
            resolvedType: resolvedTypeName,
            withDefaults: true,
            useInternalRef: true,
          )
        : '';

    final mergeMethod = !hasMerge
        ? MethodGenerators.generateMergeMethod(
            className: metadata.name,
            fields: metadata.fields,
            isAbstract: false,
            shouldMergeLists: metadata.mergeLists,
            useInternalRef: true,
          )
        : '';

    if (hasMerge) {
      print('  Using custom merge method defined in ${metadata.name}');
    } else {
      print('  Generated merge method for ${metadata.name}');
    }

    final propsGetter = !hasProps
        ? MethodGenerators.generatePropsGetter(
            className: metadata.name,
            fields: metadata.fields,
            useInternalRef: true,
          )
        : '';

    print('  Mixin generation complete for ${metadata.name}');

    return '''
/// A mixin that provides DTO functionality for [${metadata.name}].
mixin $mixinName on Dto<$resolvedTypeName> {
  $resolveMethod

  $mergeMethod

  $propsGetter

  /// Returns this instance as a [${metadata.name}].
  ${metadata.name} get _\$this => this as ${metadata.name};
}
''';
  }
}
