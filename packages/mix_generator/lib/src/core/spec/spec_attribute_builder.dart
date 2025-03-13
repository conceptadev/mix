import '../models/spec_metadata.dart';
import '../utils/code_builder.dart';
import '../utils/helpers.dart';
import '../utils/method_generators.dart';

/// Builds the attribute class for a spec.
class SpecAttributeBuilder implements CodeBuilder {
  final SpecMetadata metadata;

  const SpecAttributeBuilder(this.metadata);

  /// Builds the field declarations
  List<String> _buildFieldDeclarations() {
    return metadata.fields.where((field) => !field.isSuper).map((field) {
      final fieldType = field.representationType?.name ?? field.type;

      return 'final $fieldType? ${field.name};';
    }).toList();
  }

  /// Builds the methods
  List<String> _buildMethods(String attributeName) {
    final methods = <String>[];

    // Add resolve method
    methods.add(MethodGenerators.generateResolveMethod(
      className: attributeName,
      constructorRef: '',
      fields: metadata.fields,
      isConst: metadata.isConst,
      resolvedType: metadata.name,
      withDefaults: false,
      useInternalRef: false,
    ));

    // Add merge method
    methods.add(MethodGenerators.generateMergeMethod(
      className: attributeName,
      fields: metadata.fields,
      isAbstract: metadata.isAbstract,
      shouldMergeLists: true,
      useInternalRef: false,
    ));

    // Add props getter
    methods.add(MethodGenerators.generatePropsGetter(
      className: attributeName,
      fields: metadata.fields,
      useInternalRef: false,
    ));

    // Add debug fill properties if needed
    if (metadata.isDiagnosticable) {
      methods.add(MethodGenerators.generateDebugFillPropertiesMethod(
        fields: metadata.fields,
        useInternalRef: false,
      ));
    }

    return methods;
  }

  @override
  String build() {
    final params = buildArguments(metadata.fields, (field) {
      final fieldName = field.name;

      return field.isSuper ? 'super.$fieldName' : 'this.$fieldName';
    });

    final specName = metadata.name;
    final attributeName = metadata.attributeName;
    final extendsAttributeOfType = metadata.extendsAttributeOfType;

    // Build the class
    final classBuilder = ClassBuilder(
      className: attributeName,
      documentation: '''
/// Represents the attributes of a [$specName].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [$specName].
///
/// Use this class to configure the attributes of a [$specName] and pass it to
/// the [$specName] constructor.''',
      isFinal: false,
      isBase: false,
      extendsClass: extendsAttributeOfType,
      withMixins: metadata.isDiagnosticable ? ['Diagnosticable'] : [],
      constructorCode: 'const $attributeName($params);',
      fields: _buildFieldDeclarations(),
      methods: _buildMethods(attributeName),
    );

    return classBuilder.build();
  }
}
