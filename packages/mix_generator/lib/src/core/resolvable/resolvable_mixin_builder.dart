// lib/src/builders/dto/dto_mixin_builder.dart
import '../metadata/resolvable_metadata.dart';
import '../utils/code_builder.dart';
import '../utils/common_method_builder.dart';
import 'resolvable_method_builder.dart';

class ResolvableMixinBuilder extends CodeBuilder {
  final ResolvableMetadata metadata;

  ResolvableMixinBuilder(this.metadata);

  @override
  String build() {
    final mixinName = '_\$${metadata.name}';
    final resolvedTypeName = metadata.resolvedElement.name;

    // Check if custom methods are already defined
    final hasResolve = metadata.element.methods.any((m) => m.name == 'resolve');
    final hasMerge = metadata.element.methods.any((m) => m.name == 'merge');
    final hasProps = metadata.element.methods.any((m) => m.name == 'props');

    // Only generate methods that aren't already defined
    final resolveMethod = !hasResolve
        ? ResolvableMethods.generateResolveMethod(
            className: metadata.name,
            constructorRef: metadata.constructorRef,
            fields: metadata.parameters,
            isConst: metadata.isConst,
            resolvedType: resolvedTypeName,
            withDefaults: true,
            useInternalRef: true,
          )
        : '';

    final mergeMethod = !hasMerge
        ? ResolvableMethods.generateMergeMethod(
            className: metadata.name,
            fields: metadata.parameters,
            isAbstract: false,
            shouldMergeLists: metadata.mergeLists,
            useInternalRef: true,
            constructorRef: metadata.constructorRef,
          )
        : '';

    final propsGetter = !hasProps
        ? CommonMethods.generatePropsGetter(
            className: metadata.name,
            fields: metadata.parameters,
            useInternalRef: true,
          )
        : '';

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
