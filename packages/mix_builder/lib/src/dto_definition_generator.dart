// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_builder/src/helpers/helpers.dart';
import 'package:mix_builder/src/helpers/settings.dart';
import 'package:source_gen/source_gen.dart';

import 'helpers/builder_utils.dart';
import 'helpers/method_builders.dart';
import 'helpers/types.dart';

class DtoDefinitionBuilder extends GeneratorForAnnotation<MixableDto> {
  DtoDefinitionBuilder();

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader reader,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'The annotation can only be applied to a class.',
        element: element,
      );
    }

    final context = await _loadContext(
        element,
        DartEmitter(
          allocator: ReferenceTrackingAllocator(),
          orderDirectives: true,
          useNullSafetySyntax: true,
        ),
        DartFormatter());

    final dtoLibrary =
        Library((b) => b..body.addAll([MixinDtoBuilder(context)]));

    return context.generate(dtoLibrary);
  }
}

Mixin MixinDtoBuilder(DtoAnnotationContext context) {
  final className = context.dtoClassName;
  final mixinName = context.dtoClassMixinName;

  final fields = context.fields;

  final dtoRef = MixTypes.foundation.dto.symbol!;

  final element = context.element;

  // Find the supertype that matches Dto
  final dtoSupertype = element.allSupertypes.firstWhere(
    (supertype) =>
        (supertype.getDisplayString(withNullability: false)).startsWith('Dto<'),
    orElse: () => throw InvalidGenerationSourceError(
      'The class $className must extend Dto.',
      element: element,
    ),
  );

  // Get the generic type argument of Dto
  final valueType = dtoSupertype.typeArguments.first;

  final valueTypeName = valueType.getDisplayString(withNullability: false);

  final requiredParamOfResolver =
      _getRequiredParamsFromConstructor(valueType.element);

  return Mixin((b) {
    b.name = mixinName;
    b.on = refer('$dtoRef<$valueType>');

    b.methods.addAll([
      MethodResolveBuilder(
        resolveToType: valueTypeName,
        fields: fields,
        isInternalRef: true,
        requiredParamsOfResolver: requiredParamOfResolver,
      ),
      MethodMergeBuilder(
        className: className,
        context: context,
        isInternalRef: true,
        shouldMergeLists: context.annotation.mergeLists,
      ),
      GetterPropsBuilder(
        className: className,
        fields: fields,
        isInternalRef: true,
      ),
      GetterSelfBuilder(className: className),
      ...MethodPrivateHelpers(context)
    ]);
  });
}

Future<DtoAnnotationContext> _loadContext(
  ClassElement classElement,
  DartEmitter emitter,
  DartFormatter formatter,
) async {
  final annotation = _typeChecker.firstAnnotationOfExact(classElement)!;

  final fields = sortedConstructorFields(classElement, null);
  final context = DtoAnnotationContext(
    element: classElement,
    emitter: emitter,
    formatter: formatter,
    annotation: _readDtoAnnotation(Settings(), ConstantReader(annotation)),
    fields: fields,
  );

  return context;
}

const _typeChecker = TypeChecker.fromRuntime(MixableDto);

MixableDto _readDtoAnnotation(
  Settings settings,
  ConstantReader reader,
) {
  final shouldMergeLists = reader.read('mergeLists').boolValue;

  return MixableDto(
    mergeLists: shouldMergeLists,
  );
}

List<ParameterElement> _getRequiredParamsFromConstructor(Element? element) {
  if (element is! ClassElement) return [];
  // Get the unnamed constructor of the generic type
  final constructor = element.unnamedConstructor;

  if (constructor != null) {
    // Get the required fields from the constructor parameters
    final requiredFields = constructor.parameters
        .where((param) => param.isRequiredNamed)
        .map((param) => param)
        .toList();

    // Print the required fields (for demonstration purposes)
    return requiredFields;
  }
  return [];
}
