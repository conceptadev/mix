import '../metadata/resolvable_metadata.dart';
import '../utils/code_builder.dart';
import '../utils/utility_method_builder.dart';

class ResolvableUtilityBuilder implements CodeBuilder {
  final ResolvableMetadata metadata;

  const ResolvableUtilityBuilder(this.metadata);

  @override
  String build() {
    final dtoName = metadata.name;
    final resolvedTypeName = metadata.resolvedElement.name;

    final utilityName = '${resolvedTypeName}Utility';

    // Use old or new logic to generate utility fields from the ClassElement:
    final generatedFields = UtilityMethods.generateUtilityFields(
      dtoName,
      metadata.parameters,
    );

    // Build your class using a ClassBuilder or do it manually:
    final classBuilder = ClassBuilder(
      className: utilityName,
      documentation: '''
/// Utility class for configuring [$resolvedTypeName] properties.
///
/// This class provides methods to set individual properties of a [$resolvedTypeName].
/// Use the methods of this class to configure specific properties of a [$resolvedTypeName].
''',
      extendsClass: 'DtoUtility<T, $dtoName, $resolvedTypeName>',
      typeParameters: '<T extends Attribute>',
      constructorCode:
          '$utilityName(super.builder) : super(valueToDto: (v) => v.toDto());',

      // The fields you want in the generated class
      fields: generatedFields,

      // The methods you want in the generated class, reintroducing call()
      methods: [
        UtilityMethods.generateUtilityFieldsFromClass(metadata.element),
        UtilityMethods.methodOnly(
          utilityType: dtoName,
          fields: metadata.parameters,
        ),
        UtilityMethods.methodCall(metadata.parameters),
      ],
    );

    return classBuilder.build();
  }
}
