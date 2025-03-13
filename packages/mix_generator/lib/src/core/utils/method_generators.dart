import 'package:analyzer/dart/element/element.dart';

import '../models/field_metadata.dart';
import 'dart_type_utils.dart';
import 'helpers.dart';
import 'string_utils.dart';

/// Utilities for generating common method implementations.
class MethodGenerators {
  const MethodGenerators._();

  /// Generates a merge method implementation
  static String generateMergeMethod({
    required String className,
    required List<FieldMetadata> fields,
    required bool isAbstract,
    required bool shouldMergeLists,
    required bool useInternalRef,
  }) {
    final mergeStatements = fields.map((field) {
      final fieldName = field.name;
      final fieldNameRef = useInternalRef ? field.asInternalRef : fieldName;
      // Handle list fields with proper null-aware spread
      if (field.isListType) {
        return shouldMergeLists
            ? '$fieldName: MixHelpers.mergeList($fieldNameRef, other.$fieldName),'
            : '$fieldName: [...? $fieldNameRef, ...? other.$fieldName],';
      } else if (field.isDto || field.isSpecAttribute) {
        final representationType = field.representationType;
        // Build a default merge statement using the merge() method if available
        final defaultMerge =
            '$fieldName: $fieldNameRef?.merge(other.$fieldName) ?? other.$fieldName,';

        // Extract the element from the representation type (if it exists)
        final representationElement = representationType?.type?.element;
        if (representationElement == null) {
          return defaultMerge;
        }

        // Check if a custom merge method (e.g., tryToMerge) exists for this element
        final hasCustomMerge = _checkIfHasTryToMerge(representationElement);

        // Use the custom merge if available; otherwise, fall back to the default merge
        return hasCustomMerge
            ? '$fieldName: ${representationElement.name ?? ''}.tryToMerge($fieldNameRef, other.$fieldName),'
            : defaultMerge;
      }

      // Default: use the value from other if non-null, otherwise fallback to this value
      return '$fieldName: other.$fieldName ?? $fieldNameRef,';
    }).join('\n');

    final thisRef = useInternalRef ? '_\$this' : 'this';
    final returnCode =
        fields.isEmpty ? 'other' : '$className($mergeStatements)';

    return '''
    /// Merges the properties of this [$className] with the properties of [other].
    ///
    /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
    /// [$className] with the properties of [other] taking precedence over 
    /// the corresponding properties of this instance.
    ///
    /// Properties from [other] that are null will fall back
    /// to the values from this instance.
    @override
    $className merge(${isAbstract ? 'covariant ' : ''}$className? other) {
      if (other == null) return $thisRef;

      return $returnCode;
    }''';
  }

  /// Generates a resolve method implementation
  static String generateResolveMethod({
    required String className,
    required String constructorRef,
    required List<FieldMetadata> fields,
    required bool isConst,
    required String resolvedType,
    required bool withDefaults,
    required bool useInternalRef,
  }) {
    final params = buildParameters(fields, (field) {
      final fieldName = useInternalRef ? field.asInternalRef : field.name;
      // Use the default constant (e.g. $kDefaultValueRef) as in the old implementation
      final fallbackExpression = field.nullable && withDefaults
          ? ' ?? defaultValue.${field.name}'
          : '';

      if (field.isDto || field.isSpecAttribute) {
        if (field.isListType) {
          return '$fieldName?.map((e) => e.resolve(mix)).toList()$fallbackExpression';
        }

        return '$fieldName?.resolve(mix)$fallbackExpression';
      }

      return '$fieldName$fallbackExpression';
    });

    final constModifier = fields.isEmpty && isConst ? 'const ' : '';

    const defaultValueRef = 'defaultValue';

    return '''
  /// Resolves to [$resolvedType] using the provided [MixData].
  /// 
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `$defaultValueRef` for that property.
  ///
  /// ```dart
  /// final ${resolvedType.lowerCaseFirst} = $className(...).resolve(mix);
  /// ```
  @override
  $resolvedType resolve(MixData mix) {
    return $constModifier$resolvedType$constructorRef(
      $params
    );
  }''';
  }

  /// Generates a props getter for equality comparison
  static String generatePropsGetter({
    required String className,
    required List<FieldMetadata> fields,
    required bool useInternalRef,
  }) {
    final propsFields = fields.map((field) {
      final fieldRef = useInternalRef ? field.asInternalRef : field.name;

      return '$fieldRef,';
    }).join('\n');

    return '''
  /// The list of properties that constitute the state of this [$className].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [$className] instances for equality.
  @override
  List<Object?> get props => [
$propsFields
    ];''';
  }

  /// Generates a copyWith method
  static String generateCopyWithMethod({
    required String className,
    required String constructorRef,
    required List<FieldMetadata> fields,
    required bool isConst,
    required bool useInternalRef,
  }) {
    final params = buildParameters(fields, (field) {
      final fieldName =
          useInternalRef ? field.asInternalRef : 'this.${field.name}';

      return '${field.name} ?? $fieldName';
    });

    final optionalParams = buildArguments(
      fields,
      (field) => '${field.type}? ${field.name}',
    );

    final constModifier = fields.isEmpty && isConst ? 'const ' : '';

    return '''
  /// Creates a copy of this [$className] but with the given fields
  /// replaced with the new values.
  @override
  $className copyWith($optionalParams) {
    return $constModifier$className$constructorRef(
      $params
    );
  }''';
  }

  /// Generates a debugFillProperties method
  static String generateDebugFillPropertiesMethod({
    required List<FieldMetadata> fields,
    required bool useInternalRef,
  }) {
    final expandableFields = {'decoration', 'style'};

    final propertyStatements = fields.map((field) {
      final fieldName = field.name;
      final fieldRef = useInternalRef ? field.asInternalRef : fieldName;

      final isExpandable = expandableFields.contains(fieldName);
      if (isExpandable) {
        return 'properties.add(DiagnosticsProperty(\'$fieldName\', $fieldRef, expandableValue: true, defaultValue: null));';
      }

      return 'properties.add(DiagnosticsProperty(\'$fieldName\', $fieldRef, defaultValue: null));';
    }).join('\n    ');

    final methodName =
        useInternalRef ? '_debugFillProperties' : 'debugFillProperties';
    final superCall =
        useInternalRef ? '' : 'super.debugFillProperties(properties);\n    ';

    final override = useInternalRef ? '' : '@override';

    return '''
  $override
  void $methodName(DiagnosticPropertiesBuilder properties) {
    $superCall$propertyStatements
  }''';
  }

  /// Generates a lerp method
  static String generateLerpMethod({
    required String className,
    required String constructorRef,
    required List<FieldMetadata> fields,
    required bool isConst,
    required bool useInternalRef,
  }) {
    final thisRef = useInternalRef ? '_\$this' : 'this';

    // Categorize fields by interpolation method
    final Map<String, List<String>> lerpMethods = {};
    final List<String> stepMethodFields = [];

    for (final field in fields) {
      final lerpMethod = _getLerpMethodName(field);
      if (lerpMethod != null) {
        lerpMethods.putIfAbsent(lerpMethod, () => []).add(field.name);
      } else {
        stepMethodFields.add(field.name);
      }
    }

    // Build lerp expressions for each field
    final lerpStatements = buildParameters(
      fields,
      (field) => _getLerpExpression(field, useInternalRef),
    );

    // Generate the documentation for the method
    final lerpMethodsDocs = lerpMethods.entries
        .map((e) =>
            '/// - [${e.key}] for ${e.value.map((name) => '[$name]').join(' and ')}.\n')
        .join();

    final stepMethodDocs = stepMethodFields.isEmpty
        ? ''
        : '''/// For ${stepMethodFields.map((e) => '[$e]').join(' and ')}, the interpolation is performed using a step function.
/// If [t] is less than 0.5, the value from the current [$className] is used. Otherwise, the value
/// from the [other] [$className] is used.
///''';

    final constKeyword = (fields.isEmpty && isConst) ? 'const ' : '';

    final constructorCall = '$constKeyword$className$constructorRef';

    return '''
/// Linearly interpolates between this [$className] and another [$className] based on the given parameter [t].
///
/// The parameter [t] represents the interpolation factor, typically ranging from 0.0 to 1.0.
/// When [t] is 0.0, the current [$className] is returned. When [t] is 1.0, the [other] [$className] is returned.
/// For values of [t] between 0.0 and 1.0, an interpolated [$className] is returned.
///
/// If [other] is null, this method returns the current [$className] instance.
///
/// The interpolation is performed on each property of the [$className] using the appropriate
/// interpolation method:
$lerpMethodsDocs$stepMethodDocs
/// This method is typically used in animations to smoothly transition between
/// different [$className] configurations.
  @override
  $className lerp($className? other, double t) {
    if (other == null) return $thisRef;

    return $constructorCall($lerpStatements);
  }
''';
  }
}

/// Generates the lerp expression for a single field
String _getLerpExpression(FieldMetadata field, bool isInternalRef) {
  if (!field.annotation.isLerpable) {
    return 'other.${field.name}';
  }

  final thisFieldName = isInternalRef ? field.asInternalRef : field.name;
  final otherFieldName = 'other.${field.name}';
  final stepExpression = 't < 0.5 ? $thisFieldName : $otherFieldName';

  // If no element is available, use step interpolation
  if (field.dartType.element == null) {
    return stepExpression;
  }

  // Check if field type has an instance lerp method
  if (_hasInstanceLerpMethod(field.dartType.element) || field.isSpec) {
    final nullableDot = field.nullable ? '?' : '';
    final nullFallback = field.nullable ? ' ?? $otherFieldName' : '';

    return '$thisFieldName$nullableDot.lerp($otherFieldName, t)$nullFallback';
  }

  final representationType = field.representationType;

  if (representationType != null) {
    if (field.isSpec) {
      return '$thisFieldName.lerp($otherFieldName, t)';
    }
  }

  // Check if field type has a static lerp method
  final lerpMethod = _getLerpMethodName(field);
  if (lerpMethod == null) {
    return stepExpression;
  }

  final forceNonNull = field.nullable ? '' : '!';

  return '$lerpMethod($thisFieldName, $otherFieldName, t)$forceNonNull';
}

/// Checks if the element or its mixins have an instance lerp method
bool _hasInstanceLerpMethod(Element? element) {
  if (element is! ClassElement) return false;

  // Check the class itself
  if (_hasLerpMethodWithSignature(element, isStatic: false)) return true;

  // Check mixins
  return element.mixins.any(
    (mixin) => _hasLerpMethodWithSignature(mixin.element, isStatic: false),
  );
}

/// Checks if the element or its supertypes have a static lerp method
bool _hasStaticLerpMethod(Element? element) {
  if (element is! ClassElement) return false;

  // Check the class and its supertypes
  final typesToCheck = [
    element,
    ...element.allSupertypes
        .where((type) => !type.isDartCoreObject)
        .map((type) => type.element),
  ];

  return typesToCheck
      .any((type) => _hasLerpMethodWithSignature(type, isStatic: true));
}

/// Checks if the element has a lerp method with the expected signature
bool _hasLerpMethodWithSignature(
  InterfaceElement element, {
  required bool isStatic,
}) {
  return element.methods.any((method) =>
      method.name == 'lerp' &&
      method.isPublic &&
      method.isStatic == isStatic &&
      method.parameters.length == (isStatic ? 3 : 2) &&
      method.parameters.last.type.isDartCoreDouble);
}

bool _checkIfHasTryToMerge(Element element) {
  if (element is! ClassElement) {
    return false;
  }

  for (final type in [
    element,
    ...element.allSupertypes
        .where((e) => !e.isDartCoreObject)
        .map((e) => e.element),
  ]) {
    for (final method in type.methods) {
      if (method.name == 'tryToMerge' &&
          method.isStatic &&
          method.isPublic &&
          method.parameters.length == 2) {
        return true;
      }
    }
  }

  return false;
}

/// Gets the appropriate lerp method name for a field
String? _getLerpMethodName(FieldMetadata field) {
  // Special case handling
  if (field.type == 'TextStyle') {
    return MixHelperRef.lerpTextStyle;
  }

  // Check if the field has a custom lerp method
  if (_hasStaticLerpMethod(field.dartType.element)) {
    return '${field.type}.lerp';
  }

  // Known types with standard lerp methods
  return switch (field.type) {
    'double' => MixHelperRef.lerpDouble,
    'Matrix4' => MixHelperRef.lerpMatrix4,
    'StrutStyle' => MixHelperRef.lerpStrutStyle,
    'List<Shadow>' => MixHelperRef.lerpShadowList,
    _ => null,
  };
}
