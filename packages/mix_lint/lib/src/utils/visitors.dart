import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

class RecursiveSimpleIdentifierVisitor extends RecursiveAstVisitor<void> {
  const RecursiveSimpleIdentifierVisitor({
    required this.onVisitSimpleIdentifier,
  });

  final void Function(SimpleIdentifier node) onVisitSimpleIdentifier;

  @override
  void visitSimpleIdentifier(SimpleIdentifier node) {
    onVisitSimpleIdentifier(node);
    node.visitChildren(this);
  }
}

class RecursiveFunctionExpressionInvocationVisitor
    extends RecursiveAstVisitor<void> {
  const RecursiveFunctionExpressionInvocationVisitor({
    required this.onVisitFunctionExpressionInvocation,
  });

  final void Function(FunctionExpressionInvocation node)
      onVisitFunctionExpressionInvocation;

  @override
  void visitFunctionExpressionInvocation(FunctionExpressionInvocation node) {
    onVisitFunctionExpressionInvocation(node);
    node.visitChildren(this);
  }
}
