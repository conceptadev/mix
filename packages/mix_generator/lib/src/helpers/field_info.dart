import 'package:analyzer/dart/element/element.dart'
    show ClassElement, FieldElement, ParameterElement, ConstructorElement;
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generator/src/helpers/annotation_helpers.dart';
import 'package:mix_generator/src/helpers/builder_utils.dart';
import 'package:mix_generator/src/helpers/dart_type_ext.dart';
import 'package:mix_generator/src/helpers/type_ref_repository.dart';

typedef MixTypeReferences = ({String utility, String lerp, String dto});

/// Class field info relevant for code generation.
class FieldInfo {
  FieldInfo({
    required this.name,
    required this.type,
    required this.dartType,
    required this.documentationComment,
    required this.annotation,
    required this.nullable,
  });

  /// Parameter / field type.
  final String name;

  final DartType dartType;

  final MixableProperty annotation;

  final String? documentationComment;

  /// Dart type of the field
  final String type;

  String get typeWithNullability => type + (nullable ? '?' : '');

  final bool nullable;

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

  String toString() => 'FieldInfo(name: $name, type: $type)';

  factory FieldInfo.ofElement(FieldElement element) {
    return FieldInfo(
      name: element.name,
      dartType: element.type,
      type: element.type.getTypeAsString(),
      nullable: element.type.isNullableType,
      annotation: readMixableProperty(element),
      documentationComment: element.documentationComment,
    );
  }
}

class ParameterInfo extends FieldInfo {
  ParameterInfo({
    required super.name,
    required super.type,
    required super.nullable,
    required this.isSuper,
    required this.isPositional,
    required super.dartType,
    required super.annotation,
    required super.documentationComment,
    required this.isRequiredNamed,
    required this.isRequiredPositional,
  });

  static const internalRefPrefix = '_\$this';

  String get asInternalRef => '$internalRefPrefix.$name';

  final bool isSuper;
  final bool isPositional;
  final bool isRequiredNamed;
  final bool isRequiredPositional;

  bool get isRequired => isRequiredNamed || isRequiredPositional;

  factory ParameterInfo.ofElement(ParameterElement element) {
    final fieldInfo = getFieldInfoFromParameter(element);

    final isNullable =
        element.type.nullabilitySuffix == NullabilitySuffix.question;

    return ParameterInfo(
      name: element.name,
      dartType: element.type,
      type: element.type.getDisplayString(withNullability: false),
      nullable: fieldInfo?.nullable ?? isNullable,
      isSuper: element.isSuperFormal,
      isRequiredNamed: element.isRequiredNamed,
      isRequiredPositional: element.isRequiredPositional,
      isPositional: element.isPositional,
      documentationComment: fieldInfo?.documentationComment,
      annotation: fieldInfo?.annotation ?? MixableProperty(),
    );
  }
}

class ClassInfo {
  ClassInfo({
    required this.name,
    required this.fields,
    this.isBase = false,
    this.isFinal = false,
    this.isConst = false,
    this.isInternalRef = false,
    this.constructorName = '',
    this.mixinTypes = const [],
    this.extendsType = '',
    this.genericTypes = const [],
  });

  final String name;
  final List<ParameterInfo> fields;
  final bool isBase;
  final bool isFinal;
  final bool isInternalRef;
  final List<String> mixinTypes;
  final String extendsType;
  final List<String> genericTypes;

  final bool isConst;
  final String constructorName;

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

  String get constructorRef =>
      constructorName.isEmpty ? '' : '.$constructorName';

  factory ClassInfo.ofElement(
    ClassElement element, {
    bool internalRef = false,
  }) {
    final constructor = element.defaultConstructor;
    return ClassInfo(
      name: element.name,
      isFinal: element.isFinal,
      isBase: element.isBase,
      isConst: element.isConst,
      isInternalRef: internalRef,
      constructorName: constructor.name,
      mixinTypes: element.mixins
          .map((e) => e.getDisplayString(withNullability: false))
          .toList(),
      fields: constructor.parameters.map(ParameterInfo.ofElement).toList(),
    );
  }
}

FieldInfo? getFieldInfoFromParameter(
  ParameterElement parameter,
) {
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
    name: field.name,
    type: field.type.getDisplayString(withNullability: false),
    dartType: field.type,
    nullable: field.type.isNullableType,
    annotation: annotation,
    documentationComment: field.documentationComment,
  );
}

class ClassBuilderContext<T> {
  List<ParameterInfo>? _fieldsCache;

  ClassBuilderContext({
    required this.classElement,
    required this.annotation,
  });

  final ClassElement classElement;
  final T annotation;

  List<ParameterInfo> get fields {
    if (_fieldsCache != null) return _fieldsCache!;

    return _fieldsCache =
        constructor.parameters.map(ParameterInfo.ofElement).toList();
  }

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

  String get generatedName => '_\$${name}';

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

  String get _prefix =>
      annotation.prefix.isEmpty ? name : '${annotation.prefix}';
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
