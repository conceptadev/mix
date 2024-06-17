import 'package:analyzer/dart/constant/value.dart' show DartObject;
import 'package:analyzer/dart/element/element.dart'
    show
        ClassElement,
        FieldElement,
        ParameterElement,
        ConstructorElement,
        Element;
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:mix/annotations.dart';
import 'package:mix_builder/src/helpers/helpers.dart';
// ignore_for_file: prefer_relative_imports
import 'package:source_gen/source_gen.dart' show ConstantReader, TypeChecker;

typedef MixTypeReferences = ({String utility, String lerp, String dto});

final _utilityOverrides = {
  'EdgeInsetsGeometry': 'SpacingUtility',
  'AnimatedData': 'AnimatedUtility',
};

final _dtoMap = {
  'EdgeInsetsGeometry': 'SpacingDto',
  'BoxConstraints': 'BoxConstraintsDto',
  'Decoration': 'DecorationDto',
  'Color': 'ColorDto',
  'AnimatedData': 'AnimatedDataDto',
  'TextStyle': 'TextStyleDto',
  'ShapeBorder': 'ShapeBorderDto',
  'StrutStyle': 'StrutStyleDto',
  'Shadow': 'ShadowDto',
  'BoxShadow': 'BoxShadowDto',
  'Gradient': 'GradientDto',
  'List<Shadow>': 'List<ShadowDto>',
  'List<Color>': 'List<ColorDto>',
  'BoxBorder': 'BoxBorderDto',
  'BorderSide': 'BorderSideDto',
  'BorderRadius': 'BorderRadiusDto',
  'BorderRadiusGeometry': 'BorderRadiusGeometryDto',
  'BorderRadiusDirectional': 'BorderRadiusDirectionalDto',
  'TextDirective': 'TextDirectiveDto',
  'DecorationImage': 'DecorationImageDto',
  'LinearBorderEdge': 'LinearBorderEdgeDto',
};

/// Replace keys and values from teh _dtoMap
final _invertedDtoMap = {
  for (var entry in _dtoMap.entries) entry.value: entry.key
};

/// Class field info relevant for code generation.
class FieldInfo {
  FieldInfo({
    required this.name,
    required DartType type,
    required this.documentationComment,
    required this.annotation,
  }) : _type = type;

  /// Parameter / field type.
  final String name;

  final MixableField annotation;

  final String? documentationComment;

  Element? get element => _type.element;

  /// Dart type of the field
  final DartType _type;

  String get type => _type.getDisplayString(withNullability: false);

  String get typeWithNullability =>
      _type.getDisplayString(withNullability: true);

  bool get nullable => _type.nullabilitySuffix != NullabilitySuffix.none;

  /// Returns whether the field has a DTO type associated with it.
  bool get hasDto => dtoType != null;

  // type without generics
  String get baseType => type.split('<').first;

  bool get isDto {
    final isDtoType = _invertedDtoMap[baseType] != null;

    final listType = type.split('<').last.split('>').first;

    return isListType ? _invertedDtoMap[listType] != null : isDtoType;
  }

  bool get isListType => _type.isDartCoreList;

  bool get isMapType => _type.isDartCoreMap;

  bool get isSetType => _type.isDartCoreSet;

  /// Returns the DTO type associated with the field, if any.
  /// If a DTO type is explicitly specified in the `MixProperty` annotation, that is returned.
  /// Otherwise, the DTO type is inferred from the field type using a mapping defined in `_dtoMap`.

  String? get dtoType {
    if (annotation.dto?.typeAsString != null) {
      return annotation.dto?.typeAsString;
    }

    if (isListType) {
      final listType = type.split('<').last.split('>').first;

      if (!isDto) {
        return _dtoMap[listType] != null ? 'List<${_dtoMap[listType]}>' : null;
      } else {
        return type;
      }
    }
    return isDto ? type : _dtoMap[baseType];
  }

  /// True if the type is `dynamic`.
  bool get isDynamic => _type is DynamicType;

  String toString() => 'FieldInfo(name: $name, type: ${_type.toString()})';
}

class ParameterInfo extends FieldInfo {
  ParameterInfo({
    required super.name,
    this.fieldInfo,
    required this.isPositioned,
    required super.type,
    required this.isSuper,
    required super.annotation,
    required super.documentationComment,
  }) {}

  static const internalRefPrefix = '_\$this';

  // String get asOtherName => 'other.$name';

  // String get asThisName => 'this.$name';

  String get asInternalRef => '$internalRefPrefix.$name';

  final bool isSuper;

  /// Info relevant to the given field taken from the class itself, as contrary to the constructor parameter.
  /// If `null`, the field with the given name wasn't found on the class.
  final FieldInfo? fieldInfo;

  /// True if the field is positioned in the constructor
  final bool isPositioned;

  bool get hasUtility => utilityType != null;

  String get _typeFromList {
    if (!isListType) {
      throw Exception('Type is not a list type');
    }
    return type.split('<').last.split('>').first;
  }

  String get asResolvedType {
    if (isDto) {
      if (isListType) {
        return 'List<${_invertedDtoMap[_typeFromList]!}>';
      }
      final value = _invertedDtoMap[baseType];
      if (value == null) {
        throw Exception('No resolved type found for $type');
      }
      return value;
    }
    return type;
  }

  String get utilityName => annotation.utility?.alias ?? name;
  String? get utilityType {
    String? utilityType = annotation.utility?.typeAsString;

    if (utilityType != null) {
      print(utilityType);
      return utilityType;
    }

    if (isDto) {
      utilityType ??= asResolvedType;
    } else {
      utilityType ??= baseType;
    }

    utilityType = utilityType.capitalize();

    if (_utilityOverrides.containsKey(utilityType)) {
      return _utilityOverrides[utilityType]!;
    }

    if (isListType) {
      /// get type of list, if its List<double> I want ot get double

      final resolvedType = _invertedDtoMap[_typeFromList] ?? _typeFromList;
      utilityType = '${resolvedType}List';
    }

    return utilityType.capitalize() + 'Utility';
  }

  /// Returns the field info for the constructor parameter in the relevant class.

  @override
  String toString() {
    return 'ParameterInfo(isSuper: $isSuper, fieldInfo: $fieldInfo, isPositioned: $isPositioned, propertyAnnotation: $annotation)';
  }
}

MixableField readFieldAnnotation(
  FieldElement element,
) {
  const defaults = MixableField();

  const checker = TypeChecker.fromRuntime(MixableField);
  final annotation = checker.firstAnnotationOf(element);
  if (annotation is! DartObject) {
    return defaults;
  }

  final reader = ConstantReader(annotation);

  return _getMixableField(reader);
}

MixableField _getMixableField(ConstantReader reader) {
  final dto = reader.peek('dto');
  final utility = reader.peek('utility');
  return MixableField(
    dto: dto == null ? null : _getMixableDto(dto),
    utility: utility == null ? null : _getMixableFieldUtility(utility),
  );
}

MixableFieldDto? _getMixableDto(ConstantReader? reader) {
  if (reader == null) return null;
  final dtoType = reader.peek('type')?.typeValue.element?.name;
  final dtoName = reader.peek('alias')?.stringValue;

  return MixableFieldDto(
    type: dtoType,
    alias: dtoName,
  );
}

MixableFieldUtility _getMixableFieldUtility(ConstantReader reader) {
  final utilityType = reader.peek('type')?.typeValue.element?.name;
  final utilityAlias = reader.peek('alias')?.stringValue;

  final fields =
      reader.peek('properties')?.listValue.map(ConstantReader.new).toList();

  final extraUtilities =
      reader.peek('extraUtilities')?.listValue.map(ConstantReader.new).toList();

  return MixableFieldUtility(
    type: utilityType,
    alias: utilityAlias,
    extraUtilities: extraUtilities?.map(_getMixableFieldUtility).toList(),
    properties: fields?.map(_getMixableFieldProperty).toList(),
  );
}

MixableFieldProperty _getMixableFieldProperty(ConstantReader reader) {
  final alias = reader.peek('alias')?.stringValue;
  final property = reader.read('property').stringValue;
  final properties = reader
      .peek('properties')
      ?.listValue
      .map(ConstantReader.new)
      .map(_getMixableFieldProperty)
      .toList();

  return MixableFieldProperty(
    property,
    alias: alias,
    properties: properties,
  );
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

  final annotation = readFieldAnnotation(field);

  return FieldInfo(
    name: field.name,
    type: field.type,
    annotation: annotation,
    documentationComment: field.documentationComment,
  );
}
