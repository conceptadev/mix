import 'package:mix_builder/src/builders/getter_self_reference.dart';
import 'package:mix_builder/src/builders/method_copy_with.dart';
import 'package:mix_builder/src/builders/method_equality.dart';
import 'package:mix_builder/src/builders/method_lerp_builder.dart';
import 'package:mix_builder/src/helpers/builder_utils.dart';
import 'package:mix_builder/src/helpers/types.dart';

String specMixin(SpecAnnotationContext context) {
  final className = context.name;
  final mixinName = context.mixinExtensionName;
  final attributeName = context.attributeClassName;
  final fields = context.fields;

  final specRef = MixTypes.foundation.spec.symbol!;

  final fromMethod = _staticMethodFromBuilder(
    specName: className,
    attributeName: attributeName,
  );

  final ofMethod = _staticMethodOfBuilder(
    specName: className,
    mixinName: mixinName,
  );

  final copyMethod = copyWithMethodBuilder(
    className: className,
    fields: fields,
    isInternalRef: true,
  );

  final lerpMethod = lerpMethodBuilder(
    context: context,
    isInternalRef: true,
  );

  final propsGetter = getterPropsBuilder(
    className: className,
    fields: fields,
    isInternalRef: true,
  );

  final selfGetter = getterSelfBuilder(className: className);

  return '''
base mixin $mixinName on $specRef<$className> {
  $fromMethod

  $ofMethod

  $copyMethod

  $lerpMethod

  $propsGetter

  $selfGetter
}
''';
}

String _staticMethodFromBuilder({
  required String specName,
  required String attributeName,
}) {
  return '''
static $specName from(MixData mix) {
   return mix.attributeOf<$attributeName>()?.resolve(mix) ?? const $specName();
}
''';
}

String _staticMethodOfBuilder({
  required String specName,
  required String mixinName,
}) {
  return '''
static $specName of(BuildContext context) {
  return $mixinName.from(Mix.of(context));
}
''';
}
