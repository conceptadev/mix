import '../models/spec_metadata.dart';
import '../utils/code_builder.dart';
import '../utils/method_generators.dart';
import '../utils/string_utils.dart';

/// Builds the mixin for a Spec class.
class SpecMixinBuilder implements CodeBuilder {
  final SpecMetadata metadata;

  const SpecMixinBuilder(this.metadata);

  /// Generates static methods for regular specs
  String _generateStaticMethods() {
    final className = metadata.name;
    final specAttributeName = '${className}Attribute';

    // Static from method to create from MixData
    final fromMethod = '''
static $className from(MixData mix) {
  return mix.attributeOf<$specAttributeName>()?.resolve(mix) ?? ${metadata.isConst ? 'const' : ''} $className${metadata.constructorRef}();
}''';

    // Static of method to get from BuildContext
    final ofMethod = '''
/// {@template ${className.snakeCase}_of}
/// Retrieves the [$className] from the nearest [Mix] ancestor in the widget tree.
///
/// This method uses [Mix.of] to obtain the [Mix] instance associated with the
/// given [BuildContext], and then retrieves the [$className] from that [Mix].
/// If no ancestor [Mix] is found, this method returns an empty [$className].
///
/// Example:
///
/// ```dart
/// final ${className.camelCase} = $className.of(context);
/// ```
/// {@endtemplate}
static $className of(BuildContext context) {
  return _\$$className.from(Mix.of(context));
}''';

    return '$fromMethod\n\n  $ofMethod';
  }

  @override
  String build() {
    final className = metadata.name;
    final mixinName = '_\$$className';

    // Determine the base spec type
    final specType = metadata.isWidgetModifier
        ? 'WidgetModifierSpec<$className>'
        : 'Spec<$className>';

    // Generate static methods for regular specs
    final staticMethods =
        metadata.isWidgetModifier ? '' : _generateStaticMethods();

    // Check which methods need to be generated
    final hasCopyWith = metadata.hasMethod('copyWith');
    final hasLerp = metadata.hasMethod('lerp');
    final hasProps = metadata.hasMethod('props');

    // Generate methods as needed
    final methods = <String>[];

    methods.add(staticMethods);

    if (metadata.withCopyWith && !hasCopyWith) {
      methods.add(MethodGenerators.generateCopyWithMethod(
        className: className,
        constructorRef: metadata.constructorRef,
        fields: metadata.fields,
        isConst: metadata.isConst,
        useInternalRef: true,
      ));
    }

    if (metadata.withLerp && !hasLerp) {
      methods.add(MethodGenerators.generateLerpMethod(
        className: className,
        constructorRef: metadata.constructorRef,
        fields: metadata.fields,
        isConst: metadata.isConst,
        useInternalRef: true,
      ));
    }

    if (metadata.withEquality && !hasProps) {
      methods.add(MethodGenerators.generatePropsGetter(
        className: className,
        fields: metadata.fields,
        useInternalRef: true,
      ));
    }

    // Add self getter
    methods.add('$className get _\$this => this as $className;');

    // Add diagnostics methods if needed
    if (metadata.isDiagnosticable) {
      methods.add(MethodGenerators.generateDebugFillPropertiesMethod(
        fields: metadata.fields,
        useInternalRef: true,
      ));
    }

    // Combine all methods
    final methodsText = methods.where((m) => m.isNotEmpty).join('\n\n  ');

    return '''
/// A mixin that provides spec functionality for [$className].
mixin $mixinName on $specType {
  $methodsText
}''';
  }
}
