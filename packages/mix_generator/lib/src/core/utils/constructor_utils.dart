import 'package:analyzer/dart/element/element.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:source_gen/source_gen.dart';

/// Finds the most appropriate constructor for code generation.
///
/// Prioritizes constructors in this order:
/// 1. Constructors annotated with @MixableConstructor
/// 2. Unnamed default constructor
/// 3. Named constructors
///
/// Throws if no suitable constructor is found.
ConstructorElement findTargetConstructor(ClassElement classElement) {
  // First, look for constructors with @MixableConstructor annotation
  const constructorChecker = TypeChecker.fromRuntime(MixableConstructor);

  for (final constructor in classElement.constructors) {
    if (constructorChecker.hasAnnotationOf(constructor)) {
      print('Found constructor: ${constructor.name}');

      return constructor;
    }
  }

  // If no annotated constructor, fall back to unnamed constructor
  final unnamedConstructor = classElement.constructors
      .where((c) => c.name.isEmpty && !c.isFactory)
      .firstOrNull;

  if (unnamedConstructor != null) {
    return unnamedConstructor;
  }

  // Last resort: just use the first constructor
  if (classElement.constructors.isNotEmpty) {
    final firstConstructor = classElement.constructors.first;
    if (!firstConstructor.isFactory) {
      return firstConstructor;
    }
  }

  // No suitable constructor found
  throw InvalidGenerationSourceError(
    'No suitable constructor found for ${classElement.name}. '
    'Please provide a non-factory constructor or annotate a constructor '
    'with @MixableConstructor().',
    element: classElement,
  );
}

/// Checks if a constructor is valid for code generation
bool isValidConstructor(ConstructorElement constructor) {
  final isPublic = constructor.isPublic;

  final hasUndefinedParamTypes = constructor.parameters.any((param) {
    final library = param.type.element?.library;

    return library != null && !library.isInSdk;
  });

  final hasAnyPrivateParams = constructor.parameters.any((param) {
    return param.isPrivate;
  });

  return isPublic && !hasUndefinedParamTypes && !hasAnyPrivateParams;
}
