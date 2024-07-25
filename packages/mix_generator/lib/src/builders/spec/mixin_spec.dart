import 'package:mix_annotations/mix_annotations.dart';
import 'package:mix_generator/src/builders/getter_self_reference.dart';
import 'package:mix_generator/src/builders/method_copy_with.dart';
import 'package:mix_generator/src/builders/method_debug_fill_properties.dart';
import 'package:mix_generator/src/builders/method_equality.dart';
import 'package:mix_generator/src/builders/method_lerp_builder.dart';
import 'package:mix_generator/src/helpers/builder_utils.dart';
import 'package:mix_generator/src/helpers/field_info.dart';
import 'package:mix_generator/src/helpers/helpers.dart';

String specMixin(ClassBuilderContext<MixableSpec> context) {
  final specClass =
      ClassInfo.ofElement(context.classElement, asInternalRef: true);

  final specClassName = specClass.name;

  final mixinName = context.generatedName;
  final specType = context.specType;

  final generateStaticMethods = !context.classElement.isWidgetModifier;

  final hasCopyWith =
      context.classElement.methods.any((e) => e.name == 'copyWith');
  final hasLerp = context.classElement.methods.any((e) => e.name == 'lerp');

  final copyMethod = hasCopyWith ? '' : copyWithMethodBuilder(specClass);

  final lerpMethod = hasLerp ? '' : lerpMethodBuilder(specClass);

  final propsGetter = getterPropsBuilder(specClass);

  final selfGetter = getterSelfBuilder(specClass);

  final debugFillProperties =
      context.hasDiagnosticable ? methodDebugFillProperties(specClass) : '';

  final staticMethodFrom =
      generateStaticMethods ? _staticMethodFromBuilder(context) : '';

  final staticMethodOf =
      generateStaticMethods ? _staticMethodOfBuilder(context) : '';

  return '''
 mixin $mixinName on $specType<$specClassName> {

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

String _staticMethodFromBuilder(ClassBuilderContext<MixableSpec> context) {
  final specName = context.name;
  final attributeName = context.attributeName;
  final constructorRef = context.constructorRef;
  final constDef = context.isConst ? 'const ' : '';
  return '''
static $specName from(MixData mix) {
   return mix.attributeOf<$attributeName>()?.resolve(mix) ?? $constDef$specName$constructorRef();
}
''';
}

String _staticMethodOfBuilder(
  ClassBuilderContext<MixableSpec> context,
) {
  final specName = context.name;

  final generatedName = context.generatedName;

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
