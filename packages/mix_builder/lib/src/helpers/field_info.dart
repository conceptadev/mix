import 'package:analyzer/dart/constant/value.dart' show DartObject;
import 'package:analyzer/dart/element/element.dart'
    show ClassElement, FieldElement, ParameterElement;
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:code_builder/code_builder.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart' show ConstantReader, TypeChecker;

final _utilityMap = {
  'EdgeInsetsGeometry': 'SpacingUtility',
  'BoxConstraints': 'BoxConstraintsUtility',
  'Decoration': 'DecorationUtility',
  'Color': 'ColorUtility',
  'AnimatedData': 'AnimatedUtility',
  'double': 'DoubleUtility',
  'bool': 'BoolUtility',
  'int': 'IntUtility',
  'TextStyle': 'TextStyleUtility',
  'StrutStyle': 'StrutStyleUtility',
  'Clip': 'ClipUtility',
  'BoxDecoration': 'BoxDecorationUtility',
  'TextOverflow': 'TextOverflowUtility',
  'TextWidthBasis': 'TextWidthBasisUtility',
  'TextAlign': 'TextAlignUtility',
  'TextHeightBehavior': 'TextHeightBehaviorUtility',
  'TextDirection': 'TextDirectionUtility',
  'VerticalDirection': 'VerticalDirectionUtility',
  'TextBaseline': 'TextBaselineUtility',
  'TextDecoration': 'TextDecorationUtility',
  'Matrix4': 'Matrix4Utility',
  'AlignmentGeometry': 'AlignmentUtility',
  'ImageRepeat': 'ImageRepeatUtility',
  'BoxFit': 'BoxFitUtility',
  'FilterQuality': 'FilterQualityUtility',
  'Rect': 'RectUtility',
  'BlendMode': 'BlendModeUtility',
  'CrossAxisAlignment': 'CrossAxisAlignmentUtility',
  'MainAxisAlignment': 'MainAxisAlignmentUtility',
  'MainAxisSize': 'MainAxisSizeUtility',
  'Axis': 'AxisUtility',
  'List<Shadow>': 'ShadowListUtility',
  'TextDirective': 'TextDirectiveUtility',
  'StackFit': 'StackFitUtility',
  'BoxBorder': 'BoxBorderUtility',
  'Border': 'BorderUtility',
  'BorderDirectional': 'BorderDirectionalUtility',
  'ShapeBorder': 'ShapeBorderUtility',
  'BorderSide': 'BorderSideUtility',
  'BorderRadiusGeometry': 'BorderRadiusGeometryUtility',
  'BorderRadiusDirectional': 'BorderRadiusDirectionalUtility',
  'BorderRadius': 'BorderRadiusUtility',
  'GradientTransform': 'GradientTransformUtility',
  'Gradient': 'GradientUtility',
  'TileMode': 'TileModeUtility',
  'List<double>': 'DoubleListUtility',
  'List<Color>': 'ColorListUtility',
  'BorderStyle': 'BorderStyleUtility',
  'DecorationImage': 'DecorationImageUtility',
  'ImageProvider<Object>': 'ImageProviderUtility',
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
  'BorderRadiusGeometry': 'BorderRadiusGeometryDto',
  'BorderSide': 'BorderSideDto',
  'BorderRadiusDirectional': 'BorderRadiusDirectionalDto',
  'TextDirective': 'TextDirectiveDto'
};

/// Replace keys and values from teh _dtoMap
final _invertedDtoMap = {
  for (var entry in _dtoMap.entries) entry.value: entry.key
};

/// Class field info relevant for code generation.
class FieldInfo {
  FieldInfo({
    required this.name,
    required this.nullable,
    required this.type,
    required this.documentationComment,
  });

  /// Parameter / field type.
  final String name;

  final String? documentationComment;

  /// If the type is nullable. `dynamic` is considered non-nullable as it doesn't have nullability flag.
  final bool nullable;

  /// Type name with nullability flag.
  final String type;

  String get asNameRef => nullable ? name : name + '?';

  String get asRequiredType => nullable ? type.replaceFirst('?', '') : type;

  /// True if the type is `dynamic`.
  bool get isDynamic => type == "dynamic";
}

class ParameterInfo extends FieldInfo {
  ParameterInfo({
    required super.name,
    this.fieldInfo,
    required this.isPositioned,
    required super.type,
    required super.nullable,
    required this.isSuper,
    required this.annotation,
    required super.documentationComment,
  }) {}
  factory ParameterInfo.parameter(
    ParameterElement param,
    ClassElement classElement, {
    required bool isPositioned,
  }) {
    final nullable = param.type.nullabilitySuffix != NullabilitySuffix.none;
    final type = param.type.getDisplayString(withNullability: true);
    final annotation = _readFieldAnnotation(param, classElement);
    final fieldInfo = _classFieldInfo(param.name, classElement);
    // check if ParameterElement contains a mixin

    return ParameterInfo(
      name: param.name,
      isPositioned: isPositioned,
      type: type,
      nullable: nullable,
      fieldInfo: fieldInfo,
      isSuper: param.isSuperFormal,
      annotation: annotation,
      documentationComment: fieldInfo?.documentationComment,
    );
  }

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

  /// Annotation provided by the user with `MixProperty`.
  final MixableField annotation;

  /// Returns whether the field has a DTO type associated with it.
  bool get hasDto => dtoType != null;

  bool get isDto => _invertedDtoMap[asRequiredType] != null;

  bool get isListType => type.startsWith('List<');

  /// Returns the DTO type associated with the field, if any.
  /// If a DTO type is explicitly specified in the `MixProperty` annotation, that is returned.
  /// Otherwise, the DTO type is inferred from the field type using a mapping defined in `_dtoMap`.

  String? get _dto =>
      (annotation.dto?.typeAsString ?? _dtoMap[asRequiredType]) ??
      (isDto ? asRequiredType : null);

  Reference? get dtoType => _dto == null ? null : refer(_dto!);

  bool get hasUtility => utilityType != null;

  String get asResolvedType {
    if (isDto) {
      final value = _invertedDtoMap[asRequiredType];
      if (value == null) {
        throw Exception('No resolved type found for $asRequiredType');
      }
      return value;
    }
    return asRequiredType;
  }

  String get utilityName => annotation.utility?.alias ?? name;
  Reference? get utilityType {
    String? utilityType = annotation.utility?.typeAsString;

    if (isDto) {
      utilityType ??= _utilityMap[asResolvedType];
    } else {
      utilityType ??= _utilityMap[asRequiredType];
    }

    return utilityType == null ? null : refer(utilityType);
  }

  /// Returns the field info for the constructor parameter in the relevant class.
  static FieldInfo? _classFieldInfo(
    String fieldName,
    ClassElement classElement,
  ) {
    final field = classElement.fields
        .where((e) => e.name == fieldName)
        .fold<FieldElement?>(null, (previousValue, element) => element);
    if (field == null) return null;

    return FieldInfo(
      name: field.name,
      nullable: field.type.nullabilitySuffix != NullabilitySuffix.none,
      type: field.type.getDisplayString(withNullability: true),
      documentationComment: field.documentationComment,
    );
  }

  static MixableField _readFieldAnnotation(
    ParameterElement element,
    ClassElement classElement,
  ) {
    const defaults = MixableField();

    final fieldElement = classElement.getField(element.name);
    if (fieldElement is! FieldElement) {
      return defaults;
    }

    const checker = TypeChecker.fromRuntime(MixableField);
    final annotation = checker.firstAnnotationOf(fieldElement);
    if (annotation is! DartObject) {
      return defaults;
    }

    final reader = ConstantReader(annotation);

    return _getMixableField(reader);
  }

  @override
  String toString() {
    return 'ParameterInfo(isSuper: $isSuper, fieldInfo: $fieldInfo, isPositioned: $isPositioned, propertyAnnotation: $annotation)';
  }
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
