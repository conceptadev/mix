import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'src/rules/attributes_order.dart';
import 'src/rules/avoid_variant_inside_contextvariant.dart';
import 'src/rules/externalize_token_instantiation.dart';
import 'src/rules/externalize_variant_instantiation.dart';

PluginBase createPlugin() => _MixLint();

class _MixLint extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        AttributesOrderInStyle(),
        ExternalizeVariantInstantiation(),
        ExternalizeTokenInstantiation(),
        AvoidVariantInsideContextvariant(),
      ];
}
