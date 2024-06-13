// ignore_for_file: unnecessary-trailing-comma

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mix/annotations.dart';
// ignore_for_file: prefer_relative_imports
import 'package:mix_builder/src/helpers/field_info.dart';
import 'package:mix_builder/src/helpers/private_class_helpers.dart';
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

abstract class AnnotationContext<T> {
  final ClassElement element;

  final List<ParameterInfo> fields;
  final DartFormatter formatter;
  final DartEmitter emitter;
  final T annotation;

  const AnnotationContext({
    required this.element,
    required this.fields,
    required this.formatter,
    required this.emitter,
    required this.annotation,
  });

  String get name => element.name;

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

class SpecAnnotationContext extends AnnotationContext<MixableSpec> {
  const SpecAnnotationContext({
    required super.element,
    required super.fields,
    required super.formatter,
    required super.emitter,
    required super.annotation,
  });

  String get specClassName => name;

  String get specClassMixinName => '_\$${specClassName}';

  String get specAttributeClassName => '${specClassName}Attribute';

  String get specUtilClassName => '${specClassName}Utility';
}

class DtoAnnotationContext extends AnnotationContext<MixableDto> {
  const DtoAnnotationContext({
    required super.element,
    required super.fields,
    required super.formatter,
    required super.emitter,
    required super.annotation,
  });

  String? get resolvedType =>
      element.allSupertypes.firstOrNull?.typeArguments.first
          .getDisplayString(withNullability: false);

  String get dtoClassName => name;

  String get dtoClassMixinName => '_\$${dtoClassName}';
}

Expression getLerpExpression(String name, String type) {
  final expression = [refer(name), refer('other.$name'), refer('t')];

  final isNullable = type.contains('?');

  final typeRef = isNullable ? type.replaceFirst('?', '') : type;

  switch (typeRef) {
    case 'double':
      return PrivateMethodHelper.lerpDoubleRef(expression);
    case 'StrutStyle':
      return PrivateMethodHelper.lerpStrutStyleRef(expression);
    case 'TextStyle':
      return PrivateMethodHelper.lerpTextStyleRef(expression);
    case 'Color':
      return DartTypes.ui.color.property('lerp')(expression);
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
      return CodeExpression(Code('''
$name != null && other.$name != null
      ? Matrix4Tween(begin: $name , end: other.$name).lerp(t)
      : t < 0.5 ? $name : other.$name
'''));

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
