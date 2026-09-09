import 'package:flutter/widgets.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:mix/mix.dart';

import '../parsing/markdown_syntax.dart';
import '../specs/markdown_spec.dart';
import 'markdown_document.dart';

/// Wraps a rendered block, for example to add a [Hero] around a heading.
///
/// [element] is the parsed node of the block. Do not mutate or retain it.
typedef MarkdownBlockWrapper =
    Widget Function(BuildContext context, md.Element element, Widget child);

/// Replaces a document that contains unsupported nodes.
///
/// [tags] names the offending Markdown element tags.
typedef MarkdownUnsupportedBuilder =
    Widget Function(BuildContext context, Set<String> tags);

/// Renders a Markdown document with Mix styles.
///
/// Supports paragraphs, headings, nested inline formatting, and GitHub
/// alerts. Links are styled but not activated, and inline images contribute
/// their alt text. A document with any other block is rendered by
/// [unsupportedBuilder] instead, or as a diagnostic when that is null.
///
/// The document is parsed once and parsed again only when [data] or [syntax]
/// changes; style, theme, and text scale updates reuse the parsed nodes. The
/// widget does not scroll. Place it in a scroll view, and in a
/// [SelectionArea] when the text should be selectable.
class MixMarkdown extends StyleWidget<MarkdownSpec> {
  /// Markdown source.
  final String data;

  /// Parser configuration.
  final MarkdownSyntax syntax;

  /// Wraps each rendered block.
  final MarkdownBlockWrapper? wrapBlock;

  /// Renders the whole document when it contains unsupported nodes.
  final MarkdownUnsupportedBuilder? unsupportedBuilder;

  const MixMarkdown({
    required this.data,
    this.syntax = const MarkdownSyntax(),
    this.wrapBlock,
    this.unsupportedBuilder,
    MarkdownStyler style = const MarkdownStyler.create(),
    super.styleSpec,
    super.key,
  }) : super(style: style);

  @override
  Widget build(BuildContext context, MarkdownSpec spec) => MarkdownDocument(
    data: data,
    syntax: syntax,
    spec: spec,
    wrapBlock: wrapBlock,
    unsupportedBuilder: unsupportedBuilder,
  );
}
