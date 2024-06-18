// ignore_for_file: unnecessary-trailing-comma

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mix/annotations.dart';
// ignore_for_file: prefer_relative_imports
import 'package:mix_builder/src/helpers/field_info.dart';
import 'package:mix_builder/src/helpers/helpers.dart';
import 'package:source_gen/source_gen.dart';

class MixHelperRef {
  MixHelperRef._();

  static String get _refName => 'MixHelpers';

  static String get deepEquality => '$_refName.deepEquality';

  static String get lerpDouble => '$_refName.lerpDouble';

  static String get mergeList => '${_refName}.mergeList';

  static String get lerpStrutStyle => '$_refName.lerpStrutStyle';

  static String get lerpMatrix4 => '$_refName.lerpMatrix4';

  static String get lerpTextStyle => '$_refName.lerpTextStyle';
}

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
  });

  late final formatter = DartFormatter(pageWidth: 80, fixes: StyleFix.all);

  late final emitter = DartEmitter(
    orderDirectives: true,
    useNullSafetySyntax: true,
  );

  String get name => element.name;

  String get mixinExtensionName => '_\$${name}';

  String generate(String contents) {
    final code = Code(contents);

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
  });

  String get attributeClassName => '${name}Attribute';
}

class DtoAnnotationContext extends AnnotationContext<MixableDto> {
  DtoAnnotationContext({
    required super.element,
    required super.fields,
    required super.annotation,
  });
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
  // Check if element is a list
  if (element is ClassElement &&
      !type.isDartCoreList &&
      !type.isDartCoreMap &&
      !type.isDartCoreSet &&
      !type.isDartCoreObject) {
    return element.name;
  }
  return type.getDisplayString(withNullability: false);
}

String? getGenericsTypeNameFromDartType(DartType type) {
  if (type is ParameterizedType) {
    if (type.typeArguments.isEmpty) {
      return null;
    }
    final genericType = type.typeArguments.first;
    return getTypeNameFromDartType(genericType);
  }
  return null;
}

String getGenericTypeFromTypeName(String typeName) {
  return typeName.substring(
      typeName.indexOf('<') + 1, typeName.lastIndexOf('>'));
}

String getUtilityNameFromTypeName(String typeName) {
  // check if typeName ends with Utility
  // If not then add utility to it
  final utilityPostfix = 'Utility';
  final dtoPostfix = 'Dto';
  // TODO: improve this in the feature as
  // it can cause conflict
  final dtoList = 'DtoList';

  // if typename ends with Dto, remove it
  if (typeName.endsWith(dtoPostfix)) {
    typeName = typeName.substring(0, typeName.length - dtoPostfix.length);
  }

  // if typename ends with DtoList, remove it
  if (typeName.endsWith(dtoList)) {
    typeName = typeName.substring(0, typeName.length - dtoList.length) + 'List';
  }

  typeName = typeName.capitalize;

  if (!typeName.endsWith(utilityPostfix)) {
    return '${typeName}${utilityPostfix}';
  }
  return typeName;
}

String? getGenericTypeOfSuperclass(ClassElement classElement) {
  final supertype = classElement.supertype;
  if (supertype != null) {
    final typeArguments = supertype.typeArguments;
    if (typeArguments.isNotEmpty) {
      final genericType = typeArguments.first;
      return genericType.getDisplayString(withNullability: false);
    }
  }
  return null;
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
