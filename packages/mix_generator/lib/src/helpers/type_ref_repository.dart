// // ignore_for_file: constant_identifier_names, unused-code

// import 'package:analyzer/dart/element/type.dart';

// import 'builder_utils.dart';
// import 'type_extension.dart';

// final typeRefs = TypeRefRepository.instance;

// class TypeRefRepository {
//   static TypeRefRepository instance = const TypeRefRepository._();

//   static final Map<String, String> _utilityOverrides = {
//     'EdgeInsetsGeometry': 'SpacingUtility',
//     'AnimatedData': 'AnimatedUtility',
//     'WidgetModifiersData': 'SpecModifierUtility',
//   };

//   static final _dtoMap = {
//     'EdgeInsetsGeometry': 'SpacingDto',
//     'EdgeInsets': 'EdgeInsetsDto',
//     'EdgeInsetsDirectional': 'EdgeInsetsDirectionalDto',
//     'BoxConstraints': 'BoxConstraintsDto',
//     'Decoration': 'DecorationDto',
//     'BoxDecoration': 'BoxDecorationDto',
//     'Color': 'ColorDto',
//     'WidgetModifiersData': 'WidgetModifiersDataDto',
//     'AnimatedData': 'AnimatedDataDto',
//     'TextStyle': 'TextStyleDto',
//     'ShapeBorder': 'ShapeBorderDto',
//     'StrutStyle': 'StrutStyleDto',
//     'Shadow': 'ShadowDto',
//     'BoxShadow': 'BoxShadowDto',
//     'Gradient': 'GradientDto',
//     'BoxBorder': 'BoxBorderDto',
//     'Border': 'BorderDto',
//     'BorderDirectional': 'BorderDirectionalDto',
//     'BorderSide': 'BorderSideDto',
//     'BorderRadius': 'BorderRadiusDto',
//     'BorderRadiusGeometry': 'BorderRadiusGeometryDto',
//     'BorderRadiusDirectional': 'BorderRadiusDirectionalDto',
//     'TextDirective': 'TextDirectiveDto',
//     'DecorationImage': 'DecorationImageDto',
//     'LinearBorderEdge': 'LinearBorderEdgeDto',
//     'FlexSpec': 'FlexSpecAttribute',
//     'BoxSpec': 'BoxSpecAttribute',
//     'TextSpec': 'TextSpecAttribute',
//     'ImageSpec': 'ImageSpecAttribute',
//     'IconSpec': 'IconSpecAttribute',
//     'FlexBoxSpec': 'FlexBoxSpecAttribute',
//     'StackSpec': 'StackSpecAttribute',
//   };

//   const TypeRefRepository._();

//   String _sanitizeUtilityName(String typeName, bool isList) {
//     typeName = typeName.capitalize;

//     if (isList) {
//       typeName = '${typeName}List';
//     }

//     return '${typeName}Utility';
//   }

//   void addUtilityOverride(String typeName, String utilityName) {
//     _utilityOverrides[typeName] = utilityName;
//   }

//   String? getDto(DartType type) {
//     final isList = type.isDartCoreList;
//     if (isList) {
//       type = type.getGenericType();
//     }

//     String? typeName;

//     if (type.isDto) {
//       typeName = type.getTypeName();
//     } else {
//       typeName = _dtoMap[type.getTypeName()];
//     }

//     if (isList && typeName != null) {
//       return 'List<$typeName>';
//     }

//     return typeName;
//   }

//   String getResolvedTypeFromDto(DartType type) {
//     final isList = type.isDartCoreList;
//     if (isList) {
//       type = type.getGenericType();
//     }

//     if (type.isDto) {
//       type = extractDtoTypeArgument(type.classElement!)!;
//     }

//     if (isList) {
//       return 'List<${type.getTypeName()}>';
//     }

//     return type.getTypeName();
//   }

//   String getUtilityName(DartType type) {
//     final typeName = type.getTypeName();
//     if (_utilityOverrides.containsKey(typeName)) {
//       return _utilityOverrides[typeName]!;
//     }

//     final isList = type.isDartCoreList;

//     DartType refType = type;

//     if (isList) {
//       refType = refType.getGenericType();
//       final dtoType = getDto(type);
//       if (dtoType == null) {
//         return 'ListUtility<T,$refType> ';
//       }
//     }

//     final isDto = refType.isDto;

//     if (isDto) {
//       refType = extractDtoTypeArgument(refType.classElement!)!;
//     }

//     return _sanitizeUtilityName(refType.getTypeName(), isList);
//   }

//   String getUtilityNameFromTypeName(String typeName) {
//     // check if typeName ends with Utility
//     // If not then add utility to it

//     if (typeName.endsWith($Dto)) {
//       typeName = typeName.substring(0, typeName.length - $Dto.length);
//     }

//     // if typename ends with DtoList, remove it
//     if (typeName.endsWith($DtoList)) {
//       typeName =
//           '${typeName.substring(0, typeName.length - $DtoList.length)}List';
//     }

//     typeName = typeName.capitalize;

//     if (!typeName.endsWith($Utility)) {
//       return '$typeName${$Utility}';
//     }

//     return typeName;
//   }
// }
