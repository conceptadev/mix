import 'package:mix_annotations/mix_annotations.dart';

import '../../helpers/field_info.dart';
import '../../helpers/type_extension.dart';
import '../../helpers/type_ref_repository.dart';
import '../methods.dart';

String specMixinBuilder({
  required AnnotatedClassBuilderContext<MixableSpec> context,
  required String specAttributeName,
}) {
  String buildStaticMethodFrom() {
    final specName = context.name;

    final constDef = context.isConst ? 'const ' : '';

    final constructorCall = '$constDef${context.name}${context.constructorRef}';

    return '''
static $specName from(${$MixData} mix) {
   return mix.attributeOf<$specAttributeName>()?.resolve(mix) ?? $constructorCall();
}
''';
  }

  String buildStaticMethodOf() {
    final specName = context.name;
    final generatedName = '_\$$specName';

    return '''
/// {@template ${specName.snakecase}_of}
/// Retrieves the [$specName] from the nearest [Mix] ancestor in the widget tree.
///
/// This method uses [Mix.of] to obtain the [Mix] instance associated with the
/// given [BuildContext], and then retrieves the [$specName] from that [Mix].
/// If no ancestor [Mix] is found, this method returns an empty [$specName].
///
/// Example:
///
/// ```dart
/// final ${specName.lowercaseFirst} = $specName.of(context);
/// ```
/// {@endtemplate}
static $specName of(BuildContext context) {
  return $generatedName.from(Mix.of(context));
}
''';
  }

  final mixinName = '_\$${context.name}';

  final specType = context.isModifierSpec ? $WidgetModifierSpec : $Spec;

  final generateStaticMethods = !context.isModifierSpec;

  final hasCopyWith = context.hasMethod('copyWith');
  final hasLerp = context.hasMethod('lerp');

  final copyMethod = hasCopyWith
      ? ''
      : copyWithMethodBuilder(
          ownerClass: context.definition,
          usePrivateRef: true,
        );

  final lerpMethod = hasLerp
      ? ''
      : lerpMethodBuilder(
          ownerClass: context.definition,
          isInternalRef: true,
        );

  final propsGetter =
      getterPropsBuilder(ownerClass: context.definition, usePrivateRef: true);

  final selfGetter = getterSelfBuilder(context.definition);

  final debugFillProperties = context.definition.isDiagnosticable
      ? methodDebugFillProperties(
          ownerClass: context.definition,
          usePrivateRef: true,
        )
      : '';

  final staticMethodFrom = generateStaticMethods ? buildStaticMethodFrom() : '';

  final staticMethodOf = generateStaticMethods ? buildStaticMethodOf() : '';

  return '''
 mixin $mixinName on $specType<${context.name}> {

  $staticMethodFrom

  $staticMethodOf

  $copyMethod

  $lerpMethod

  $propsGetter

  $selfGetter

  $debugFillProperties

}
''';
}
