import 'package:mix_builder/src/builders/method_equality.dart';
import 'package:mix_builder/src/builders/method_merge.dart';
import 'package:mix_builder/src/builders/method_resolve.dart';
import 'package:mix_builder/src/helpers/builder_utils.dart';

String specAttributeClass(SpecAnnotationContext context) {
  final className = context.name;
  final attributeClassName = context.attributeClassName;
  final fields = context.fields;
  final extendsType = 'SpecAttribute<$className>';

  final nonSuperFields = fields.where((field) => !field.isSuper).toList();

  final fieldDeclarations = nonSuperFields.map((field) {
    final fieldType = field.dtoType ?? '${field.type}';
    return 'final $fieldType? ${field.name};';
  }).join('\n  ');

  final constructorParameters = fields.map((field) {
    return field.isSuper ? 'super.${field.name}' : 'this.${field.name}';
  }).join(', ');

  final resolveMethod = resolveMethodBuilder(
    resolvedType: className,
    fields: fields,
  );

  final mergeMethod = mergeMethodBuilder(
    className: attributeClassName,
    context: context,
  );

  final propsGetter = getterPropsBuilder(
    className: attributeClassName,
    fields: fields,
  );

  return '''
/// Represents the attributes of a [$className].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [$className].
///
/// Use this class to configure the attributes of a [$className] and pass it to
/// the [$className] constructor.
final class $attributeClassName extends $extendsType {
  $fieldDeclarations

  const $attributeClassName({
    $constructorParameters,
  });

  $resolveMethod

  $mergeMethod

  $propsGetter
}
''';
}
