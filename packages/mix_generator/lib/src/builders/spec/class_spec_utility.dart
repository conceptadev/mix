import 'package:mix_annotations/mix_annotations.dart';
import '../utility_class_builder.dart';
import '../../helpers/field_info.dart';

String specUtilityClass(ClassBuilderContext<MixableSpec> context) {
  if (context.annotation.skipUtility) {
    return '';
  }

  final attributeName = context.attributeName;

  final instance = ClassInfo(
    name: context.utilityName,
    fields: context.fields,
    extendsType: 'SpecUtility<T, $attributeName>',
    genericTypes: {'T extends Attribute'},
  );

  final className = instance.name;

  final fields = generateUtilityFields(attributeName, context.fields);

  final onlyMethod = utilityMethodOnlyBuilder(
    utilityType: attributeName,
    fields: context.fields,
  );

  return '''
/// Utility class for configuring [$attributeName] properties.
///
/// This class provides methods to set individual properties of a [$attributeName].
/// Use the methods of this class to configure specific properties of a [$attributeName].
 ${instance.writeDefinition()} {
  $fields

  ${instance.writeConstructor()}(super.builder);

  static final self = $className((v) => v);

  $onlyMethod
}
''';
}
