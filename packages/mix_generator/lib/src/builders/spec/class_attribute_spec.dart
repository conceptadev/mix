import 'package:mix_annotations/mix_annotations.dart';
import '../method_debug_fill_properties.dart';
import '../method_equality.dart';
import '../method_merge.dart';
import '../method_resolve.dart';
import '../../helpers/field_info.dart';

String specAttributeClass(ClassBuilderContext<MixableSpec> context) {
  final specName = context.name;

  final specInstance = ClassInfo.ofElement(context.classElement);
  final hasDiagnosticable = context.hasDiagnosticable;

  final attributeInstance = ClassInfo(
    name: context.attributeName,
    fields: context.fields,
    isBase: specInstance.isBase,
    isFinal: specInstance.isFinal,
    mixinTypes: hasDiagnosticable ? {'Diagnosticable'} : {},
    extendsType: context.attributeExtendsType,
  );

  final nonSuperFields =
      attributeInstance.fields.where((field) => !field.isSuper).toList();

  final fieldDeclarations = nonSuperFields.map((field) {
    final fieldType = field.dtoType ?? field.type;

    return 'final $fieldType? ${field.name};';
  }).join('\n  ');

  final optionalParameters = attributeInstance.fields.map((field) {
    return field.isSuper ? 'super.${field.name}' : 'this.${field.name}';
  }).join(', ');

  final resolveMethod = resolveMethodBuilder(
    attributeInstance,
    resolvedName: specInstance.name,
    resolvedConstructor: specInstance.constructorRef,
    withDefaults: false,
  );

  final mergeMethod = mergeMethodBuilder(attributeInstance);

  final debugFillProperties =
      hasDiagnosticable ? methodDebugFillProperties(attributeInstance) : '';

  final propsGetter = getterPropsBuilder(attributeInstance);

  final contructorParameters =
      attributeInstance.fields.isEmpty ? '' : '{$optionalParameters,}';

  return '''

/// Represents the attributes of a [$specName].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [$specName].
///
/// Use this class to configure the attributes of a [$specName] and pass it to
/// the [$specName] constructor.
${attributeInstance.writeDefinition()}{

  $fieldDeclarations

  const ${attributeInstance.writeConstructor()}($contructorParameters);

  $resolveMethod

  $mergeMethod

  $propsGetter

  $debugFillProperties
}
''';
}
