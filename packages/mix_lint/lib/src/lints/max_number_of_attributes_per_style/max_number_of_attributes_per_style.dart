import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:mix_lint/src/lints/max_number_of_attributes_per_style/max_number_of_attributes_per_style_parameters.dart';
import 'package:mix_lint/src/utils/extensions/lint_rule_node_registry.dart';
import 'package:mix_lint/src/utils/type_checker.dart';

import '../../utils/rule_config.dart';

class MaxNumberOfAttributesPerStyle extends DartLintRule {
  MaxNumberOfAttributesPerStyle._(this.parameters, {required super.code});

  final MaxNumberOfAttributesPerStyleParameters parameters;

  factory MaxNumberOfAttributesPerStyle.fromConfig(CustomLintConfigs configs) {
    final rule = RuleConfig<MaxNumberOfAttributesPerStyleParameters>(
      configs: configs,
      name: 'mix_max_number_of_attributes_per_style',
      errorSeverity: ErrorSeverity.WARNING,
      paramsParser: MaxNumberOfAttributesPerStyleParameters.fromJson,
      problemMessage: (value) =>
          'The maximum allowed attributes of a function is ${value.maxNumber}.',
    );

    return MaxNumberOfAttributesPerStyle._(
      rule.parameters,
      code: rule.lintCode,
    );
  }

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addInstanceCreationExpressionFor(
      styleChecker,
      (node) {
        if (node.argumentList.arguments.length > parameters.maxNumber) {
          reporter.reportErrorForNode(code, node);
        }
      },
    );

    context.registry.addFunctionExpressionInvocationFor(
      variantAttributeChecker,
      (node) {
        if (node.argumentList.arguments.length > parameters.maxNumber) {
          reporter.reportErrorForNode(code, node);
        }
      },
    );
  }
}
