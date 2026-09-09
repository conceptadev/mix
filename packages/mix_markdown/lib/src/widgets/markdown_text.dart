import 'package:flutter/widgets.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:mix/mix.dart';

import '../specs/markdown_spec.dart';
import 'inline_spans.dart';

/// A paragraph or heading rendered as rich text.
///
/// Forwards the same [TextSpec] properties as [StyledText], and marks
/// headings as such for assistive technology.
class MarkdownText extends StatelessWidget {
  /// The `p` or `h1`..`h6` element.
  final md.Element element;

  /// Block text style.
  final StyleSpec<TextSpec> styleSpec;

  /// Document style, read for the inline slots.
  final MarkdownSpec spec;

  const MarkdownText({
    super.key,
    required this.element,
    required this.styleSpec,
    required this.spec,
  });

  Widget _buildText(BuildContext context, TextSpec textSpec) {
    final spans = buildInlineSpans(
      element.children ?? const [],
      spec: spec,
      transform: textSpec.textDirectives?.apply,
    );
    if (spans.isEmpty) return const SizedBox.shrink();
    final text = Text.rich(
      TextSpan(children: spans),
      style: textSpec.style,
      strutStyle: textSpec.strutStyle,
      textAlign: textSpec.textAlign,
      textDirection: textSpec.textDirection,
      locale: textSpec.locale,
      softWrap: textSpec.softWrap,
      overflow: textSpec.overflow,
      textScaler: textSpec.textScaler,
      maxLines: textSpec.maxLines,
      semanticsLabel: textSpec.semanticsLabel,
      textWidthBasis: textSpec.textWidthBasis,
      textHeightBehavior: textSpec.textHeightBehavior,
      selectionColor: textSpec.selectionColor,
    );

    return element.tag.startsWith('h')
        ? Semantics(header: true, child: text)
        : text;
  }

  @override
  Widget build(BuildContext context) =>
      StyleSpecBuilder<TextSpec>(styleSpec: styleSpec, builder: _buildText);
}
