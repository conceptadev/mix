import 'package:analyzer/dart/constant/value.dart' show DartObject;
import 'package:analyzer/dart/element/element.dart'
    show ClassElement, FieldElement, ParameterElement;
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart' show ConstantReader, TypeChecker;

final _dtoMap = {
  'EdgeInsetsGeometry': 'SpacingDto',
  'BoxConstraints': 'BoxConstraintsDto',
  'Decoration': 'DecorationDto',
  'Color': 'ColorDto',
  'AnimatedData': 'AnimatedDataDto',
  'TextStyle': 'TextStyleDto',
  'StrutStyle': 'StrutStyleDto',
};

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

  String get asNullableType => nullable ? type : '$type?';

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
    required this.propertyAnnotation,
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

    return ParameterInfo(
      name: param.name,
      isPositioned: isPositioned,
      type: type,
      nullable: nullable,
      fieldInfo: fieldInfo,
      isSuper: param.isSuperFormal,
      propertyAnnotation: annotation,
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
  final MixProperty propertyAnnotation;

  /// Returns whether the field has a DTO type associated with it.
  bool get hasDto => _dtoType != null;

  /// Returns the DTO type associated with the field, if any.
  /// If a DTO type is explicitly specified in the `MixProperty` annotation, that is returned.
  /// Otherwise, the DTO type is inferred from the field type using a mapping defined in `_dtoMap`.
  String? get _dtoType => propertyAnnotation.dtoName ?? _dtoMap[asRequiredType];

  String get dtoType => (_dtoType ?? asRequiredType) + (nullable ? '?' : '');

  bool get hasUtility => _utilityMap[asRequiredType] != null;

  String? get utilityType => _utilityMap[asRequiredType];

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

  /// Restores the `CopyWithField` annotation provided by the user.
  static MixProperty _readFieldAnnotation(
    ParameterElement element,
    ClassElement classElement,
  ) {
    const defaults = MixProperty();

    final fieldElement = classElement.getField(element.name);
    if (fieldElement is! FieldElement) {
      return defaults;
    }

    const checker = TypeChecker.fromRuntime(MixProperty);
    final annotation = checker.firstAnnotationOf(fieldElement);
    if (annotation is! DartObject) {
      return defaults;
    }

    final reader = ConstantReader(annotation);

    final dtoType = reader
        .peek('dtoType')
        ?.typeValue
        .getDisplayString(withNullability: true);

    final dtpName = dtoType ?? reader.peek('dtoName')?.stringValue;

    return MixProperty(
      dtoName: dtpName ?? defaults.dtoName,
    );
  }

  @override
  String toString() {
    return 'ParameterInfo(isSuper: $isSuper, fieldInfo: $fieldInfo, isPositioned: $isPositioned, propertyAnnotation: $propertyAnnotation)';
  }
}
