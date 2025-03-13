import 'package:analyzer/dart/element/type.dart';
import 'package:logging/logging.dart';

import 'utils/dart_type_utils.dart';
import 'utils/extensions.dart';
import 'utils/string_utils.dart';

/// A simplified registry for managing type mappings using hardcoded maps.
class TypeRegistry {
  static final TypeRegistry instance = TypeRegistry._();

  final Logger _logger = Logger('TypeRegistry');

  TypeRegistry._();

  bool hasTryToMerge(String typeName) {
    print('typeName: $typeName');
    final hasTryToMerge = tryToMerge.contains(typeName);
    if (!hasTryToMerge) {
      return tryToMerge.contains('${typeName}Dto');
    }

    return hasTryToMerge;
  }

  /// Gets the utility type for a DartType
  TypeReference? getUtilityForType(DartType type) {
    final typeString = type.getTypeAsString();

    // Check if it's a list type

    // Special handling for Spec types
    if (TypeUtils.isSpec(type)) {
      final typeName = typeString;

      return TypeReference('${typeName}Utility');
    }

    // Special handling for DTO types
    if (TypeUtils.isDto(type)) {
      final dtoName = type.element!.name!;
      // Remove the Dto suffix if present
      final baseName = dtoName.endsWith('Dto')
          ? dtoName.substring(0, dtoName.length - 3)
          : dtoName;

      return TypeReference('${baseName}Utility');
    }

    // Check for a direct utility mapping
    for (final entry in utilities.entries) {
      if (entry.value == typeString) {
        return TypeReference(entry.key);
      }
    }

    if (type.isList) {
      final elementType = type.firstTypeArgument!;
      final elementTypeName = elementType.getTypeAsString();

      return TypeReference('ListUtility<T, $elementTypeName>');
    }

    // If no mapping found, use DynamicUtility
    _logger.warning(
      'No utility found for type: $typeString, using DynamicUtility',
    );

    return null;
  }

  /// Gets the representation type (DTO or Attribute) for a DartType
  TypeReference? getRepresentationForType(DartType type) {
    final typeString = type.getTypeAsString();

    // Special handling for Spec types
    if (TypeUtils.isSpec(type)) {
      final typeName = typeString;

      return TypeReference('${typeName}Attribute');
    }

    // Special handling for DTO types
    if (TypeUtils.isDto(type)) {
      return TypeReference(type.element!.name!);
    }

    // Check for a direct DTO mapping
    for (final dtoEntry in dtos.entries) {
      if (dtoEntry.value == typeString) {
        return TypeReference(dtoEntry.key);
      }
    }

    // If no specific representation, return the type itself
    return null;
  }

  /// Gets the utility for a field with a specific name and type
  TypeReference? getUtilityForField(String fieldName, DartType type) {
    // For now, just delegate to the type utility
    // In the future, this could be enhanced to handle field-specific utilities
    return getUtilityForType(type);
  }

  /// Gets the utility name from a type name string
  String getUtilityNameFromTypeName(String typeName) {
    // Remove Dto or Attribute suffix if present
    if (typeName.endsWith('Dto')) {
      typeName = typeName.substring(0, typeName.length - 3);
    } else if (typeName.endsWith('Attribute')) {
      typeName = typeName.substring(0, typeName.length - 9);
    }

    // Ensure capitalized and add utility suffix
    typeName = typeName.capitalize;

    // Add utility suffix if not present
    if (!typeName.endsWith('Utility')) {
      typeName = '${typeName}Utility';
    }

    return typeName;
  }
}

/// Reference to a type by name
class TypeReference {
  final String name;
  final DartType? type;

  const TypeReference(this.name, {this.type});

  static TypeReference fromType(DartType type) =>
      TypeReference(type.getTypeAsString(), type: type);

  @override
  String toString() => 'TypeReference(name: $name, type: ${type ?? ''})';
}

/// List of utility types that should be ignored in certain contexts
final ignoredUtilities = [
  'SpacingSideUtility',
  'FontFamilyUtility',
  'GapUtility',
];

/// Map of DTO class names to their corresponding Flutter type names
/// Map of DTO class names to their corresponding Flutter type names
final dtos = {
  'AnimatedDataDto': 'AnimatedData',
  'BoxBorderDto': 'BoxBorder',
  'BorderRadiusGeometryDto': 'BorderRadiusGeometry',
  'BorderSideDto': 'BorderSide',
  'ColorDto': 'Color',
  'ConstraintsDto': 'Constraints',
  'DecorationDto': 'Decoration',
  'DecorationImageDto': 'DecorationImage',
  'EdgeInsetsGeometryDto': 'EdgeInsetsGeometry',
  'GradientDto': 'Gradient',
  'LinearBorderEdgeDto': 'LinearBorderEdge',
  'ShadowDto': 'Shadow',
  'ShapeBorderDto': 'ShapeBorder',
  'SpacingSideDto': 'SpacingSide',
  'StrutStyleDto': 'StrutStyle',
  'TextDirectiveDto': 'TextDirective',
  'TextHeightBehaviorDto': 'TextHeightBehavior',
  'TextStyleData': 'TextStyle',
  'TextStyleDto': 'TextStyle',
  'WidgetModifiersDataDto': 'WidgetModifiersData',
};

/// Map of utility class names to their corresponding value types
/// Map of utility class names to their corresponding value types
final utilities = {
  'AlignmentUtility': 'Alignment',
  'AlignmentDirectionalUtility': 'AlignmentDirectional',
  'AlignmentGeometryUtility': 'AlignmentGeometry',
  'AxisUtility': 'Axis',
  'BoolUtility': 'bool',
  'BlendModeUtility': 'BlendMode',
  'BorderStyleUtility': 'BorderStyle',
  'BoxFitUtility': 'BoxFit',
  'BoxShadowListUtility': 'List<BoxShadowDto>',
  'BoxShapeUtility': 'BoxShape',
  'ClipUtility': 'Clip',
  'ColorUtility': 'ColorDto',
  'ColorListUtility': 'List<ColorDto>',
  'CrossAxisAlignmentUtility': 'CrossAxisAlignment',
  'CurveUtility': 'Curve',
  'DoubleUtility': 'double',
  'DurationUtility': 'Duration',
  'FlexFitUtility': 'FlexFit',
  'FontFeatureUtility': 'FontFeature',
  'FontStyleUtility': 'FontStyle',
  'FontWeightUtility': 'FontWeight',
  'GradientUtility': 'GradientDto',
  'GradientTransformUtility': 'GradientTransform',
  'ImageProviderUtility': 'ImageProvider<Object>',
  'ImageRepeatUtility': 'ImageRepeat',
  'IntUtility': 'int',
  'ListUtility': 'List',
  'MainAxisAlignmentUtility': 'MainAxisAlignment',
  'MainAxisSizeUtility': 'MainAxisSize',
  'Matrix4Utility': 'Matrix4',
  'OffsetUtility': 'Offset',
  'RadiusUtility': 'Radius',
  'RectUtility': 'Rect',
  'ShadowListUtility': 'List<ShadowDto>',
  'StackFitUtility': 'StackFit',
  'ShapeBorderUtility': 'ShapeBorderDto',
  'TableBorderUtility': 'TableBorder',
  'TableCellVerticalAlignmentUtility': 'TableCellVerticalAlignment',
  'TableColumnWidthUtility': 'TableColumnWidth',
  'TextAlignUtility': 'TextAlign',
  'TextBaselineUtility': 'TextBaseline',
  'TextDecorationUtility': 'TextDecoration',
  'TextDecorationStyleUtility': 'TextDecorationStyle',
  'TextDirectionUtility': 'TextDirection',
  'TextDirectivesUtility': 'TextDirectiveDto',
  'TextLeadingDistributionUtility': 'TextLeadingDistribution',
  'TextOverflowUtility': 'TextOverflow',
  'TextScalerUtility': 'TextScaler',
  'TextWidthBasisUtility': 'TextWidthBasis',
  'VerticalDirectionUtility': 'VerticalDirection',
  'WrapAlignmentUtility': 'WrapAlignment',
};

/// Map of DTO class names to whether they have a tryToMerge method
final tryToMerge = {
  'BoxBorderDto',
  'BorderRadiusGeometryDto',
  'BorderSideDto',
  'DecorationDto',
  'EdgeInsetsGeometryDto',
  'GradientDto',
  'OutlinedBorderDto',
  'ShapeBorderDto',
  'ShadowDto',
  'TextStyleDto',
};
