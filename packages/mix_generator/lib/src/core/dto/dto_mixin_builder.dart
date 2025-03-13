// lib/src/builders/dto/dto_mixin_builder.dart
import '../models/dto_metadata.dart';
import '../utils/code_builder.dart';
import '../utils/method_generators.dart';

class DtoMixinBuilder extends CodeBuilder {
  final DtoMetadata metadata;

  DtoMixinBuilder(this.metadata);

  @override
  String build() {
    final mixinName = '_\$${metadata.name}';
    final resolvedTypeName = metadata.resolvedType.name;

    // Check if custom methods are already defined
    final hasResolve = metadata.element.methods.any((m) => m.name == 'resolve');
    final hasMerge = metadata.element.methods.any((m) => m.name == 'merge');
    final hasProps = metadata.element.methods.any((m) => m.name == 'props');

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

    final propsGetter = !hasProps
        ? MethodGenerators.generatePropsGetter(
            className: metadata.name,
            fields: metadata.fields,
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

// lib/src/builders/dto/dto_extension_builder.dart
class DtoExtensionBuilder extends CodeBuilder {
  final DtoMetadata metadata;

  DtoExtensionBuilder(this.metadata);

  @override
  String build() {
    final className = metadata.name;
    final resolvedTypeName = metadata.resolvedType.name;

    final fieldStatements = metadata.fields.map((field) {
      final fieldName = field.name;

      if (field.hasDto) {
        final paramIsNullable = field.nullable;
        final fieldNameRef = paramIsNullable ? '$fieldName?' : fieldName;

        if (field.isListType) {
          return '$fieldName: $fieldNameRef.map((e) => e.toDto()).toList(),';
        }

        return '$fieldName: $fieldNameRef.toDto(),';
      }

      return '$fieldName: $fieldName,';
    }).join('\n      ');

    return '''
/// Extension methods to convert [$resolvedTypeName] to [$className].
extension ${resolvedTypeName}MixExt on $resolvedTypeName {
  /// Converts this [$resolvedTypeName] to a [$className].
  $className toDto() {
    return $className(
      $fieldStatements
    );
  }
}

/// Extension methods to convert List<[$resolvedTypeName]> to List<[$className]>.
extension List${resolvedTypeName}MixExt on List<$resolvedTypeName> {
  /// Converts this List<[$resolvedTypeName]> to a List<[$className]>.
  List<$className> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
''';
  }
}
