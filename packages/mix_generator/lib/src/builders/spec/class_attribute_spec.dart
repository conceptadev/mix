import 'package:mix_generator/src/builders/method_debug_fill_properties.dart';
import 'package:mix_generator/src/builders/method_equality.dart';
import 'package:mix_generator/src/builders/method_merge.dart';
import 'package:mix_generator/src/builders/method_resolve.dart';
import 'package:mix_generator/src/helpers/builder_utils.dart';

String specAttributeClass(SpecAnnotationContext context) {
  final specName = context.name;
  final className = context.attributeClassName;
  final fields = context.fields;
  final extendsType = 'SpecAttribute<$specName>';

  final nonSuperFields = fields.where((field) => !field.isSuper).toList();

  final fieldDeclarations = nonSuperFields.map((field) {
    final fieldType = field.dtoType ?? '${field.type}';
    return 'final $fieldType? ${field.name};';
  }).join('\n  ');

  final constructorParameters = fields.map((field) {
    return field.isSuper ? 'super.${field.name}' : 'this.${field.name}';
  }).join(', ');

  final resolveMethod = resolveMethodBuilder(
    className: className,
    resolvedType: specName,
    fields: fields,
  );

  final mergeMethod = mergeMethodBuilder(
    className: className,
    context: context,
  );

  final debugFillProperties = methodDebugFillProperties(
    className: className,
    fields: fields,
  );

  final propsGetter = getterPropsBuilder(
    className: className,
    fields: fields,
  );

  return '''
/// Represents the attributes of a [$specName].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [$specName].
///
/// Use this class to configure the attributes of a [$specName] and pass it to
/// the [$specName] constructor.
final class $className extends $extendsType with Diagnosticable {
  $fieldDeclarations

  const $className({
    $constructorParameters,
  });

  $resolveMethod

  $mergeMethod

  $propsGetter

  $debugFillProperties
}
''';
}
