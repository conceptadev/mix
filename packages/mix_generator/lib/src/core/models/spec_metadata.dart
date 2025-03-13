import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import '../utils/annotation_utils.dart';
import '../utils/constructor_utils.dart';
import 'base_metadata.dart';
import 'field_metadata.dart';

/// Metadata for Spec classes, extracted from MixableSpec annotations.
class SpecMetadata extends BaseMetadata {
  /// Whether to generate a copyWith method
  final bool withCopyWith;

  /// Whether to generate equality methods (== and hashCode)
  final bool withEquality;

  /// Whether to generate a lerp method
  final bool withLerp;

  /// Whether to skip generating a utility class
  final bool skipUtility;

  /// The prefix for the spec
  final String prefix;

  /// Whether this is a widget modifier spec
  final bool isWidgetModifier;

  SpecMetadata({
    required super.element,
    required super.name,
    required super.fields,
    required super.isConst,
    required super.isDiagnosticable,
    required super.constructor,
    required super.isAbstract,
    required this.withCopyWith,
    required this.withEquality,
    required this.withLerp,
    required this.skipUtility,
    required this.prefix,
    required this.isWidgetModifier,
  });

  /// Creates a SpecMetadata from a class element and its annotation
  static SpecMetadata fromAnnotation(
    ClassElement element,
    ConstantReader annotation,
  ) {
    final mixableSpec = readMixableSpec(element);
    final constructor = findTargetConstructor(element);
    final fields = FieldMetadata.extractFromClass(element);

    // Check for WidgetModifierSpec
    bool isWidgetModifier = false;
    for (var interface in element.allSupertypes) {
      if (interface.element.name == 'WidgetModifierSpec') {
        isWidgetModifier = true;
        break;
      }
    }

    return SpecMetadata(
      element: element,
      name: element.name,
      fields: fields,
      isConst: element.unnamedConstructor?.isConst ?? false,
      isDiagnosticable: element.allSupertypes.any(
        (e) => e.element.name == 'Diagnosticable',
      ),
      constructor: constructor,
      isAbstract: element.isAbstract,
      withCopyWith: mixableSpec.withCopyWith,
      withEquality: mixableSpec.withEquality,
      withLerp: mixableSpec.withLerp,
      skipUtility: mixableSpec.skipUtility,
      prefix: mixableSpec.prefix,
      isWidgetModifier: isWidgetModifier,
    );
  }

  String get extendsAttributeOfType => isWidgetModifier
      ? 'WidgetModifierSpecAttribute<$name>'
      : 'SpecAttribute<$name>';

  String get attributeName => '${name}Attribute';

  String get utilityName => '${name}Utility';

  String get tweenName => '${name}Tween';
}
