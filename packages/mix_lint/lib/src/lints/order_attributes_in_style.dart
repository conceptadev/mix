import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:mix_lint/src/utils/type_checker.dart';

class AttributesOrderInStyle extends DartLintRule {
  AttributesOrderInStyle() : super(code: _code);

  static const _code = LintCode(
    name: 'order_attributes_in_style',
    problemMessage:
        'Ensure that the attributes are ordered on groups of the same category in the Style constructor',
  );

  final _whiteList = ['Style.asAttribute'];

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addInstanceCreationExpression((node) {
      if (node.staticType == null ||
          !styleChecker.isAssignableFromType(node.staticType!)) return;

      final arguments = node.argumentList.arguments;

      if (hasAnyAttributeOutOfOrder(arguments)) {
        reporter.reportErrorForNode(
          _code,
          node,
        );
      }
    });

    context.registry.addFunctionExpressionInvocation((expression) {
      void reportWhen(bool condition) {
        if (!condition) return;
        final arguments = expression.argumentList.arguments;

        if (hasAnyAttributeOutOfOrder(arguments)) {
          reporter.reportErrorForNode(
            _code,
            expression,
          );
        }
      }

      if (expression.staticType == null) return;

      reportWhen(
        variantAttributeChecker.isAssignableFromType(expression.staticType!),
      );

      reportWhen(
        _whiteList.contains(expression.childEntities.first.toString()),
      );
    });
  }

  bool hasAnyAttributeOutOfOrder(List<Expression> listOfUsedTokens) {
    for (var i = 0; i < listOfUsedTokens.length; i++) {
      final currentToken = listOfUsedTokens[i];

      if (i + 1 < listOfUsedTokens.length) {
        final nextToken = listOfUsedTokens[i + 1];

        if (currentToken.staticType != nextToken.staticType) {
          final result = listOfUsedTokens
              .sublist(i + 1)
              .any((e) => e.staticType == currentToken.staticType);

          if (result) return true;
        }
      }
    }

    return false;
  }
}
