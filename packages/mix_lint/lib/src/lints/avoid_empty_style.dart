import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:mix_lint/src/utils/type_checker.dart';

class AvoidEmptyStyle extends DartLintRule {
  AvoidEmptyStyle() : super(code: _code);

  static const _code = LintCode(
    name: 'mix_avoid_empty_style',
    problemMessage: 'Style instances must be created with parameters.',
    correctionMessage:
        'Add parameters to the \'Style\' constructor or remove it.',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addInstanceCreationExpression((node) {
      if (node.staticType == null) return;
      if (!styleChecker.isAssignableFromType(node.staticType!)) {
        return;
      }

      if (node.argumentList.arguments.isEmpty) {
        reporter.reportErrorForNode(
          _code,
          node,
        );
      }
    });

    context.registry.addFunctionExpressionInvocation((node) {
      if (node.staticType == null) return;
      if (node.childEntities.first.toString() != 'Style.asAttribute') {
        return;
      }

      if (node.argumentList.arguments.isEmpty) {
        reporter.reportErrorForNode(
          _code,
          node,
        );
      }
    });
  }
}
