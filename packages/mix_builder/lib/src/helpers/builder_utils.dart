// ignore_for_file: unnecessary-trailing-comma

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mix/annotations.dart';
import 'package:mix_builder/src/helpers/declaration_provider.dart';
// ignore_for_file: prefer_relative_imports
import 'package:mix_builder/src/helpers/field_info.dart';
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

  final T annotation;

  AnnotationContext({
    required this.element,
    required this.fields,
    required this.annotation,
    required this.declarationProvider,
  });

  final DeclarationProvider declarationProvider;
  late final formatter = DartFormatter();

  late final emitter = DartEmitter(
    orderDirectives: true,
    useNullSafetySyntax: true,
  );

  String get name => element.name;

  String get mixinExtensionName => '_\$${name}';

  String generate(String contents) {
    final methodHelpers = declarationProvider.applyMethods();

    final code = Code('''
$contents
$methodHelpers
''');

    final output = formatter.format('${code.accept(emitter)}');

    // Analyze output
    return output;
  }
}

class SpecAnnotationContext extends AnnotationContext<MixableSpec> {
  SpecAnnotationContext({
    required super.element,
    required super.fields,
    required super.annotation,
    required super.declarationProvider,
  });

  String get attributeClassName => '${name}Attribute';
}

class DtoAnnotationContext extends AnnotationContext<MixableDto> {
  DtoAnnotationContext({
    required super.element,
    required super.fields,
    required super.annotation,
    required super.declarationProvider,
  });

  String? get resolvedType =>
      element.allSupertypes.firstOrNull?.typeArguments.first
          .getDisplayString(withNullability: false);
}

extension ReferenceExt on Reference {
  TypeReference get nullable {
    return TypeReference((b) => b
      ..symbol = symbol
      ..url = url
      ..isNullable = true);
  }
}

String getTypeNameFromDartType(DartType type) {
  final element = type.element;
  if (element is ClassElement) {
    return element.name;
  }
  return type.getDisplayString(withNullability: false);
}

bool _checkIfTypeStartsWith(InterfaceType type, String typeName) {
  return type.getDisplayString(withNullability: false).startsWith(typeName);
}

String kDefaultValueRef = 'defaultValue';

bool checkIfElementIsDto(InterfaceType type) {
  if (_checkIfTypeStartsWith(type, 'Dto')) {
    return true;
  }

  for (final supertype in type.allSupertypes) {
    final superTypeIsDto = checkIfElementIsDto(supertype);

    if (superTypeIsDto) {
      return true;
    }
  }

  return false;
}
