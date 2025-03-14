// lib/src/utils/type_utilities.dart
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';
import 'package:logging/logging.dart';

import 'extensions.dart';

//------------------------------------------------------------------------------
// CORE TYPE UTILITIES
//------------------------------------------------------------------------------

/// Core type utility functions for working with the Dart analyzer.
///
/// This class provides reusable functionality for resolving and analyzing types
/// that are common across all code generation use cases.
class TypeUtils {
  static final _logger = Logger('TypeUtils');

  const TypeUtils._();

  /// Resolves a [DartType] to its corresponding [ClassElement] when possible.
  ///
  /// This handles interface types directly and attempts to resolve type parameters
  /// to their bounds.
  ///
  /// Returns null if the type cannot be resolved to a class element.
  static ClassElement? resolveTypeToClass(DartType type) {
    try {
      if (type is InterfaceType) {
        return type.element as ClassElement;
      } else if (type is TypeParameterType && type.element.bound != null) {
        // For generic type parameters, try to resolve the bound
        return resolveTypeToClass(type.element.bound!);
      }

      return null;
    } catch (e) {
      _logger.warning('Failed to resolve type to class: $type', e);

      return null;
    }
  }

  /// Finds a specific supertype of a class by name.
  ///
  /// Returns the [InterfaceType] of the supertype if found, or null otherwise.
  static InterfaceType? findSupertype(Element element, String typeName) {
    if (element is InterfaceElement) {
      try {
        return element.allSupertypes.firstWhereOrNull(
          (supertype) => supertype.element.name == typeName,
        );
      } catch (e) {
        _logger.warning(
          'Failed to find supertype $typeName in ${element.name}',
          e,
        );

        return null;
      }
    }

    return null;
  }

  /// Extracts a generic type argument from a specific supertype.
  ///
  /// This is particularly useful for working with base classes or interfaces that
  /// use generics, such as `BaseClass<T>`.
  ///
  /// Returns null if the supertype is not found or has no type arguments.
  static DartType? getGenericFromSupertype(
    ClassElement element,
    String typeName, {
    int argumentIndex = 0,
  }) {
    try {
      final supertype = findSupertype(element, typeName);
      if (supertype == null ||
          supertype.typeArguments.isEmpty ||
          argumentIndex >= supertype.typeArguments.length) {
        return null;
      }

      final typeArgument = supertype.typeArguments[argumentIndex];

      // If it's a type parameter, try to resolve it to its bound
      if (typeArgument is TypeParameterType) {
        return typeArgument.bound;
      }

      return typeArgument;
    } catch (e) {
      _logger.warning(
        'Failed to get generic type from supertype $typeName in ${element.name}',
        e,
      );

      return null;
    }
  }

  /// Resolves a generic type to its concrete type.
  ///
  /// If the type is a type parameter, this will try to resolve it to its bound.
  /// If the type is an interface type, it will return the type as is.
  static DartType? resolveGenericType(DartType type) {
    if (type is TypeParameterType) {
      // If the type is a generic type parameter, resolve its bound
      var bound = type.element.bound;
      if (bound != null) {
        return resolveGenericType(bound);
      }

      return null;
    } else if (type is InterfaceType) {
      // If the type is an interface type, return it as the resolved type
      return type;
    }

    return null;
  }

  //----------------------------------------------------------------------------
  // MIX-SPECIFIC TYPE UTILITIES
  //----------------------------------------------------------------------------

  /// Gets the resolved type from a DTO.
  ///
  /// If the input type is a List of DTOs, this will return a List of the
  /// extracted DTO type arguments.
  static String getResolvedTypeFromDto(DartType type) {
    final isList = type.isList;
    DartType resolvedType = type;

    if (isList && type.firstTypeArgument != null) {
      resolvedType = type.firstTypeArgument!;
    }

    if (isResolvable(resolvedType)) {
      final dtoType = extractDtoTypeArgument(resolvedType.asClassElement!);
      if (dtoType != null) {
        resolvedType = dtoType;
      }
    }

    if (isList) {
      return 'List<${resolvedType.getTypeAsString()}>';
    }

    return resolvedType.getDisplayString(withNullability: false);
  }

  /// Checks if a type is a Dto.
  static bool isResolvable(DartType type) {
    if (type.element == null) return false;

    if (type.isList) {
      return isResolvable(type.firstTypeArgument!);
    }

    return findSupertype(type.element!, $Dto) != null;
  }

  /// Checks if a type is a Spec.
  static bool isSpec(DartType type) {
    if (type.element == null) return false;

    return findSupertype(type.element!, $Spec) != null;
  }

  /// Checks if an element is from the Mix package.
  static bool isMixRef(InterfaceElement element) {
    return element.source.uri.scheme == _mixUri.scheme &&
        element.source.uri.path.startsWith(_mixUri.path);
  }

  /// Extracts the type argument from a Dto class.
  ///
  /// For example, if the class is UserDto extends Dto<User>,
  /// this will return the User type.
  static DartType? extractDtoTypeArgument(ClassElement classElement) {
    try {
      // Check if the class itself is Dto<T>
      if (classElement.name == $Dto &&
          classElement.typeParameters.length == 1) {
        final typeArgument = classElement.thisType.typeArguments.first;

        return resolveGenericType(typeArgument);
      }

      // Traverse the class hierarchy
      for (final interface in classElement.allSupertypes) {
        if (interface.element.name == $Dto) {
          final typeArguments = interface.typeArguments;
          if (typeArguments.length == 1) {
            final typeArgument = typeArguments.first;

            return resolveGenericType(typeArgument);
          }
        }
      }

      return null;
    } catch (e) {
      _logger.warning(
        'Failed to extract DTO type argument from ${classElement.name}',
        e,
      );

      return null;
    }
  }

  /// Creates a tween name for an attribute or property.
  static String defineTweenName(String name) {
    return '${name}Tween';
  }
}

//------------------------------------------------------------------------------
// CONSTANTS AND HELPER REFERENCES
//------------------------------------------------------------------------------

/// URI for Mix package
final Uri _mixUri = Uri(scheme: 'package', path: 'mix/');

/// Class name constants used throughout the code generator
const $MixData = 'MixData';
const $Mix = 'Mix';
const $Attribute = 'Attribute';
const $Spec = 'Spec';
const $SpecAttribute = 'SpecAttribute';
const $WidgetModifierSpecAttribute = 'WidgetModifierSpecAttribute';
const $Dto = 'Dto';
const $DtoList = 'DtoList';
const $Utility = 'Utility';
const $DtoUtility = 'DtoUtility';
const $SpecUtility = 'SpecUtility';
const $WidgetModifierSpec = 'WidgetModifierSpec';

/// Enum defining different Mix component types.
enum MixType {
  mixUtility,
  dto,
  dtoUtility,
  spec,
  specAttribute,
  specUtility,
  widgetModifierSpec,
  widgetModifierSpecAttribute,
}

/// References to Mix helper functions used in generated code.
///
/// These references point to the actual implementation of helper functions
/// provided by the Mix framework.
class MixHelperRef {
  const MixHelperRef._();

  static String get _refName => 'MixHelpers';

  /// Reference to the deep equality function.
  static String get deepEquality => '$_refName.deepEquality';

  /// Reference to the double interpolation function.
  static String get lerpDouble => '$_refName.lerpDouble';

  /// Reference to the list merging function.
  static String get mergeList => '$_refName.mergeList';

  /// Reference to the StrutStyle interpolation function.
  static String get lerpStrutStyle => '$_refName.lerpStrutStyle';

  /// Reference to the Matrix4 interpolation function.
  static String get lerpMatrix4 => '$_refName.lerpMatrix4';

  /// Reference to the TextStyle interpolation function.
  static String get lerpTextStyle => '$_refName.lerpTextStyle';

  /// Reference to the integer interpolation function.
  static String get lerpInt => '$_refName.lerpInt';

  /// Reference to the Shadow list interpolation function.
  static String get lerpShadowList => '$_refName.lerpShadowList';
}

class ClassMemberCollection {
  final List<FieldElement> fields;
  final List<PropertyAccessorElement> accessors;
  final Map<String, FieldElement> fieldsByName;
  final Map<String, PropertyAccessorElement> accessorsByName;

  ClassMemberCollection({required this.fields, required this.accessors})
      : fieldsByName = {for (var f in fields) f.name: f},
        accessorsByName = {for (var a in accessors) a.name: a};

  /// Get a field by name, returns null if not found
  FieldElement? getField(String name) => fieldsByName[name];

  /// Get an accessor by name, returns null if not found
  PropertyAccessorElement? getAccessor(String name) => accessorsByName[name];
}

/// Collects all fields and accessors from a class and its superclasses
ClassMemberCollection collectClassMembers(InterfaceElement classElement) {
  final fields = <FieldElement>[];
  final accessors = <PropertyAccessorElement>[];
  final processedClasses = <String>{};

  void processClass(InterfaceElement element) {
    // Skip if already processed to avoid duplicates
    final elementId = element.displayName;
    if (processedClasses.contains(elementId)) return;
    processedClasses.add(elementId);

    // Add fields and accessors from this class
    fields.addAll(element.fields);
    accessors.addAll(element.accessors);

    // Process superclass if exists
    if (element.supertype != null &&
        element.supertype!.element.name != 'Object') {
      processClass(element.supertype!.element);
    }

    // Process mixins
    for (final mixin in element.mixins) {
      processClass(mixin.element);
    }

    // Process interfaces if needed
    // Uncomment if you need interface members too
    /*
    for (final interface in element.interfaces) {
      processClass(interface.element);
    }
    */
  }

  processClass(classElement);

  return ClassMemberCollection(fields: fields, accessors: accessors);
}
