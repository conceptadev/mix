import '../../builders/attribute/utility_class_builder.dart';
import '../models/dto_metadata.dart';
import '../type_registry.dart';
import '../utils/code_builder.dart';

class DtoUtilityBuilder implements CodeBuilder {
  final DtoMetadata metadata;
  final TypeRegistry typeRegistry;

  DtoUtilityBuilder(this.metadata, {TypeRegistry? typeRegistry})
      : typeRegistry = typeRegistry ?? TypeRegistry.instance;

  /// Creates a getter to enable chained configuration.

  @override
  String build() {
    final dtoName = metadata.name;
    final resolvedTypeName = metadata.resolvedType.name;

    final utilityName = '${resolvedTypeName}Utility';

    // Use old or new logic to generate utility fields from the ClassElement:
    final generatedFields = generateUtilityFields(
      dtoName,
      metadata.fields,
      typeRegistry,
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
        utilityMethodChainGetter(utilityName),
        utilityMethodOnlyBuilder(
          utilityType: dtoName,
          fields: metadata.fields,
        ),
        utilityMethodCallBuilder(metadata.fields),
      ],
    );

    return classBuilder.build();
  }
}
