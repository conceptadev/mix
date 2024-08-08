import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:mix_lint/src/utils/type_checker.dart';

const _whiteList = ['Style.asAttribute'];

class AttributesOrdering extends DartLintRule {
  AttributesOrdering() : super(code: _code);

  static const _code = LintCode(
    name: 'mix_attributes_ordering',
    problemMessage:
        'Ensure that the attributes are ordered on groups of the same category in the Style constructor',
  );

  @override
  List<Fix> getFixes() => [
        _AttributesOrderingFix(),
      ];

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

      if (_hasAnyAttributeOutOfOrder(arguments)) {
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

        if (_hasAnyAttributeOutOfOrder(arguments)) {
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
}

class _AttributesOrderingFix extends DartFix {
  @override
  void run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
  ) {
    ChangeBuilder createChangeBuilder() => reporter.createChangeBuilder(
          message: 'Fix the order of the attributes',
          priority: 80,
        );

    void addReplacement(
      ChangeBuilder changeBuilder,
      SourceRange sourceRange,
      List<Expression> arguments,
    ) {
      changeBuilder.addDartFileEdit((builder) {
        builder.addSimpleReplacement(
          sourceRange,
          '(${fixParentheses(arguments.join(','))})',
        );
        builder.format(sourceRange);
      });
    }

    void suggestReplacementIfNeeded({
      required List<Expression> arguments,
      required SourceRange sourceRange,
    }) {
      if (!_hasAnyAttributeOutOfOrder(arguments)) return;

      final copiedList = arguments.map((e) => e).toList();
      sortArgument(copiedList);

      addReplacement(
        createChangeBuilder(),
        sourceRange,
        copiedList,
      );
    }

    context.registry.addInstanceCreationExpression((node) {
      if (!analysisError.sourceRange.intersects(node.sourceRange)) return;
      if (!styleChecker.isAssignableFromType(node.staticType!)) return;

      suggestReplacementIfNeeded(
        arguments: node.argumentList.arguments,
        sourceRange: node.argumentList.sourceRange,
      );
    });

    context.registry.addFunctionExpressionInvocation((expression) {
      if (!analysisError.sourceRange.intersects(expression.sourceRange)) return;
      if (expression.staticType == null) return;

      if (variantAttributeChecker
          .isAssignableFromType(expression.staticType!)) {
        suggestReplacementIfNeeded(
          arguments: expression.argumentList.arguments,
          sourceRange: expression.argumentList.sourceRange,
        );
      }

      if (_whiteList.contains(
        expression.childEntities.first.toString(),
      )) {
        suggestReplacementIfNeeded(
          arguments: expression.argumentList.arguments,
          sourceRange: expression.argumentList.sourceRange,
        );
      }
    });
  }

  String fixParentheses(String input) {
    return input.replaceAllMapped(RegExp(r'\)(?!,)'), (match) => '),');
  }

  void sortArgument(List<Expression> arguments) {
    final currentOrder =
        arguments.map((e) => e.staticType!.toString()).toSet().toList();

    final mapWithOthers = Map.fromIterables(
      currentOrder,
      List<int>.generate(currentOrder.length, (i) => i + 1),
    );

    arguments.sort(
      (a, b) {
        final weightA = mapWithOthers[a.staticType!.toString()] ?? 0;
        final weightB = mapWithOthers[b.staticType!.toString()] ?? 0;
        return weightA.compareTo(weightB);
      },
    );
  }
}

bool _hasAnyAttributeOutOfOrder(List<Expression> listOfUsedTokens) {
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
