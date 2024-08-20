import 'package:analyzer/dart/element/type.dart';
import 'builder_utils.dart';
import 'helpers.dart';

final typeRefs = TypeRefRepository.instance;

class TypeRefRepository {
  static TypeRefRepository instance = TypeRefRepository._();

  TypeRefRepository._();

  void addUtilityOverride(String typeName, String utilityName) {
    _utilityOverrides[typeName] = utilityName;
  }

  static final Map<String, String> _utilityOverrides = {
    'EdgeInsetsGeometry': 'SpacingUtility',
    'AnimatedData': 'AnimatedUtility',
    'WidgetModifiersData': 'SpecModifierUtility',
  };

  static final _dtoMap = {
    'EdgeInsetsGeometry': 'SpacingDto',
    'EdgeInsets': 'EdgeInsetsDto',
    'EdgeInsetsDirectional': 'EdgeInsetsDirectionalDto',
    'BoxConstraints': 'BoxConstraintsDto',
    'Decoration': 'DecorationDto',
    'BoxDecoration': 'BoxDecorationDto',
    'Color': 'ColorDto',
    'WidgetModifiersData': 'WidgetModifiersDataDto',
    'AnimatedData': 'AnimatedDataDto',
    'TextStyle': 'TextStyleDto',
    'ShapeBorder': 'ShapeBorderDto',
    'StrutStyle': 'StrutStyleDto',
    'Shadow': 'ShadowDto',
    'BoxShadow': 'BoxShadowDto',
    'Gradient': 'GradientDto',
    'BoxBorder': 'BoxBorderDto',
    'Border': 'BorderDto',
    'BorderDirectional': 'BorderDirectionalDto',
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

  String? getDto(DartType type) {
    final isList = type.isDartCoreList;
    if (isList) {
      type = type.getGenericType();
    }

    String? typeName;

    if (type.isDto) {
      typeName = type.getTypeAsString();
    } else {
      typeName = _dtoMap[type.getTypeAsString()];
    }

    if (isList && typeName != null) {
      return 'List<$typeName>';
    }
    return typeName;
  }

  String getResolvedTypeFromDto(DartType type) {
    final isList = type.isDartCoreList;
    if (isList) {
      type = type.getGenericType();
    }

    if (type.isDto) {
      type = extractDtoTypeArgument(type.classElement!)!;
    }

    if (isList) {
      return 'List<${type.getTypeAsString()}>';
    }
    return type.getTypeAsString();
  }

  String getUtilityName(DartType type) {
    final typeName = type.getTypeAsString();
    if (_utilityOverrides.containsKey(typeName)) {
      return _utilityOverrides[typeName]!;
    }

    final isList = type.isDartCoreList;

    DartType refType = type;

    if (isList) {
      refType = refType.getGenericType();
      final dtoType = getDto(type);
      if (dtoType == null) {
        return 'ListUtility<T,$refType> ';
      }
    }

    final isDto = refType.isDto;

    if (isDto) {
      refType = extractDtoTypeArgument(refType.classElement!)!;
    }

    return _sanitizeUtilityName(refType.getTypeAsString(), isList);
  }

  String _sanitizeUtilityName(String typeName, bool isList) {
    typeName = typeName.capitalize;

    if (isList) {
      typeName = '${typeName}List';
    }

    return '${typeName}Utility';
  }

  String getUtilityNameFromTypeName(String typeName) {
    // check if typeName ends with Utility
    // If not then add utility to it
    const utilityPostfix = 'Utility';
    const dtoPostfix = 'Dto';
    // TODO: improve this in the feature as
    // it can cause conflict
    const dtoList = 'DtoList';

    // if typename ends with Dto, remove it
    if (typeName.endsWith(dtoPostfix)) {
      typeName = typeName.substring(0, typeName.length - dtoPostfix.length);
    }

    // if typename ends with DtoList, remove it
    if (typeName.endsWith(dtoList)) {
      typeName =
          '${typeName.substring(0, typeName.length - dtoList.length)}List';
    }

    typeName = typeName.capitalize;

    if (!typeName.endsWith(utilityPostfix)) {
      return '$typeName$utilityPostfix';
    }
    return typeName;
  }
}
