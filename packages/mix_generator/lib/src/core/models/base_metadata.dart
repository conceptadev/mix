import 'package:analyzer/dart/element/element.dart';

import '../models/field_metadata.dart';

/// Base class for metadata used in code generation.
///
/// This provides common properties and methods needed across different
/// annotation types (Spec, DTO, etc.).
abstract class BaseMetadata {
  /// The annotated class element
  final ClassElement element;

  /// The name of the class
  final String name;

  /// The fields/parameters of the class
  final List<FieldMetadata> fields;

  /// Whether the class has a const constructor
  final bool isConst;

  /// Whether the class implements the Diagnosticable mixin
  final bool isDiagnosticable;

  /// The constructor to use for code generation
  final ConstructorElement constructor;

  /// Whether the class is abstract
  final bool isAbstract;

  BaseMetadata({
    required this.element,
    required this.name,
    required this.fields,
    required this.isConst,
    required this.isDiagnosticable,
    required this.constructor,
    required this.isAbstract,
  });

  /// Gets the constructor reference for code generation (empty or .name)
  String get constructorRef =>
      constructor.name.isEmpty ? '' : '.${constructor.name}';

  /// Checks if the class has a specific method
  bool hasMethod(String methodName) =>
      element.methods.any((m) => m.name == methodName);
}
