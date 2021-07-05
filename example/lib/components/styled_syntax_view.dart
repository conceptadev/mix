import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class StyledSyntaxView extends StatelessWidget {
  const StyledSyntaxView(this.code, {Key? key}) : super(key: key);

  final String code;

  @override
  Widget build(BuildContext context) {
    return SyntaxView(
      code: code,
      syntax: Syntax.DART,
      syntaxTheme: SyntaxTheme.ayuDark(),
      withLinesCount: false,
      fontSize: 14,
      withZoom: false,
    );
  }
}
