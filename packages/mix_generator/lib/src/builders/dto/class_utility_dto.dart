import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generator/src/builders/utility_class_builder.dart';
import 'package:mix_generator/src/helpers/field_info.dart';

String dtoUtilityClass(ClassBuilderContext<MixableDto> context) {
  final className = context.name;
  final referenceType = context.referenceClass.name;
  // This class element is in context.element. This element is like this
  // class SampleClass extends AnotherClass<Generic> {}
  // taking this in consideration how can I get teh value of Generic?

  final utilityClassName = '${referenceType}Utility';

  final fields = generateUtilityFields(className, context.fields);

  final valueClassFields = generateUtilityFieldsFromClass(context.classElement);

  final callMethod = utilityMethodCallBuilder(context.fields);

  final onlyMethod = utilityMethodOnlyBuilder(
    utilityType: className,
    fields: context.fields,
  );

  return '''
/// Utility class for configuring [$className] properties.
///
/// This class provides methods to set individual properties of a [$className].
/// Use the methods of this class to configure specific properties of a [$className].
 class $utilityClassName<T extends Attribute> extends DtoUtility<T, $className, $referenceType> {
  $fields

  $valueClassFields

  $utilityClassName(super.builder) : super(valueToDto: (v)=>v.toDto());

  $onlyMethod

  $callMethod
}
''';
}
