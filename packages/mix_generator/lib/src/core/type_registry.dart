import 'package:analyzer/dart/element/type.dart';
import 'package:logging/logging.dart';

import 'utils/dart_type_utils.dart';
import 'utils/extensions.dart';
import 'utils/string_utils.dart';

/// A simplified registry for managing type mappings using hardcoded maps.
class TypeRegistry {
  static final TypeRegistry instance = TypeRegistry._();

  final Logger _logger = Logger('TypeRegistry');

  // Map to store types discovered during the type discovery phase
  final Map<String, String> _discoveredTypes = {};

  TypeRegistry._();

  /// Helper method to get utility for list types
  String _getUtilityForListType(DartType type) {
    final elementType = type.firstTypeArgument!;
    final elementTypeName =
        getResolvableForType(elementType) ?? elementType.getTypeAsString();

    // If it's a DTO, get the corresponding Flutter type
    String? dartType;
    if (TypeUtils.isResolvable(elementType) && elementType.element != null) {
      final dtoName = elementType.element!.name!;
      // Check if the DTO name exists in the resolvables map
      if (resolvables.containsKey(dtoName)) {
        dartType = resolvables[dtoName]!;
      } else {
        _logger.fine('No Flutter type found for DTO: $dtoName');
      }
    }

    // Construct list type strings for both DTO and Flutter types
    final listTypeString = 'List<$elementTypeName>';
    final flutterListTypeString = dartType != null ? 'List<$dartType>' : null;

    // First check for a direct utility mapping for the list type
    for (final entry in utilities.entries) {
      // Check against both DTO and Flutter type list strings
      if (entry.value == listTypeString) {
        return entry.key;
      }

      if (flutterListTypeString != null &&
          entry.value == flutterListTypeString) {
        return entry.key;
      }
    }

    // Default to generic list utility
    return 'ListUtility<T, $elementTypeName>';
  }

  /// Helper to extract the base type name from a generic type string
  /// For example, 'ImageProvider<Object>' -> 'ImageProvider'
  String _extractBaseTypeName(String typeString) {
    final genericIndex = typeString.indexOf('<');
    if (genericIndex > 0) {
      return typeString.substring(0, genericIndex);
    }

    return typeString;
  }

  /// Returns a map of all currently registered discovered types
  Map<String, String> get allDiscoveredTypes =>
      Map.unmodifiable(_discoveredTypes);

  /// Returns a map of all currently registered utilities
  Map<String, String> get allUtilities => Map.unmodifiable(utilities);

  /// Returns a map of all currently registered resolvables
  Map<String, String> get allResolvables => Map.unmodifiable(resolvables);

  /// Registers types that will be generated
  ///
  /// This is called by the MixableTypeDiscoveryGenerator to pre-register
  /// types that will be generated by other generators.
  void registerDiscoveredTypes(Map<String, String> types) {
    _discoveredTypes.addAll(types);

    // Add discovered types to the resolvables and utilities maps
    types.forEach((generatedType, baseType) {
      if (generatedType.endsWith('Utility')) {
        // Add to utilities map - Utility types map to their base type
        utilities[generatedType] = baseType;
      } else if (generatedType.endsWith('Attribute')) {
        // Add to resolvables map - Attributes map to their Spec class
        resolvables[generatedType] = baseType;
      } else if (generatedType.endsWith('Dto')) {
        // Add to resolvables map - DTOs map to their Flutter type
        final flutterType = baseType;
        resolvables[generatedType] = flutterType;

        // Also add a utility for this DTO if one doesn't already exist
        final utilityName = '${baseType}Utility';
        if (!utilities.containsKey(utilityName)) {
          utilities[utilityName] = baseType;
        }
      }
    });

    _logger.info(
      'Registered ${types.length} discovered types and updated utility/resolvable maps',
    );
  }

  /// Checks if a type has been discovered by the type discovery generator
  bool isDiscoveredType(String typeName) {
    return _discoveredTypes.containsKey(typeName);
  }

  bool hasTryToMerge(String typeName) {
    // If the exact type is in the tryToMerge set
    if (tryToMerge.contains(typeName)) {
      return true;
    }

    // If the type with 'Dto' suffix is in the tryToMerge set
    if (!typeName.endsWith('Dto') && tryToMerge.contains('${typeName}Dto')) {
      return true;
    }

    // If the type without 'Dto' suffix is in the tryToMerge set
    if (typeName.endsWith('Dto')) {
      final baseType = typeName.substring(0, typeName.length - 3);

      return tryToMerge.contains(baseType);
    }

    return false;
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

    // Special handling for DTO types in test cases and real code
    if (TypeUtils.isResolvable(type)) {
      final dtoName = type.element!.name!;

      // Handle DTOs by removing the Dto suffix for utility lookup
      if (dtoName.endsWith('Dto')) {
        final baseName = dtoName.substring(0, dtoName.length - 3);

        return '${baseName}Utility';
      }

      // Just add Utility suffix for non-Dto classes that are resolvable
      return '${dtoName}Utility';
    }

    // For DTO types, get the resolved type for utility mapping in real code
    String resolvedTypeString = typeString;
    if (resolvables.containsKey(typeString)) {
      resolvedTypeString = resolvables[typeString]!;
    }

    // Check for a direct utility mapping using the resolved type
    for (final entry in utilities.entries) {
      if (entry.value == resolvedTypeString) {
        return entry.key;
      }

      // Special handling for generic types like ImageProvider
      // Compare just the base type name without generic parameters
      if (type is InterfaceType) {
        final baseTypeName = type.element.name;
        final entryBaseTypeName = _extractBaseTypeName(entry.value);

        if (baseTypeName == entryBaseTypeName) {
          return entry.key;
        }
      }
    }

    // Check if we have a discovered type
    final utilityName = '${typeString}Utility';
    if (isDiscoveredType(utilityName)) {
      return utilityName;
    }

    // If no mapping found, log warning
    _logger.warning(
      'No utility found for type: $typeString (resolved: $resolvedTypeString), using GenericUtility',
    );

    // Return GenericUtility with the appropriate type parameter instead of DynamicUtility
    return 'GenericUtility<T, $typeString>';
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

    // Check in discovered types
    final attributeName = '${typeString}Attribute';
    if (isDiscoveredType(attributeName)) {
      return attributeName;
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

  /// Dumps the registry contents to the logger for debugging
  void dumpRegistryContents() {
    _logger.info('=== Type Registry Contents ===');
    _logger.info('Discovered Types: ${_discoveredTypes.length}');
    _logger.info('Utilities: ${utilities.length}');
    _logger.info('Resolvables: ${resolvables.length}');

    _logger.fine('--- Discovered Types ---');
    _discoveredTypes.forEach((key, value) {
      _logger.fine('  $key => $value');
    });

    _logger.fine('--- Utilities ---');
    utilities.forEach((key, value) {
      _logger.fine('  $key => $value');
    });

    _logger.fine('--- Resolvables ---');
    resolvables.forEach((key, value) {
      _logger.fine('  $key => $value');
    });
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
  'BoxDecorationMix': 'BoxDecoration',
  'AnimatedDataDto': 'AnimatedData',
  'BoxBorderMix': 'BoxBorder',
  'BorderRadiusGeometryMix': 'BorderRadiusGeometry',
  'BorderSideMix': 'BorderSide',
  'BoxShadowMix': 'BoxShadow',
  'ColorDto': 'Color',
  'ConstraintsDto': 'Constraints',
  'BoxConstraintsMix': 'BoxConstraints',
  'DecorationMix': 'Decoration',
  'DecorationImageMix': 'DecorationImage',
  'EdgeInsetsGeometryMix': 'EdgeInsetsGeometry',
  'GradientDto': 'Gradient',
  'LinearBorderEdgeMix': 'LinearBorderEdge',
  'OutlinedBorderMix': 'OutlinedBorder',
  'RoundedRectangleBorderMix': 'RoundedRectangleBorder',
  'ShadowMix': 'Shadow',
  'ShapeBorderMix': 'ShapeBorder',
  'SpacingSideDto': 'SpacingSide',
  'StrutStyleMix': 'StrutStyle',
  'TextDirectiveDto': 'TextDirective',
  'TextHeightBehaviorDto': 'TextHeightBehavior',
  'TextStyleDto': 'TextStyle',
  'WidgetModifiersDataDto': 'WidgetModifiersData',
  'BorderMix': 'Border',
  'BorderRadiusMix': 'BorderRadius',
  'EdgeInsetsMix': 'EdgeInsets',
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
  'BoxConstraintsMixUtility': 'BoxConstraints',
  'ConstraintsUtility': 'Constraints',
  'BoxFitUtility': 'BoxFit',
  'BoxDecorationMixUtility': 'BoxDecoration',
  'BoxShadowUtility': 'BoxShadow',
  'BoxShadowListUtility': 'List<BoxShadow>',
  'BoxShapeUtility': 'BoxShape',
  'ClipUtility': 'Clip',
  'ColorUtility': 'Color',
  'ColorListUtility': 'List<ColorDto>',
  'CrossAxisAlignmentUtility': 'CrossAxisAlignment',
  'CurveUtility': 'Curve',
  'DecorationMixUtility': 'Decoration',
  'DoubleUtility': 'double',
  'DurationUtility': 'Duration',
  'EdgeInsetsGeometryMixUtility': 'EdgeInsetsGeometry',
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
  'ShapeBorderMixUtility': 'ShapeBorder',
  'SpacingUtility': 'EdgeInsetsGeometry',
  'EdgeInsetsMixUtility': 'EdgeInsets',
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
  'BorderRadiusGeometryMixUtility': 'BorderRadiusGeometry',
  'BorderSideMixUtility': 'BorderSide',
  'BoxBorderMixUtility': 'BoxBorder',
  'RoundedRectangleBorderMixUtility': 'RoundedRectangleBorder',
  'DecorationImageMixUtility': 'DecorationImage',
  'LinearBorderEdgeMixUtility': 'LinearBorderEdge',
  'StrutStyleMixUtility': 'StrutStyle',
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
  'EdgeInsetsGeometryMix',
  'GradientDto',
  'ShapeBorderMix',
};
