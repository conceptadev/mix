import 'package:mix_builder/src/builders/utility_class_builder.dart';
import 'package:mix_builder/src/helpers/builder_utils.dart';

String specUtilityClass(SpecAnnotationContext context) {
  final utilityType = context.attributeClassName;
  final utilityClassName = '${context.name}Utility';

  final fields = generateUtilityFields(utilityType, context.fields);

  final onlyMethod = utilityMethodOnlyBuilder(
    utilityType: utilityType,
    fields: context.fields,
  );

  return '''
/// Utility class for configuring [$utilityType] properties.
///
/// This class provides methods to set individual properties of a [$utilityType].
///
/// Use the methods of this class to configure specific properties of a [$utilityType].
base class $utilityClassName<T extends Attribute> extends SpecUtility<T, $utilityType> {
  $fields

  $utilityClassName(super.builder);

  static final self = $utilityClassName((v) => v);

  $onlyMethod
}
''';
}
