import 'package:mix_annotations/mix_annotations.dart';

import '../../helpers/field_info.dart';
import '../../helpers/type_ref_repository.dart';
import '../methods.dart';

ClassBuilder specAttributeBuilder({
  required AnnotatedClassBuilderContext<MixableSpec> context,
  required bool shouldMergeLists,
}) {
  final specName = context.name;

  final isWidgetSpec = context.isModifierSpec;

  final specAttributeDef = ClassDefinition(
    name: '$specName${$Attribute}',
    fields: context.fields,
    extendTypes: isWidgetSpec
        ? '${$WidgetModifierSpecAttribute}<$specName>'
        : '${$SpecAttribute}<$specName>',
    isConst: true,
    isDiagnosticable: context.isDiagnosticable,
  );

  final hasDiagnosticable = context.isDiagnosticable;

  final nonSuperFields =
      specAttributeDef.fields.where((field) => !field.isSuper).toList();

  final fieldDeclarations = _buildFieldDeclarations(nonSuperFields);
  final optionalParameters = _buildOptionalParameters(context.fields);

  final resolveMethod = resolveMethodBuilder(
    classDefinition: specAttributeDef,
    resolvedType: specName,
    usePrivateRef: false,
    resolvedTypeConstructor: '',
    withDefaults: false,
  );

  final mergeMethod = mergeMethodBuilder(
    ownerClass: specAttributeDef,
    usePrivateRef: false,
    shouldMergeLists: shouldMergeLists,
  );

  final debugFillProperties = hasDiagnosticable
      ? methodDebugFillProperties(
          ownerClass: specAttributeDef,
          usePrivateRef: false,
        )
      : '';

  final propsGetter = getterPropsBuilder(
    ownerClass: specAttributeDef,
    usePrivateRef: false,
  );

  final constructorParameters =
      specAttributeDef.fields.isEmpty ? '' : '{$optionalParameters,}';

  final body = '''

/// Represents the attributes of a [$specName].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [$specName].
///
/// Use this class to configure the attributes of a [$specName] and pass it to
/// the [$specName] constructor.
${specAttributeDef.writeDeclaration()} {

  $fieldDeclarations

  ${specAttributeDef.writeConstructor(constructorParameters)}

  $resolveMethod

  $mergeMethod

  $propsGetter

  $debugFillProperties
}
''';

  return ClassBuilder(specAttributeDef, body);
}

String _buildFieldDeclarations(List<ParameterInfo> fields) {
  return fields.map((field) {
    final fieldType = field.dtoType ?? field.type;

    return 'final $fieldType? ${field.name};';
  }).join('\n  ');
}

String _buildOptionalParameters(List<ParameterInfo> fields) {
  return fields.map((field) {
    return field.isSuper ? 'super.${field.name}' : 'this.${field.name}';
  }).join(', ');
}
