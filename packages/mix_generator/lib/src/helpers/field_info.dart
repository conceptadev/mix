import 'package:analyzer/dart/constant/value.dart' show DartObject;
import 'package:analyzer/dart/element/element.dart'
    show ClassElement, FieldElement, ParameterElement, ConstructorElement;
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generator/src/helpers/builder_utils.dart';
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
  'List<BoxShadow>': 'List<BoxShadowDto>',
  'List<Color>': 'List<ColorDto>',
  'BoxBorder': 'BoxBorderDto',
  'BorderSide': 'BorderSideDto',
  'BorderRadius': 'BorderRadiusDto',
  'BorderRadiusGeometry': 'BorderRadiusGeometryDto',
  'BorderRadiusDirectional': 'BorderRadiusDirectionalDto',
  'TextDirective': 'TextDirectiveDto',
  'DecorationImage': 'DecorationImageDto',
  'LinearBorderEdge': 'LinearBorderEdgeDto',
  'FlexSpec': 'FlexSpecAttribute',
  'BoxSpec': 'BoxSpecAttribute',
  'TextSpec': 'TextSpecAttribute',
  'ImageSpec': 'ImageSpecAttribute',
  'IconSpec': 'IconSpecAttribute',
  'StackSpec': 'StackSpecAttribute',
};

/// Replace keys and values from teh _dtoMap
final _invertedDtoMap = {
  for (var entry in _dtoMap.entries) entry.value: entry.key
};

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

  bool get isDto {
    final isDtoType = _invertedDtoMap[type] != null;

    if (isDtoType) {
      return true;
    }

    if (isListType) {
      final listType = getGenericTypeFromTypeName(type);

      if (_invertedDtoMap[listType] != null) {
        return true;
      }
      return _invertedDtoMap[listType] != null;
    }

    return false;
  }

  bool get isListType => type.startsWith('List<');

  bool get isMapType => type.startsWith('Map<');

  bool get isSetType => type.startsWith('Set<');

  /// Returns the DTO type associated with the field, if any.
  /// If a DTO type is explicitly specified in the `MixProperty` annotation, that is returned.
  /// Otherwise, the DTO type is inferred from the field type using a mapping defined in `_dtoMap`.

  String? get dtoType {
    if (annotation.dto?.typeAsString != null) {
      return annotation.dto!.typeAsString!;
    }

    return isDto ? type : _dtoMap[type];
  }

  /// True if the type is `dynamic`.
  bool get isDynamic => type == 'dynamic';

  String toString() => 'FieldInfo(name: $name, type: $type)';
}

class ParameterInfo extends FieldInfo {
  ParameterInfo({
    required super.name,
    required super.type,
    required super.nullable,
    required this.isSuper,
    required super.dartType,
    required super.annotation,
    required super.documentationComment,
  });

  static const internalRefPrefix = '_\$this';

  // String get asOtherName => 'other.$name';

  // String get asThisName => 'this.$name';

  String get asInternalRef => '$internalRefPrefix.$name';

  final bool isSuper;

  String get defaultUtilityName {
    if (isListType) {
      final utilityBaseType = getGenericTypeFromTypeName(type);
      if (_utilityOverrides.containsKey(utilityBaseType)) {
        return _utilityOverrides[utilityBaseType]!;
      }
      return getUtilityNameFromTypeName('${utilityBaseType}List');
    }

    if (_utilityOverrides.containsKey(type)) {
      return _utilityOverrides[type]!;
    }

    return getUtilityNameFromTypeName(type);
  }

  String get asResolvedType {
    if (isDto) {
      final value = _invertedDtoMap[type];
      if (value == null) {
        throw Exception('No resolved type found for $type');
      }
      return value;
    }
    return type;
  }
}

MixableProperty readFieldAnnotation(
  FieldElement element,
) {
  const defaults = MixableProperty();

  const checker = TypeChecker.fromRuntime(MixableProperty);
  final annotation = checker.firstAnnotationOf(element);
  if (annotation is! DartObject) {
    return defaults;
  }

  return _getMixableProperty(ConstantReader(annotation));
}

MixableProperty _getMixableProperty(ConstantReader reader) {
  final dto = reader.peek('dto');
  final utilities = reader
      .peek('utilities')
      ?.listValue
      .map((e) => _getMixableFieldUtility(ConstantReader(e)))
      .toList();

  return MixableProperty(
    dto: dto == null ? null : _getMixableDto(dto),
    utilities: utilities,
  );
}

MixableFieldDto? _getMixableDto(ConstantReader? reader) {
  if (reader == null) return null;
  final peakedType = reader.peek('type');

  String? dtoName;

  if (peakedType?.isString == true) {
    dtoName = peakedType!.stringValue;
  } else if (peakedType?.isType == true) {
    dtoName = peakedType!.typeValue.element!.name!;
  }

  return MixableFieldDto(
    type: dtoName,
  );
}

MixableUtility _getMixableFieldUtility(ConstantReader reader) {
  final peakedType = reader.peek('type');

  String? utilityName;

  if (peakedType?.isString == true) {
    utilityName = peakedType!.stringValue;
  } else if (peakedType?.isType == true) {
    utilityName = peakedType!.typeValue.element!.name!;
  }

  final utilityAlias = reader.peek('alias')?.stringValue;

  final extraUtilities = reader
      .read('properties')
      .listValue
      .map((e) => _getMixableUtilityAlias(ConstantReader(e)))
      .toList();

  return MixableUtility(
    type: utilityName,
    alias: utilityAlias,
    properties: extraUtilities,
  );
}

MixableUtilityProps _getMixableUtilityAlias(ConstantReader reader) {
  final path = reader.read('path').stringValue;
  final alias = reader.read('alias').stringValue;

  return (path: path, alias: alias);
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
    type: field.type.getDisplayString(withNullability: false),
    dartType: field.type,
    nullable: field.type.nullabilitySuffix == NullabilitySuffix.question,
    annotation: annotation,
    documentationComment: field.documentationComment,
  );
}
