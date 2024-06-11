import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'src/lints/avoid_variant_inside_context_variant.dart';
import 'src/lints/externalize_token_instantiation.dart';
import 'src/lints/externalize_variant_instantiation.dart';
import 'src/lints/order_attributes_in_style.dart';

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
