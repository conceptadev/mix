import 'package:mix_builder/src/builders/utility_class_builder.dart';
import 'package:mix_builder/src/helpers/builder_utils.dart';

String dtoUtilityClass(DtoAnnotationContext context) {
  final utilityType = context.name;
  final resolvedType = context.resolvedType;
  final utilityClassName = '${resolvedType}Utility';

  final fields = utilityFields(utilityType, context.fields);

  final callMethod = utilityMethodCallBuilder(context.fields);

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
final class $utilityClassName<T extends Attribute> extends DtoUtility<T, $utilityType, $resolvedType> {
  $fields

  $utilityClassName(super.builder) : super(valueToDto: (v)=>v.toDto());

  $onlyMethod

  $callMethod
}
''';
}
