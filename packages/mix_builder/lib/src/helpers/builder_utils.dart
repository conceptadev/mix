// ignore_for_file: unnecessary-trailing-comma

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_builder/src/helpers/field_info.dart';
import 'package:mix_builder/src/helpers/helpers.dart';
import 'package:mix_builder/src/types.dart';
import 'package:source_gen/source_gen.dart';

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
  DartEmitter emitter,
  DartFormatter formatter,
) async {
  final annotatedClasses =
      await getAnnotatedClasses(buildStep, _specDefinitionTypeChecker);

  final contexts = <SpecDefinitionContext>[];

  for (final classElement in annotatedClasses) {
    final annotation =
        _specDefinitionTypeChecker.firstAnnotationOfExact(classElement)!;

    final fields = sortedConstructorFields(classElement, null);
    final specDefinition = SpecDefinitionContext(
      emitter: emitter,
      formatter: formatter,
      fields: fields,
      options: SpecDefinitionOptions(
        name: annotation.getField('name')?.toStringValue() ?? classElement.name,
      ),
    );

    contexts.add(specDefinition);
  }

  return contexts;
}

const _specDefinitionTypeChecker = TypeChecker.fromRuntime(MixSpec);

class SpecDefinitionContext {
  final SpecDefinitionOptions options;
  final List<ParameterInfo> fields;
  final DartFormatter formatter;
  final DartEmitter emitter;

  const SpecDefinitionContext({
    required this.options,
    required this.fields,
    required this.formatter,
    required this.emitter,
  });
}

class SpecDefinitionOptions {
  final String name;

  const SpecDefinitionOptions({
    required this.name,
  });

  String get specClassName => '${name}';

  String get specClassMixinName => '${specClassName}Mixin';

  String get specAttributeClassName => '${specClassName}Attribute';

  String get specUtilClassName => '${specClassName}Utility';
}

Expression getLerpExpression(String name, String type) {
  final expression = [refer(name), refer('other.$name'), refer('t')];

  final isNullable = type.contains('?');

  final typeRef = isNullable ? type.replaceFirst('?', '') : type;

  switch (typeRef) {
    case 'double':
      return DartTypes.ui.lerpDouble(expression);
    case 'int':
      return DartTypes.ui
          .lerpDouble(expression)
          .nullSafeProperty('toInt')
          .call([]).nullSafeProperty(name);
    case 'EdgeInsetsGeometry':
      return FlutterTypes.widgets.edgeInsetsGeometry
          .property('lerp')(expression);
    case 'BoxConstraints':
      return FlutterTypes.widgets.boxConstraints.property('lerp')(expression);
    case 'Decoration':
      return FlutterTypes.widgets.decoration.property('lerp')(expression);
    case 'AlignmentGeometry':
      return FlutterTypes.widgets.alignmentGeometry
          .property('lerp')(expression);
    case 'Matrix4':
      return FlutterTypes.widgets.matrix4Tween
          .newInstance(
            [],
            {'begin': refer(name), 'end': refer('other.$name')},
          )
          .property('lerp')
          .call([refer('t')]);

    default:
      return CodeExpression(Code('t < 0.5 ? $name : other.$name'));
  }
}
