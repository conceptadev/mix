import '../../builders/attribute/utility_class_builder.dart';
import '../models/spec_metadata.dart';
import '../type_registry.dart';
import '../utils/code_builder.dart';

class SpecUtilityBuilder implements CodeBuilder {
  final SpecMetadata metadata;
  final TypeRegistry typeRegistry;

  SpecUtilityBuilder(this.metadata, {TypeRegistry? typeRegistry})
      : typeRegistry = typeRegistry ?? TypeRegistry.instance;

  @override
  String build() {
    final specName = metadata.name;
    final attributeName = '${specName}Attribute';
    final utilityName = '${specName}Utility';

    // Use old or new logic to generate utility fields from the ClassElement:
    final generatedFields = generateUtilityFields(
      attributeName,
      metadata.fields,
      typeRegistry,
    );

    // Build your class using a ClassBuilder or do it manually:
    final classBuilder = ClassBuilder(
      className: utilityName,
      documentation: '''
/// Utility class for configuring [$specName] properties.
///
/// This class provides methods to set individual properties of a [$specName].
/// Use the methods of this class to configure specific properties of a [$specName].
''',
      extendsClass: 'SpecUtility<T, $attributeName>',
      typeParameters: '<T extends Attribute>',
      constructorCode: '$utilityName(super.builder, {super.mutable});',

      // The fields you want in the generated class
      fields: generatedFields,

      // The methods you want in the generated class, reintroducing call()
      methods: [
        utilityMethodChainGetter(utilityName),
        utilityMethodSelfGetter(utilityName, attributeName),
        utilityMethodOnlyBuilder(
          utilityType: attributeName,
          fields: metadata.fields,
        ),
      ],
    );

    return classBuilder.build();
  }
}
