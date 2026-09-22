import 'package:flutter/widgets.dart';
import 'package:markdown/markdown.dart' as md;

import '../parsing/markdown_tags.dart';
import '../specs/markdown_spec.dart';

final _rawBreak = RegExp(r'<br\s*/?>', caseSensitive: false);

/// Builds the spans of one block from its inline [nodes].
///
/// Nested formatting composes, so `***both***` is bold and italic. Inline
/// images contribute their alt text. Outside code, soft line breaks become
/// spaces and raw `<br>` tags become line breaks; hard breaks arrive as `br`
/// elements. A [transform] that keeps the character count keeps every
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
      final text = inCode ? node.text : _normalizeBreaks(node.text);
      if (text.isNotEmpty) runs.add(_Run(text, style));
    } else if (node is md.Element) {
      final tag = MarkdownInlineTag.from(node.tag);
      final merged = style.merge(_inlineStyle(spec, tag));
      switch (tag) {
        case MarkdownInlineTag.lineBreak:
          runs.add(_Run('\n', merged));
        case MarkdownInlineTag.image:
          final alt = node.attributes['alt'] ?? '';
          if (alt.isNotEmpty) runs.add(_Run(alt, merged));
        default:
          final nested = inCode || tag == MarkdownInlineTag.code;
          for (final child in node.children ?? const <md.Node>[]) {
            collect(child, merged, inCode: nested);
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

String _normalizeBreaks(String text) =>
    text.replaceAll('\n', ' ').replaceAll(_rawBreak, '\n');

TextStyle _inlineStyle(MarkdownSpec spec, MarkdownInlineTag? tag) =>
    switch (tag) {
      MarkdownInlineTag.strong ||
      MarkdownInlineTag.boldAlias => const TextStyle(
        fontWeight: FontWeight.bold,
      ).merge(spec.strong?.spec.style),
      MarkdownInlineTag.emphasis ||
      MarkdownInlineTag.italicAlias => const TextStyle(
        fontStyle: FontStyle.italic,
      ).merge(spec.emphasis?.spec.style),
      MarkdownInlineTag.strikethrough ||
      MarkdownInlineTag.strikethroughAlias => const TextStyle(
        decoration: TextDecoration.lineThrough,
      ).merge(spec.strikethrough?.spec.style),
      MarkdownInlineTag.code => const TextStyle(
        fontFamily: 'monospace',
      ).merge(spec.code?.spec.style),
      MarkdownInlineTag.link => spec.link?.spec.style ?? const TextStyle(),
      MarkdownInlineTag.lineBreak ||
      MarkdownInlineTag.image ||
      null => const TextStyle(),
    };

class _Run {
  final String text;
  final TextStyle style;

  const _Run(this.text, this.style);
}
