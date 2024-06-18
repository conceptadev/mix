import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:mix_lint/src/utils/extensions/instance_creation_expression.dart';
import 'package:mix_lint/src/utils/type_checker.dart';

class AvoidDefiningTokensWithinThemeData extends DartLintRule {
  AvoidDefiningTokensWithinThemeData() : super(code: _code);

  static const _code = LintCode(
    name: 'mix_avoid_defining_tokens_within_theme_data',
    problemMessage:
        'Ensure that Tokens instances are not created directly inside MixThemeData constructors.',
    correctionMessage:
        'Instantiate Tokens outside of MixThemeData constructors.',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addInstanceCreationExpression((node) {
      final type = node.staticType;
      if (type == null || //
          !mixTokenChecker.isAssignableFromType(type)) return;

      if (!node.isDecendentOf(mixThemeDataChecker)) return;

      reporter.reportErrorForOffset(
        _code,
        node.offset,
        node.length,
      );
    });
  }
}
