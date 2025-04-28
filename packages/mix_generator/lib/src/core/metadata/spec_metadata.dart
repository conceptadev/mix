import 'package:analyzer/dart/element/element.dart';

import '../utils/annotation_utils.dart';
import '../utils/constructor_utils.dart';
import 'base_metadata.dart';
import 'field_metadata.dart';

/// Metadata for Spec classes, extracted from MixableSpec annotations.
class SpecMetadata extends BaseMetadata {
  final int generatedMethods;

  final int generatedComponents;

  /// Whether this is a widget modifier spec
  final bool isWidgetModifier;

  const SpecMetadata({
    required super.element,
    required super.name,
    required super.parameters,
    required super.isConst,
    required super.isDiagnosticable,
    required super.constructor,
    required super.isAbstract,
    required this.generatedMethods,
    required this.generatedComponents,
    required this.isWidgetModifier,
  });

  /// Creates a SpecMetadata from a class element and its annotation
  static SpecMetadata fromAnnotation(ClassElement element) {
    final mixableSpec = readMixableSpec(element);
    final constructor = findTargetConstructor(element);
    final parameters = ParameterMetadata.extractFromConstructor(element);

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
      parameters: parameters,
      isConst: element.unnamedConstructor?.isConst ?? false,
      isDiagnosticable: element.allSupertypes.any(
        (e) => e.element.name == 'Diagnosticable',
      ),
      constructor: constructor,
      isAbstract: element.isAbstract,
      generatedMethods: mixableSpec.methods,
      generatedComponents: mixableSpec.components,
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
