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

  /// Gets the utility type for a DartType
  TypeReference? getUtilityForType(DartType type) {
    final typeString = type.getTypeAsString();

    // Check if it's a list type
    if (type.isList && type.firstTypeArgument != null) {
      final elementType = type.firstTypeArgument!;
      final elementTypeName = elementType.getTypeAsString();

      // Look for a list utility that handles this element type
      for (final entry in utilities.entries) {
        if (entry.value == 'List<$elementTypeName>' ||
            entry.value == 'List<${elementTypeName}Dto>') {
          return TypeReference(entry.key);
        }
      }
    }

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

    // If no mapping found, use DynamicUtility
    _logger.warning(
      'No utility found for type: $typeString, using DynamicUtility',
    );

    return TypeReference('DynamicUtility');
  }

  /// Gets the representation type (DTO or Attribute) for a DartType
  TypeReference? getRepresentationForType(DartType type) {
    final typeString = type.getDisplayString(withNullability: false);

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
    return TypeReference(typeString);
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

  TypeReference(String name, {this.type}) : name = _getSimpleTypeName(name);

  static TypeReference fromType(DartType type) =>
      TypeReference(type.getTypeAsString(), type: type);

  @override
  String toString() => 'TypeReference(name: $name, type: ${type ?? ''})';
}

String _getSimpleTypeName(String typeName) {
  final genericIndex = typeName.indexOf('<');

  if (genericIndex > 0) {
    return typeName.substring(0, genericIndex);
  }

  return typeName;
}

/// List of utility types that should be ignored in certain contexts
final ignoredUtilities = [
  'SpacingSideUtility',
  'FontFamilyUtility',
  'GapUtility',
];

/// Map of DTO class names to their corresponding Flutter type names
final dtos = {
  'SpacingSideDto': 'SpacingSide',
  'EdgeInsetsGeometryDto': 'EdgeInsetsGeometry',
  'StrutStyleDto': 'StrutStyle',
  'AnimatedDataDto': 'AnimatedData',
  'TextHeightBehaviorDto': 'TextHeightBehavior',
  'GradientDto': 'Gradient',
  'TextStyleData': 'TextStyle',
  'TextStyleDto': 'TextStyle',
  'ConstraintsDto': 'Constraints',
  'WidgetModifiersDataDto': 'WidgetModifiersData',
  'ColorDto': 'Color',
  'ShadowDto': 'Shadow',
  'ShapeBorderDto': 'ShapeBorder',
  'LinearBorderEdgeDto': 'LinearBorderEdge',
  'TextDirectiveDto': 'TextDirective',
  'BoxBorderDto': 'BoxBorder',
  'BorderSideDto': 'BorderSide',
  'BorderRadiusGeometryDto': 'BorderRadiusGeometry',
  'DecorationDto': 'Decoration',
  'DecorationImageDto': 'DecorationImage',
};

/// Map of utility class names to their corresponding value types
final utilities = {
  'TextDirectivesUtility': 'TextDirectiveDto',
  'ShadowListUtility': 'List<ShadowDto>',
  'DoubleUtility': 'double',
  'IntUtility': 'int',
  'StringUtility': 'String',
  'BoolUtility': 'bool',
  'ListUtility': 'List',
  'BoxShadowListUtility': 'List<BoxShadowDto>',
  'ColorUtility': 'ColorDto',
  'ColorListUtility': 'List<ColorDto>',
  'VerticalDirectionUtility': 'VerticalDirection',
  'BorderStyleUtility': 'BorderStyle',
  'ClipUtility': 'Clip',
  'AxisUtility': 'Axis',
  'FlexFitUtility': 'FlexFit',
  'StackFitUtility': 'StackFit',
  'ImageRepeatUtility': 'ImageRepeat',
  'TextDirectionUtility': 'TextDirection',
  'TextLeadingDistributionUtility': 'TextLeadingDistribution',
  'TileModeUtility': 'TileMode',
  'MainAxisAlignmentUtility': 'MainAxisAlignment',
  'CrossAxisAlignmentUtility': 'CrossAxisAlignment',
  'MainAxisSizeUtility': 'MainAxisSize',
  'BoxFitUtility': 'BoxFit',
  'BlendModeUtility': 'BlendMode',
  'BoxShapeUtility': 'BoxShape',
  'FontStyleUtility': 'FontStyle',
  'TextDecorationStyleUtility': 'TextDecorationStyle',
  'TextBaselineUtility': 'TextBaseline',
  'TextOverflowUtility': 'TextOverflow',
  'TextWidthBasisUtility': 'TextWidthBasis',
  'TextAlignUtility': 'TextAlign',
  'FilterQualityUtility': 'FilterQuality',
  'WrapAlignmentUtility': 'WrapAlignment',
  'TableCellVerticalAlignmentUtility': 'TableCellVerticalAlignment',
  'ShapeBorderUtility': 'ShapeBorderDto',
  'AlignmentUtility': 'AlignmentGeometry',
  'AlignmentDirectionalUtility': 'AlignmentDirectional',
  'FontFeatureUtility': 'FontFeature',
  'DurationUtility': 'Duration',
  'FontWeightUtility': 'FontWeight',
  'TextDecorationUtility': 'TextDecoration',
  'CurveUtility': 'Curve',
  'OffsetUtility': 'Offset',
  'RadiusUtility': 'Radius',
  'RectUtility': 'Rect',
  'ImageProviderUtility': 'ImageProvider',
  'GradientTransformUtility': 'GradientTransform',
  'Matrix4Utility': 'Matrix4',
  'TextScalerUtility': 'TextScaler',
  'TableColumnWidthUtility': 'TableColumnWidth',
  'TableBorderUtility': 'TableBorder',
  'DecorationUtility': 'DecorationDto',
  'GradientUtility': 'GradientDto',
};
