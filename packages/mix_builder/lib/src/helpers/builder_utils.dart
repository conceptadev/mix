// ignore_for_file: unnecessary-trailing-comma

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_builder/src/helpers/field_info.dart';
import 'package:mix_builder/src/helpers/helpers.dart';
import 'package:mix_builder/src/helpers/types.dart';
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

class ReferenceTrackingAllocator implements Allocator {
  final Set<Reference> _usedReferences = {};

  @override
  String allocate(Reference reference) {
    _usedReferences.add(reference);
    return reference.symbol!;
  }

  bool hasReference(Reference reference) {
    return _usedReferences.contains(reference);
  }

  @override
  Iterable<Directive> get imports => const [];
}

Future<SpecDefinitionContext> loadSpecDefinitions(
  ClassElement classElement,
  DartEmitter emitter,
  DartFormatter formatter,
) async {
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

  return specDefinition;
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

  bool hasReference(Reference reference) {
    return (emitter.allocator as ReferenceTrackingAllocator)
        .hasReference(reference);
  }

  String generate(Library library) {
    final output = formatter.format('${library.accept(emitter)}');

    // Analyze output
    return output;
  }
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
      return HelperTypes.lerpDouble(expression);
    case 'int':
      return HelperTypes.lerpInt(expression);
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

extension ReferenceExt on Reference {
  TypeReference get nullable {
    return TypeReference((b) => b
      ..symbol = symbol
      ..url = url
      ..isNullable = true);
  }
}
