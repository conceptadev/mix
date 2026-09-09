import 'package:flutter/widgets.dart';
import 'package:markdown/markdown.dart' as md;

import '../specs/markdown_spec.dart';

final _rawBreak = RegExp(r'<br\s*/?>', caseSensitive: false);

/// Builds the spans of one block from its inline [nodes].
///
/// Nested formatting composes, so `***both***` is bold and italic. Inline
/// images contribute their alt text, and raw `<br>` tags outside code become
/// line breaks. A [transform] that keeps the character count keeps every
/// styled run; one that changes it yields a single unstyled span, because
/// the runs can no longer be mapped onto the new text.
List<InlineSpan> buildInlineSpans(
  List<md.Node> nodes, {
  required MarkdownSpec spec,
  String Function(String)? transform,
}) {
  final runs = <_Run>[];

  void collect(md.Node node, TextStyle style, {required bool inCode}) {
    if (node is md.Text) {
      final text = inCode ? node.text : node.text.replaceAll(_rawBreak, '\n');
      if (text.isNotEmpty) runs.add(_Run(text, style));
    } else if (node is md.Element) {
      final merged = style.merge(_inlineStyle(spec, node.tag));
      switch (node.tag) {
        case 'br':
          runs.add(_Run('\n', merged));
        case 'img':
          final alt = node.attributes['alt'] ?? '';
          if (alt.isNotEmpty) runs.add(_Run(alt, merged));
        default:
          for (final child in node.children ?? const <md.Node>[]) {
            collect(child, merged, inCode: inCode || node.tag == 'code');
          }
      }
    }
  }

  for (final node in nodes) {
    collect(node, const TextStyle(), inCode: false);
  }
  if (transform != null) {
    final plain = runs.map((run) => run.text).join();
    final transformed = transform(plain);
    if (plain.characters.length != transformed.characters.length) {
      return [TextSpan(text: transformed)];
    }
    var remaining = transformed.characters;
    for (var index = 0; index < runs.length; index++) {
      final length = runs[index].text.characters.length;
      runs[index] = _Run(remaining.take(length).string, runs[index].style);
      remaining = remaining.skip(length);
    }
  }

  return [for (final run in runs) TextSpan(text: run.text, style: run.style)];
}

TextStyle _inlineStyle(MarkdownSpec spec, String tag) => switch (tag) {
  'strong' || 'b' => const TextStyle(
    fontWeight: FontWeight.bold,
  ).merge(spec.strong?.spec.style),
  'em' || 'i' => const TextStyle(
    fontStyle: FontStyle.italic,
  ).merge(spec.emphasis?.spec.style),
  'del' || 's' => const TextStyle(
    decoration: TextDecoration.lineThrough,
  ).merge(spec.strikethrough?.spec.style),
  'code' => const TextStyle(
    fontFamily: 'monospace',
  ).merge(spec.code?.spec.style),
  'a' => spec.link?.spec.style ?? const TextStyle(),
  _ => const TextStyle(),
};

class _Run {
  final String text;
  final TextStyle style;

  const _Run(this.text, this.style);
}
