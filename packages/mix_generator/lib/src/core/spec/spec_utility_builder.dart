import '../metadata/spec_metadata.dart';
import '../utils/code_builder.dart';
import '../utils/utility_method_builder.dart';

class SpecUtilityBuilder implements CodeBuilder {
  final SpecMetadata metadata;

  const SpecUtilityBuilder(this.metadata);

  @override
  String build() {
    final specName = metadata.name;
    final attributeName = '${specName}Attribute';
    final utilityName = '${specName}Utility';

    // Use old or new logic to generate utility fields from the ClassElement:
    final generatedFields = UtilityMethods.generateUtilityFields(
      attributeName,
      metadata.parameters,
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
        UtilityMethods.chainGetter(utilityName),
        UtilityMethods.selfGetter(utilityName, attributeName),
        UtilityMethods.methodOnly(
          utilityType: attributeName,
          fields: metadata.parameters,
        ),
      ],
    );

    return classBuilder.build();
  }
}
