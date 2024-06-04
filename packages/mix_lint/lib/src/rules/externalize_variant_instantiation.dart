import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:mix_lint/src/utils/extensions/instance_creation_expression.dart';
import 'package:mix_lint/src/utils/type_checker.dart';

class ExternalizeVariantInstantiation extends DartLintRule {
  ExternalizeVariantInstantiation() : super(code: _code);

  static const _code = LintCode(
    name: 'externalize_variant_instantiation',
    problemMessage:
        'Ensure that Variant instances are not created directly inside Style constructors. Instead, instantiate Variant outside and pass it as a parameter',
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
          !variantChecker.isAssignableFromType(type)) return;

      if (!node.isDecendentOf(styleChecker)) return;

      reporter.reportErrorForOffset(
        _code,
        node.offset,
        node.length,
      );
    });
  }
}
