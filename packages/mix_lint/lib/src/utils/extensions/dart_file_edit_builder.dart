import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer_plugin/utilities/change_builder/change_builder_dart.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

extension DartFileEditBuilderExt on DartFileEditBuilder {
  void formatBasedOnAncestor<E extends AstNode>(AstNode node) {
    final ancestorClass = node.thisOrAncestorMatching<E>((node) {
      return node is E;
    });
    if (ancestorClass == null) return;
    format(ancestorClass.sourceRange);
  }
}
