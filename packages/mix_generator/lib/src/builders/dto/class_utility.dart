import '../../helpers/builder_utils.dart';
import '../../helpers/field_info.dart';
import '../utility_class_builder.dart';

String utilityClass(ClassBuilderContext context) {
  final isDto = context.classElement.isDto;

  final isSpec = context.classElement.isSpec;

  // Has isSpec attribute for now, but will be removed in the future
  final attributeName = context.name + (isSpec ? 'Attribute' : '');

  final refTypeName = context.classElement.genericType.name;

  final extendsType = isDto
      ? 'DtoUtility<T,  $attributeName, $refTypeName>'
      : 'SpecUtility<T, $attributeName>';

  final utilityName = '${refTypeName}Utility';

  final instance = ClassInfo(
    name: utilityName,
    fields: context.constructorParameters,
    extendsType: extendsType,
    genericTypes: {'T extends Attribute'},
  );

  final className = instance.name;

  final fields =
      generateUtilityFields(attributeName, context.constructorParameters);

  final onlyMethod = utilityMethodOnlyBuilder(
    utilityType: attributeName,
    fields: context.constructorParameters,
  );

  final valueClassFields = generateUtilityFieldsFromClass(context.classElement);

  final callMethodDefinition =
      isDto ? utilityMethodCallBuilder(context.constructorParameters) : '';

  final chainGetterDefinition = isDto
      ? ''
      : '''
  $utilityName<T> get chain => ${instance.writeConstructor()}(attributeBuilder, mutable: true);
  ''';

  final selfGetterDefinition = isDto
      ? ''
      : '''
  static $className<$attributeName> get self => $className((v) => v);
  ''';

  final constructorDefinition = instance.writeConstructor() +
      (isDto
          ? '(super.builder) : super(valueToDto: (v) => v.toDto());'
          : '(super.builder, {super.mutable});');

  return '''
/// Utility class for configuring [$refTypeName] properties.
///
/// This class provides methods to set individual properties of a [$refTypeName].
/// Use the methods of this class to configure specific properties of a [$refTypeName].
 ${instance.writeDefinition()} {
  $fields

  $valueClassFields

  $constructorDefinition

  $chainGetterDefinition

  $selfGetterDefinition

  $onlyMethod

  $callMethodDefinition
}
''';
}
