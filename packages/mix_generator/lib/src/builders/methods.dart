import 'package:analyzer/dart/element/element.dart';

import '../helpers/builder_utils.dart';
import '../helpers/field_info.dart';
import '../helpers/helpers.dart';

const _expandableFields = ['decoration', 'style'];

String methodDebugFillProperties({
  required ClassDefinition ownerClass,
  required bool usePrivateRef,
}) {
  final fields = ownerClass.fields;
  final fieldStatements = fields.map((field) {
    final fieldName = usePrivateRef ? field.asInternalRef : field.name;
    if (_expandableFields.contains(fieldName)) {
      return 'properties.add(DiagnosticsProperty(\'${field.name}\', $fieldName, expandableValue: true, defaultValue: null));';
    }

    return 'properties.add(DiagnosticsProperty(\'${field.name}\', $fieldName, defaultValue: null));';
  }).join('\n');

  if (usePrivateRef) {
    return '''
  
  void _debugFillProperties(DiagnosticPropertiesBuilder properties) {  
    $fieldStatements
  }
  ''';
  }

  return '''
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    $fieldStatements
  }
''';
}

String copyWithMethodBuilder({
  required ClassDefinition ownerClass,
  required bool usePrivateRef,
}) {
  final fields = ownerClass.fields;
  final className = ownerClass.name;

  final fieldStatements = buildConstructorParams(fields, (field) {
    final fieldName =
        usePrivateRef ? field.asInternalRef : 'this.${field.name}';

    return '${field.name} ?? $fieldName';
  });

  final optionalParams =
      fields.map((field) => '${field.type}? ${field.name},').join('\n');

  final copyWithParams = fields.isEmpty ? '' : '{$optionalParams}';

  final shouldAddConst = fields.isEmpty && ownerClass.isConst;

  final constructorCall = '${ownerClass.name}${ownerClass.constructorRef}';

  return '''
  /// Creates a copy of this [$className] but with the given fields
  /// replaced with the new values.
  @override
  $className copyWith($copyWithParams) {
        return ${shouldAddConst ? 'const' : ''} $constructorCall($fieldStatements);
  }
''';
}

String getterPropsBuilder({
  required ClassDefinition ownerClass,
  required bool usePrivateRef,
}) {
  final className = ownerClass.name;
  final fields = ownerClass.fields;
  final fieldStatements = fields.map((field) {
    final fieldName = usePrivateRef ? field.asInternalRef : field.name;

    return '$fieldName,';
  }).join('\n');

  return '''
  /// The list of properties that constitute the state of this [$className].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [$className] instances for equality.
  @override
  List<Object?> get props => [
      $fieldStatements
    ];
''';
}

String methodEqualityOperatorBuilder({
  required String className,
  required List<ParameterInfo> fields,
}) {
  final equalityChecks = fields.map((field) {
    if (field.isListType) {
      return 'listEquals(other.${field.name}, ${field.name})';
    } else if (field.isMapType) {
      return 'mapEquals(other.${field.name}, ${field.name})';
    } else if (field.isSetType) {
      return 'setEquals(other.${field.name}, ${field.name})';
    }

    return 'other.${field.name} == ${field.name}';
  }).join(' && ');

  return '''
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is $className && $equalityChecks;
  }
''';
}

String getterHashcodeBuilder({
  required List<ParameterInfo> fields,
  bool usePrivateRef = false,
}) {
  final fieldStatements = fields.map((field) {
    final fieldName = usePrivateRef ? field.asInternalRef : field.name;

    return '$fieldName.hashCode';
  }).join(' ^ ');

  return '''
  @override
  int get hashCode => $fieldStatements;
''';
}

String toStringMethodBuilder({
  required ClassDefinition instance,
  bool usePrivateRef = false,
}) {
  final className = instance.name;
  final fields = instance.fields;
  final fieldStatements = fields.map((field) {
    final fieldName = usePrivateRef ? field.asInternalRef : field.name;

    return '${field.name}: $fieldName,';
  }).join('\n');

  return '''
  @override
  String toString() {
    return '$className(
      $fieldStatements
    )';
  }
''';
}

String mergeMethodBuilder({
  required ClassDefinition ownerClass,
  required bool usePrivateRef,
  required bool shouldMergeLists,
}) {
  final thisRef = usePrivateRef ? ParameterInfo.internalRefPrefix : 'this';

  final fields = ownerClass.fields;
  final enclosedClass = ownerClass.name;

  final isFinal = ownerClass.isFinal;

  final fieldStatements = buildConstructorParamsAsNamed(fields, (field) {
    final propName = field.name;
    final thisName = usePrivateRef ? field.asInternalRef : field.name;

    if (field.isListType) {
      final listNullable = field.nullable ? '?' : '';
      if (shouldMergeLists) {
        return '${MixHelperRef.mergeList}($thisName, other.$propName)';
      }

      return '[...$listNullable$thisName,...${listNullable}other.$propName]';
    }
    if (field.hasDto) {
      final hasTryToMerge = _checkIfHasTryToMerge(field.dartType.element!);
      final tryToMergeExpression =
          '${field.dtoType!}.tryToMerge($thisName, other.$propName)';

      // I have a type name that I want to see if I can get an element
      // to check if it has a tryToMerge method. How can I get that?
      // I need to get the element of the type name.

      if (hasTryToMerge) {
        return tryToMergeExpression;
      }

      // TODO: Hard coded for now, will be removed soon
      if (field.dtoType == 'DecorationDto') {
        return tryToMergeExpression;
      }

      return '$thisName?.merge(other.$propName) ?? other.$propName';
    }

    return 'other.$propName ?? $thisName';
  });

  final covariantKey = ownerClass.isAbstract ? 'covariant' : '';

  final constructorCall = '${ownerClass.name}${ownerClass.constructorRef}';

  final returnCode =
      fields.isEmpty ? 'other' : '$constructorCall($fieldStatements)';

  return '''
  /// Merges the properties of this [$enclosedClass] with the properties of [other].
  ///
  /// If [other] is null, returns this instance unchanged. Otherwise, returns a new
  /// [$enclosedClass] with the properties of [other] taking precedence over 
  /// the corresponding properties of this instance.
  ///
  /// Properties from [other] that are null will fall back
  /// to the values from this instance.
  @override
  $enclosedClass merge($covariantKey $enclosedClass? other) {
    if (other == null) return $thisRef;

    return $returnCode;
  }
''';
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

String resolveMethodBuilder({
  required ClassDefinition classDefinition,
  required String resolvedType,
  required bool usePrivateRef,
  required String resolvedTypeConstructor,
  required bool withDefaults,
}) {
  final fields = classDefinition.fields;
  final resolveStatements = buildConstructorParams(fields, (field) {
    final propName = field.name;
    var fieldName = usePrivateRef ? field.asInternalRef : field.name;

    final fallbackExpression =
        field.nullable && withDefaults ? '?? $kDefaultValueRef.$propName' : '';

    if (field.hasDto) {
      const nullableSign = '?';

      if (field.isListType) {
        return '$fieldName$nullableSign.map((e) => e.resolve(mix)).toList() $fallbackExpression';
      }
      if (field.dtoType == 'AnimatedDataDto') {
        return '$fieldName$nullableSign.resolve(mix) ?? mix.animation';
      }

      return '$fieldName$nullableSign.resolve(mix) $fallbackExpression';
    }

    return '$fieldName $fallbackExpression';
  });

  final ignoreLabel =
      fields.isEmpty ? '// ignore: prefer_const_constructors' : '';

  return '''
  /// Resolves to [$resolvedType] using the provided [MixData].
  /// 
  /// If a property is null in the [MixData], it falls back to the
  /// default value defined in the `$kDefaultValueRef` for that property.
  ///
  /// ```dart
  /// final ${resolvedType.lowercaseFirst} = ${classDefinition.name}(...).resolve(mix);
  /// ```
  @override
  $resolvedType resolve(MixData mix) {
    $ignoreLabel
    return $resolvedType$resolvedTypeConstructor(
      $resolveStatements
    );
  }
''';
}

String getterSelfBuilder(ClassDefinition instance) {
  final className = instance.name;

  return '$className get ${ParameterInfo.internalRefPrefix} => this as $className;';
}

/// Builds a lerp method for the given class
String lerpMethodBuilder({
  required ClassDefinition ownerClass,
  required bool isInternalRef,
}) {
  final className = ownerClass.name;
  final fields = ownerClass.fields;
  final thisRef = isInternalRef ? ParameterInfo.internalRefPrefix : 'this';

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
  final lerpStatements = buildConstructorParams(
    fields,
    (field) => _getLerpExpression(field, isInternalRef),
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

  final constKeyword = (fields.isEmpty && ownerClass.isConst) ? 'const ' : '';

  final constructorCall =
      '$constKeyword${ownerClass.name}${ownerClass.constructorRef}';

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

/// Gets the appropriate lerp method name for a field
String? _getLerpMethodName(ParameterInfo field) {
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

/// Generates the lerp expression for a single field
String _getLerpExpression(ParameterInfo field, bool isInternalRef) {
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
  if (_hasInstanceLerpMethod(field.dartType.element)) {
    final nullableDot = field.nullable ? '?' : '';
    final nullFallback = field.nullable ? ' ?? $otherFieldName' : '';

    return '$thisFieldName$nullableDot.lerp($otherFieldName, t)$nullFallback';
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
