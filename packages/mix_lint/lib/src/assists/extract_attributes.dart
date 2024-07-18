import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:mix_lint/src/utils/extensions/dart_file_edit_builder.dart'
    as ext;
import 'package:mix_lint/src/utils/type_checker.dart';

class ExtractAttributes extends DartAssist {
  @override
  Future<void> run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    SourceRange target,
  ) async {
    const extractedFieldName = 'extractedAttributes';
    final unit = await resolver.getResolvedUnitResult();

    context.registry.addInstanceCreationExpression((node) {
      if (!node.sourceRange.covers(target)) return;
      if (node.staticType == null ||
          !styleChecker.isAssignableFromType(node.staticType!)) return;

      final (ancestorNode, offset) = _getValidAncestor(node);

      if (ancestorNode == null || offset == null) return;

      final changeBuilder = reporter.createChangeBuilder(
        message: 'Extract Attributes',
        priority: 100,
      );

      changeBuilder.addDartFileEdit((builder) {
        try {
          builder.addSimpleReplacement(
            target,
            '$extractedFieldName(),',
          );
          builder.addSimpleInsertion(
            offset,
            'final $extractedFieldName = Style(${unit.content.substring(target.offset, target.end)});',
          );
          builder.formatBasedOnAncestor<ClassDeclaration>(node);
        } catch (e) {
          return;
        }
      });
    });
  }

  (AstNode?, int? offset) _getValidAncestor(InstanceCreationExpression node) {
    AstNode? result;
    result = node.thisOrAncestorMatching<Block>((node) {
      return node is Block;
    });

    if (result != null) return (result, result.offset + 1);

    result = node.thisOrAncestorMatching<FieldDeclaration>((node) {
      return node is FieldDeclaration;
    });

    if (result != null) return (result, result.offset);

    return (null, null);
  }
}
