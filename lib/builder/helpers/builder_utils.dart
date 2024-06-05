// ignore_for_file: unnecessary-trailing-comma

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'annotations.dart';
import 'field_info.dart';
import 'validators.dart';

Future<List<ClassElement>> getAnnotatedClasses(
  BuildStep buildStep,
  TypeChecker annotationTypeChecker,
) async {
  final resolver = buildStep.resolver;
  final libraryElement = await resolver.libraryFor(buildStep.inputId);

  return libraryElement.units
      .expand((unit) => unit.classes)
      .where((classElement) =>
          annotationTypeChecker.hasAnnotationOfExact(classElement))
      .toList();
}

Future<List<SpecDefinitionContext>> loadSpecDefinitions(
  BuildStep buildStep,
) async {
  final annotatedClasses =
      await getAnnotatedClasses(buildStep, _specDefinitionTypeChecker);

  final contexts = <SpecDefinitionContext>[];

  for (final classElement in annotatedClasses) {
    final options = SpecDefinitionOptions.fromClassElement(classElement);
    if (options == null) {
      throw InvalidGenerationSourceError(
        'Spec definition must be annotated with @SpecDefinition()',
        element: classElement,
      );
    }

    contexts.add(
      SpecDefinitionContext._(buildStep: buildStep, options: options),
    );
  }

  return contexts;
}

const _specDefinitionTypeChecker = TypeChecker.fromRuntime(MixSpec);

class SpecDefinitionContext {
  final BuildStep buildStep;
  final SpecDefinitionOptions options;

  const SpecDefinitionContext._({
    required this.buildStep,
    required this.options,
  });

  AssetId get outputSpecFileId =>
      buildStep.inputId.changeExtension('_spec.g.dart');
  AssetId get outputUtilFileId =>
      buildStep.inputId.changeExtension('_util.g.dart');
  AssetId get outputAttributeFileId =>
      buildStep.inputId.changeExtension('_attribute.g.dart');
}

class SpecDefinitionOptions {
  final String name;
  final List<FieldInfo> fields;
  const SpecDefinitionOptions({required this.name, required this.fields});

  static SpecDefinitionOptions? fromClassElement(ClassElement classElement) {
    final annotation =
        _specDefinitionTypeChecker.firstAnnotationOfExact(classElement);

    if (annotation == null) {
      return null;
    }
    final name =
        annotation.getField('name')?.toStringValue() ?? classElement.name;

    final params = classElement.unnamedConstructor?.parameters ?? [];

    validateOrThrowHasAnyFields(classElement.fields);
    validOrThrowIfHasRequiredParameters(params);

    final fields = params
        .where((field) => !field.isSynthetic)
        .map(FieldInfo.fromParam)
        .toList()
      ..add(FieldInfo.animatedField())
      ..sort((a, b) => a.name.compareTo(b.name));

    return SpecDefinitionOptions(name: name, fields: fields);
  }

  String get specClassName => '${name}Spec';

  String get specAttributeClassName => '${specClassName}Attribute';

  String get specUtilClassName => '${specClassName}Utility';
}
