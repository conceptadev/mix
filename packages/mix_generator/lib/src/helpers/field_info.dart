import 'package:analyzer/dart/element/element.dart'
    show ClassElement, FieldElement, ParameterElement, ConstructorElement;
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';
import 'package:mix_annotations/mix_annotations.dart';

import 'annotation_helpers.dart';
import 'builder_utils.dart';
import 'dart_type_ext.dart';
import 'type_ref_repository.dart';

typedef MixTypeReferences = ({String utility, String lerp, String dto});

/// Class field info relevant for code generation.
class FieldInfo {
  /// Parameter / field type.
  final String name;

  final FieldElement? fieldElement;

  final DartType dartType;

  final bool hasDeprecated;

  final MixableProperty annotation;

  final String? documentationComment;

  /// Dart type of the field
  final String type;

  final bool nullable;

  const FieldInfo({
    required this.fieldElement,
    required this.name,
    required this.type,
    required this.dartType,
    required this.documentationComment,
    required this.annotation,
    required this.nullable,
    required this.hasDeprecated,
  });

  factory FieldInfo.ofElement(FieldElement element) {
    return FieldInfo(
      fieldElement: element,
      name: element.name,
      type: element.type.getTypeAsString(),
      dartType: element.type,
      documentationComment: element.documentationComment,
      annotation: readMixableProperty(element),
      nullable: element.type.isNullableType,
      hasDeprecated: element.hasDeprecated,
    );
  }
  String get typeWithNullability => type + (nullable ? '?' : '');

  /// Returns whether the field has a DTO type associated with it.
  bool get hasDto => dtoType != null;

  bool get isDto => dartType.isDto;

  bool get isSpec => dartType.isSpec;

  bool get isListType => dartType.isDartCoreList;

  bool get isMapType => dartType.isDartCoreMap;

  bool get isSetType => dartType.isDartCoreSet;

  /// Returns the DTO type associated with the field, if any.
  /// If a DTO type is explicitly specified in the `MixProperty` annotation, that is returned.
  /// Otherwise, the DTO type is inferred from the field type using a mapping defined in `_dtoMap`.

  String? get dtoType {
    if (annotation.dto?.typeAsString != null) {
      return annotation.dto!.typeAsString!;
    }

    return typeRefs.getDto(dartType);
  }

  /// True if the type is `dynamic`.
  bool get isDynamic => type == 'dynamic';

  @override
  String toString() => 'FieldInfo(name: $name, type: $type)';
}

class ParameterInfo extends FieldInfo {
  static const internalRefPrefix = '_\$this';

  final bool isSuper;
  final bool isPositional;
  final bool isRequiredNamed;
  final bool isRequiredPositional;

  final ParameterElement element;

  const ParameterInfo({
    required super.name,
    required super.type,
    required super.nullable,
    required this.isSuper,
    required this.isPositional,
    required super.dartType,
    required super.annotation,
    required super.documentationComment,
    required super.hasDeprecated,
    required this.isRequiredNamed,
    required this.isRequiredPositional,
    required this.element,
    required super.fieldElement,
  });

  factory ParameterInfo.ofElement(ParameterElement element) {
    final fieldInfo = getFieldInfoFromParameter(element);

    final isNullable =
        element.type.nullabilitySuffix == NullabilitySuffix.question;

    return ParameterInfo(
      name: element.name,
      type: element.type.getDisplayString(withNullability: false),
      nullable: fieldInfo?.nullable ?? isNullable,
      isSuper: element.isSuperFormal,
      isPositional: element.isPositional,
      dartType: element.type,
      annotation: fieldInfo?.annotation ?? const MixableProperty(),
      documentationComment: fieldInfo?.documentationComment,
      hasDeprecated:
          (fieldInfo?.hasDeprecated ?? false) || element.hasDeprecated,
      isRequiredNamed: element.isRequiredNamed,
      isRequiredPositional: element.isRequiredPositional,
      element: element,
      fieldElement: fieldInfo?.fieldElement,
    );
  }
  String get asInternalRef => '$internalRefPrefix.$name';

  bool get isRequired => isRequiredNamed || isRequiredPositional;
}

class ClassInfo {
  final String name;
  final List<ParameterInfo> fields;
  final bool isBase;
  final bool isFinal;
  final bool isInternalRef;
  final Set<String> mixinTypes;
  final String extendsType;
  final Set<String> methods;
  final Set<String> genericTypes;

  final bool isConst;
  final String constructorName;

  const ClassInfo({
    required this.name,
    required this.fields,
    this.isBase = false,
    this.isFinal = false,
    this.isConst = false,
    this.isInternalRef = false,
    this.constructorName = '',
    this.mixinTypes = const {},
    this.extendsType = '',
    this.genericTypes = const {},
    this.methods = const {},
  });

  factory ClassInfo.ofElement(
    ClassElement element, {
    bool asInternalRef = false,
  }) {
    final constructor = element.defaultConstructor;

    return ClassInfo(
      name: element.name,
      fields: constructor.parameters.map(ParameterInfo.ofElement).toList(),
      isBase: element.isBase,
      isFinal: element.isFinal,
      isConst: element.isConst,
      isInternalRef: asInternalRef,
      constructorName: constructor.name,
      mixinTypes: element.mixins
          .map((e) => e.getDisplayString(withNullability: false))
          .toSet(),
      methods: element.methods.map((e) => e.name).toSet(),
    );
  }
  String get constructorRef =>
      constructorName.isEmpty ? '' : '.$constructorName';

  ClassInfo copyWith({
    String? name,
    List<ParameterInfo>? fields,
    bool? isBase,
    bool? isFinal,
    bool? isConst,
    bool? isInternalRef,
    String? constructorName,
    Set<String>? mixinTypes,
    String? extendsType,
    Set<String>? genericTypes,
    Set<String>? methods,
  }) {
    return ClassInfo(
      name: name ?? this.name,
      fields: fields ?? this.fields,
      isBase: isBase ?? this.isBase,
      isFinal: isFinal ?? this.isFinal,
      isConst: isConst ?? this.isConst,
      isInternalRef: isInternalRef ?? this.isInternalRef,
      constructorName: constructorName ?? this.constructorName,
      mixinTypes: mixinTypes ?? this.mixinTypes,
      extendsType: extendsType ?? this.extendsType,
      genericTypes: genericTypes ?? this.genericTypes,
      methods: methods ?? this.methods,
    );
  }

  bool hasMethod(String name) => methods.contains(name);

  String writeConstructor() {
    return '$name$constructorRef';
  }

  String writeDefinition() {
    final bufferString = StringBuffer();

    if (isFinal) {
      bufferString.write('final ');
    }

    if (isBase) {
      bufferString.write('base ');
    }

    bufferString.write('class $name ');

    if (genericTypes.isNotEmpty) {
      bufferString.write('<${genericTypes.join(', ')}> ');
    }

    if (extendsType.isNotEmpty) {
      bufferString.write('extends $extendsType ');
    }

    if (mixinTypes.isNotEmpty) {
      bufferString.write('with ${mixinTypes.join(', ')} ');
    }

    return bufferString.toString();
  }
}

FieldInfo? getFieldInfoFromParameter(ParameterElement parameter) {
  final element = parameter.enclosingElement;

  if (element is! ConstructorElement) {
    throw ArgumentError('Parameter needs to be a constructor element');
  }
  final classElement = element.enclosingElement as ClassElement;

  FieldElement? field;
  ClassElement? currentClass = classElement;

  while (currentClass != null) {
    field = currentClass.fields
        .where((e) => e.name == parameter.name)
        .fold<FieldElement?>(null, (previousValue, element) => element);

    if (field != null) {
      break;
    }

    final supertype = currentClass.supertype;
    if (supertype != null) {
      currentClass = supertype.element as ClassElement?;
    } else {
      currentClass = null;
    }
  }

  if (field == null) return null;

  final annotation = readMixableProperty(field);

  return FieldInfo(
    fieldElement: field,
    name: field.name,
    type: field.type.getTypeAsString(),
    dartType: field.type,
    documentationComment: field.documentationComment,
    annotation: annotation,
    nullable: field.type.isNullableType,
    hasDeprecated: field.hasDeprecated,
  );
}

class ClassBuilderContext<T> {
  final ClassElement classElement;
  final T annotation;

  List<ParameterInfo>? _fieldsCache;

  ClassBuilderContext({
    required this.classElement,
    required this.annotation,
  });

  List<ParameterInfo> get constructorParameters {
    if (_fieldsCache != null) return _fieldsCache!;

    return _fieldsCache =
        constructor.parameters.map(ParameterInfo.ofElement).toList();
  }

  bool get hasDiagnosticable =>
      classElement.allSupertypes.any((e) => e.element.name == 'Diagnosticable');

  ConstructorElement get constructor {
    final defaultContructor = classElement.constructors.firstWhereOrNull(
      (element) =>
          element.isDefaultConstructor ||
          element.isPrivateConstructor ||
          element.isUnamedConstructor,
    );

    return defaultContructor ?? classElement.unnamedConstructor!;
  }

  Set<String> get superTypes =>
      classElement.allSupertypes.map((e) => e.element.name).toSet();

  String get name => classElement.name;

  /// Class Context is being used in an internal Mix class
  bool get isMixInternal => classElement.isMixRef;
  bool get isConst => classElement.isConst;

  String get dtoName => '${name}Dto';

  String get generatedName => '_\$$name';

  String get constructorRef =>
      constructor.name.isEmpty ? '' : '.${constructor.name}';

  bool get isBase => classElement.isBase;
  bool get isFinal => classElement.isFinal;
  bool get isAbstract => classElement.isAbstract;
}

extension ClassContextSpecX on ClassBuilderContext<MixableSpec> {
  String get specType => classElement.isWidgetModifier
      ? MixType.widgetModifierSpec.name
      : MixType.spec.name;

  String get _prefix => annotation.prefix.isEmpty ? name : annotation.prefix;
  String get attributeName => '${_prefix}Attribute';
  String get utilityName => '${_prefix}Utility';
  String get tweenClassName => '${_prefix}Tween';

  String get attributeExtendsType => '${specType}Attribute<$name>';
}

extension ClassContextDtoX on ClassBuilderContext<MixableDto> {
  bool get mergeLists => annotation.mergeLists;
  bool get generateValueExtension => annotation.generateValueExtension;
  bool get generateUtility => annotation.generateUtility;
  ClassElement get referenceClass =>
      classElement.getGenericTypeOfSuperclass()!.element as ClassElement;
}

enum MixType {
  dto('Dto'),
  spec('Spec'),
  utility('Utility'),
  widgetModifierSpec('WidgetModifierSpec');

  const MixType(this.name);

  final String name;
}
