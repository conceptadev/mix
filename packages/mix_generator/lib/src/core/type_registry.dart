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

  /// Helper method to get utility for list types
  String _getUtilityForListType(DartType type) {
    final elementType = type.firstTypeArgument!;
    final elementTypeName =
        getResolvableForType(elementType) ?? elementType.getTypeAsString();

    final listTypeString = 'List<$elementTypeName>';

    // First check for a direct utility mapping for the list type
    for (final entry in utilities.entries) {
      if (entry.value == listTypeString) {
        return entry.key;
      }
    }

    // Default to generic list utility
    return 'ListUtility<T, $elementTypeName>';
  }

  bool hasTryToMerge(String typeName) {
    return tryToMerge.contains(typeName);
  }

  /// Gets the utility type for a DartType
  String? getUtilityForType(DartType type) {
    final typeString = type.getTypeAsString();

    // Special handling for Spec types
    if (TypeUtils.isSpec(type)) {
      return '${typeString}Utility';
    }

    // Handle List types specially
    if (type.isList) {
      return _getUtilityForListType(type);
    }

    // For DTO types, get the resolved type for utility mapping
    String resolvedTypeString = typeString;
    if (TypeUtils.isResolvable(type)) {
      final dtoName = type.element!.name!;
      // Get the resolved type from the resolvables map
      resolvedTypeString = resolvables[dtoName] ?? typeString;
    }

    // Check for a direct utility mapping using the resolved type
    for (final entry in utilities.entries) {
      if (entry.value == resolvedTypeString) {
        return entry.key;
      }
    }

    // If no mapping found, log warning
    _logger.warning(
      'No utility found for type: $typeString (resolved: $resolvedTypeString), using DynamicUtility',
    );

    return null;
  }

  /// Gets the representation type (DTO or Attribute) for a DartType
  String? getResolvableForType(DartType type) {
    final typeString = type.getTypeAsString();

    // Special handling for Spec types
    if (TypeUtils.isSpec(type)) {
      final typeName = typeString;

      return '${typeName}Attribute';
    }

    if (type.isList) {
      final elementType = type.firstTypeArgument!;
      final valueType = getResolvableForType(elementType);

      if (valueType == null) {
        return null;
      }

      return 'List<$valueType>';
    }

    // Special handling for DTO types
    if (TypeUtils.isResolvable(type)) {
      return type.element!.name!;
    }

    // Check for a direct DTO mapping
    for (final dtoEntry in resolvables.entries) {
      if (dtoEntry.value == typeString) {
        return dtoEntry.key;
      }
    }

    // If no specific representation, return the type itself
    return null;
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
  'FontSizeUtility',
  'StrokeAlignUtility',
];

/// Map of resolvable class names to their corresponding Flutter type names
final resolvables = {
  'BoxSpecAttribute': 'BoxSpec',
  'ImageSpecAttribute': 'ImageSpec',
  'TextSpecAttribute': 'TextSpec',
  'FlexSpecAttribute': 'FlexSpec',
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
  'OutlinedBorderDto': 'OutlinedBorder',
  'RoundedRectangleBorderDto': 'RoundedRectangleBorder',
  'ShadowDto': 'Shadow',
  'ShapeBorderDto': 'ShapeBorder',
  'SpacingSideDto': 'SpacingSide',
  'StrutStyleDto': 'StrutStyle',
  'TextDirectiveDto': 'TextDirective',
  'TextHeightBehaviorDto': 'TextHeightBehavior',
  'TextStyleDto': 'TextStyle',
  'WidgetModifiersDataDto': 'WidgetModifiersData',
  'BorderDto': 'Border',
  'BorderRadiusDto': 'BorderRadius',
  'EdgeInsetsDto': 'EdgeInsets',
  'BoxConstraintsDto': 'BoxConstraints',
};

/// Map of utility class names to their corresponding value types
final utilities = {
  'AlignmentUtility': 'Alignment',
  'AlignmentDirectionalUtility': 'AlignmentDirectional',
  'AlignmentGeometryUtility': 'AlignmentGeometry',
  'AnimatedUtility': 'AnimatedData',
  'AxisUtility': 'Axis',
  'BoolUtility': 'bool',
  'BlendModeUtility': 'BlendMode',
  'BorderStyleUtility': 'BorderStyle',
  'BoxConstraintsUtility': 'BoxConstraints',
  'BoxFitUtility': 'BoxFit',
  'BoxShadowListUtility': 'List<BoxShadow>',
  'BoxShapeUtility': 'BoxShape',
  'ClipUtility': 'Clip',
  'ColorUtility': 'Color',
  'ColorListUtility': 'List<ColorDto>',
  'ConstraintsUtility': 'Constraints',
  'CrossAxisAlignmentUtility': 'CrossAxisAlignment',
  'CurveUtility': 'Curve',
  'DecorationUtility': 'Decoration',
  'DoubleUtility': 'double',
  'DurationUtility': 'Duration',
  'EdgeInsetsGeometryUtility': 'EdgeInsetsGeometry',
  'FlexFitUtility': 'FlexFit',
  'FontFeatureUtility': 'FontFeature',
  'FontStyleUtility': 'FontStyle',
  'FontWeightUtility': 'FontWeight',
  'GapUtility': 'SpacingSide',
  'GradientUtility': 'Gradient',
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
  'SpecModifierUtility': 'WidgetModifiersData',
  'StackFitUtility': 'StackFit',
  'ShapeBorderUtility': 'ShapeBorder',
  'SpacingUtility': 'EdgeInsetsGeometry',
  'StringUtility': 'String',
  'TableBorderUtility': 'TableBorder',
  'TableCellVerticalAlignmentUtility': 'TableCellVerticalAlignment',
  'TableColumnWidthUtility': 'TableColumnWidth',
  'TextAlignUtility': 'TextAlign',
  'TextBaselineUtility': 'TextBaseline',
  'TextDecorationUtility': 'TextDecoration',
  'TextDecorationStyleUtility': 'TextDecorationStyle',
  'TextDirectionUtility': 'TextDirection',
  'TextDirectiveUtility': 'TextDirective',
  'TextLeadingDistributionUtility': 'TextLeadingDistribution',
  'TextOverflowUtility': 'TextOverflow',
  'TextScalerUtility': 'TextScaler',
  'TextWidthBasisUtility': 'TextWidthBasis',
  'TileModeUtility': 'TileMode',
  'VerticalDirectionUtility': 'VerticalDirection',
  'WidgetModifiersUtility': 'WidgetModifiersData',
  'WrapAlignmentUtility': 'WrapAlignment',
  'FilterQualityUtility': 'FilterQuality',
  'BorderRadiusGeometryUtility': 'BorderRadiusGeometry',
  'BorderSideUtility': 'BorderSide',
  'BoxBorderUtility': 'BoxBorder',
  'DecorationImageUtility': 'DecorationImage',
  'LinearBorderEdgeUtility': 'LinearBorderEdge',
  'StrutStyleUtility': 'StrutStyle',
  'TextHeightBehaviorUtility': 'TextHeightBehavior',
  'TextStyleUtility': 'TextStyle',
  'PaintUtility': 'Paint',
  'ScrollPhysicsUtility': 'ScrollPhysics',
  'MouseCursorUtility': 'MouseCursor',
};

/// Map of DTO class names to whether they have a tryToMerge method
final tryToMerge = {
  'BoxBorderDto',
  'DecorationDto',
  'EdgeInsetsGeometryDto',
  'GradientDto',
  'ShapeBorderDto',
};
