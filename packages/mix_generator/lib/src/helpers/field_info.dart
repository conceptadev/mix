import 'package:analyzer/dart/element/element.dart'
    show ClassElement, FieldElement, ParameterElement, ConstructorElement;
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';
import 'package:mix_annotations/mix_annotations.dart';

import 'annotation_helpers.dart';
import 'builder_utils.dart';
import 'dart_type_ext.dart';
import 'type_ref_repository.dart';

/// Provides information about a field or parameter for code generation.
///
/// This class can represent either a class field or a constructor parameter, or both
/// when a parameter corresponds to a field. It provides convenient access to type
/// information, annotations, and other metadata needed during code generation.
class ParameterInfo {
  /// Prefix used for internal references in generated code
  static const String internalRefPrefix = '_\$this';

  /// The name of the field or parameter
  final String name;

  /// The Dart type of the field or parameter
  final DartType dartType;

  /// The annotation associated with this field or parameter
  final MixableProperty annotation;

  /// Documentation comment, if any
  final String? documentationComment;

  /// Whether the field or parameter has a @deprecated annotation
  final bool hasDeprecated;

  /// Whether this is a super parameter
  final bool isSuper;

  /// Whether this is a positional parameter
  final bool isPositional;

  /// Whether this parameter is required (either named or positional)
  final bool isRequired;

  final bool nullable;

  /// Creates a new FieldInfo instance.
  const ParameterInfo({
    required this.name,
    required this.dartType,
    required this.annotation,
    this.documentationComment,
    required this.hasDeprecated,
    required this.nullable,
    this.isSuper = false,
    this.isPositional = false,
    this.isRequired = false,
  });

  /// Creates a FieldInfo from a class field element.
  factory ParameterInfo.fromField(FieldElement element) {
    return ParameterInfo(
      name: element.name,
      dartType: element.type,
      annotation: readMixableProperty(element),
      documentationComment: element.documentationComment,
      hasDeprecated: element.hasDeprecated,
      nullable: element.type.nullabilitySuffix == NullabilitySuffix.question,
    );
  }

  /// Creates a FieldInfo from a constructor parameter element.
  ///
  /// If the parameter corresponds to a class field, that field's information
  /// will be incorporated into the FieldInfo.
  factory ParameterInfo.fromParameter(ParameterElement element) {
    final existingFieldInfo = _getFieldInfoFromParameter(element);

    final isNullable =
        element.type.nullabilitySuffix == NullabilitySuffix.question;

    return ParameterInfo(
      name: element.name,
      dartType: element.type,
      annotation: existingFieldInfo?.annotation ?? const MixableProperty(),
      documentationComment: existingFieldInfo?.documentationComment,
      hasDeprecated: existingFieldInfo?.hasDeprecated ?? element.hasDeprecated,
      nullable: existingFieldInfo?.nullable ?? isNullable,
      isSuper: element.isSuperFormal,
      isPositional: element.isPositional,
      isRequired: element.isRequiredNamed || element.isRequiredPositional,
    );
  }

  /// The type name as a string.
  String get type => dartType.getDisplayString(withNullability: false);

  /// Type with nullability marker (e.g. "String" or "String?").
  String get typeWithNullability => type + (nullable ? '?' : '');

  /// Whether the type is dynamic.
  bool get isDynamic => dartType is DynamicType;

  /// Whether the type is a List.
  bool get isListType => dartType.isDartCoreList;

  /// Whether the type is a Map.
  bool get isMapType => dartType.isDartCoreMap;

  /// Whether the type is a Set.
  bool get isSetType => dartType.isDartCoreSet;

  /// Returns the DTO type associated with this field, if any.
  String? get dtoType =>
      annotation.dto?.typeAsString ?? typeRefs.getDto(dartType);

  /// Whether this field has a DTO type.
  bool get hasDto => dtoType != null;

  /// Returns an internal reference to this field or parameter.
  String get asInternalRef => '$internalRefPrefix.$name';
}

/// Gets field information from a constructor parameter by finding its corresponding field.
ParameterInfo? _getFieldInfoFromParameter(ParameterElement parameter) {
  final element = parameter.enclosingElement;
  if (element is! ConstructorElement) return null;

  final classElement = element.enclosingElement as ClassElement;

  FieldElement? field;
  ClassElement? currentClass = classElement;

  while (currentClass != null) {
    field =
        currentClass.fields.firstWhereOrNull((e) => e.name == parameter.name);

    if (field != null) break;

    currentClass = currentClass.supertype?.element as ClassElement?;
  }

  return field != null ? ParameterInfo.fromField(field) : null;
}

class AnnotatedClassBuilderContext<T> {
  final T annotation;
  final List<ParameterInfo> fields;

  final ConstructorElement constructor;
  final ClassElement _element;

  AnnotatedClassBuilderContext({
    required ClassElement element,
    required this.annotation,
  })  : _element = element,
        fields = element.defaultConstructor.parameters
            .map(ParameterInfo.fromParameter)
            .toList(),
        constructor = element.defaultConstructor;

  ClassElement get classElement => _element;

  ClassDefinition get definition => ClassDefinition.fromClassElement(_element);

  String get name => _element.name;

  String get constructorRef =>
      constructor.name.isEmpty ? '' : '.${constructor.name}';

  bool get isDiagnosticable => _element.hasDiagnosticable;

  bool get isConst => _element.isConst;

  String get genericSuperType => _element.genericSuperType.name;

  bool hasMethod(String methodName) =>
      _element.methodNames.contains(methodName);
}

extension AnnotatedDtoClassBuilderContextExt
    on AnnotatedClassBuilderContext<MixableDto> {
  ClassElement? get resolvedType =>
      _element.getGenericTypeOfSuperclass()?.element as ClassElement?;
}

extension AnnotatedSpecClassBuilderContextExt
    on AnnotatedClassBuilderContext<MixableSpec> {
  bool get isModifierSpec => _element.thisType.isWidgetModifier;
}

class ClassDefinition {
  final String name;
  final List<ParameterInfo> fields;
  final bool isConst;
  final bool isBase;
  final bool isDiagnosticable;
  final bool isAbstract;
  final bool isFinal;

  final String genericType;

  final String extendTypes;

  final String _constructorName;

  const ClassDefinition({
    required this.name,
    String constructorName = '',
    this.fields = const [],
    String mixinTypes = '',
    this.extendTypes = '',
    String body = '',
    this.genericType = '',
    this.isAbstract = false,
    this.isConst = false,
    this.isBase = false,
    this.isFinal = false,
    this.isDiagnosticable = false,
  }) : _constructorName = constructorName;

  static ClassDefinition fromClassElement(ClassElement element) {
    return ClassDefinition(
      name: element.name,
      constructorName: element.defaultConstructor.name,
      fields: element.defaultConstructor.parameters
          .map(ParameterInfo.fromParameter)
          .toList(),
      mixinTypes: element.mixinNames.join(', '),
      extendTypes: element.interfaceNames.join(', '),
      isAbstract: element.isAbstract,
      isConst: element.isConst,
      isBase: element.isBase,
      isFinal: element.isFinal,
      isDiagnosticable: element.hasDiagnosticable,
    );
  }

  String get constructorRef =>
      _constructorName.isEmpty ? '' : '.$_constructorName';

  String writeConstructor([String? parameters, String? superParameters]) {
    final constDef = isConst ? 'const ' : '';

    parameters ??= '';

    final hasSuper = superParameters != null && superParameters.isNotEmpty;
    final superCall = hasSuper ? ' : super($superParameters)' : '';

    return '$constDef$name$constructorRef($parameters)$superCall;';
  }

  String writeDeclaration() {
    final bufferString = StringBuffer();

    if (isFinal) {
      bufferString.write('final ');
    }

    if (isBase) {
      bufferString.write('base ');
    }

    bufferString.write('class $name');

    if (genericType.isNotEmpty) {
      bufferString.write(genericType);
    }

    bufferString.write(' ');

    if (extendTypes.isNotEmpty) {
      bufferString.write('extends $extendTypes ');
    }

    if (isDiagnosticable) {
      bufferString.write('with Diagnosticable ');
    }

    return bufferString.toString();
  }
}

class ClassBuilder {
  final ClassDefinition definition;
  final String classContent;

  const ClassBuilder(this.definition, this.classContent);

  String build() {
    return '''
    $classContent
    ''';
  }
}
