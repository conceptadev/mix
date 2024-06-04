import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:mix_lint/src/utils/extensions/instance_creation_expression.dart';
import 'package:mix_lint/src/utils/type_checker.dart';

class ExternalizeTokenInstantiation extends DartLintRule {
  ExternalizeTokenInstantiation() : super(code: _code);

  static const _code = LintCode(
    name: 'externalize_token_instantiation',
    problemMessage:
        'Ensure that Tokens instances are not created directly inside Style constructors. Instead, instantiate Tokens outside and pass it as a parameter',
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
          !mixToken.isAssignableFromType(type)) return;

      if (!node.isDecendentOf(mixThemeDataChecker)) return;

      reporter.reportErrorForOffset(
        _code,
        node.offset,
        node.length,
      );
    });
  }
}
