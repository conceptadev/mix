import 'package:flutter/widgets.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:mix/mix.dart';

import '../parsing/markdown_alert_element.dart';
import '../parsing/markdown_syntax.dart';
import '../parsing/markdown_tags.dart';
import '../parsing/unsupported_nodes.dart';
import '../specs/markdown_spec.dart';
import 'markdown_alert.dart';
import 'markdown_blocks.dart';
import 'markdown_text.dart';
import 'mix_markdown.dart';

/// The parsed body of a [MixMarkdown], kept alive across style changes.
class MarkdownDocument extends StatefulWidget {
  /// Markdown source.
  final String data;

  /// Parser configuration.
  final MarkdownSyntax syntax;

  /// Resolved document style.
  final MarkdownSpec spec;

  /// Wraps each rendered block.
  final MarkdownBlockWrapper? wrapBlock;

  /// Renders the whole document when it contains unsupported nodes.
  final MarkdownUnsupportedBuilder? unsupportedBuilder;

  const MarkdownDocument({
    super.key,
    required this.data,
    required this.syntax,
    required this.spec,
    this.wrapBlock,
    this.unsupportedBuilder,
  });

  @override
  State<MarkdownDocument> createState() => MarkdownDocumentState();
}

/// State of a [MarkdownDocument]; public so tests can read [parseCount].
///
/// The parsed nodes are kept across style changes and parsed again only when
/// the source or the syntax differs from the previous build.
class MarkdownDocumentState extends State<MarkdownDocument> {
  String? _data;
  MarkdownSyntax? _syntax;
  List<md.Node> _nodes = const [];
  Set<String> _unsupported = const {};
  int _parseCount = 0;

  /// The number of parses since this state was created.
  @visibleForTesting
  int get parseCount => _parseCount;

  void _load() {
    if (widget.data == _data && widget.syntax == _syntax) return;
    _data = widget.data;
    _syntax = widget.syntax;
    _nodes = widget.syntax.createDocument().parse(widget.data);
    _unsupported = unsupportedNodes(_nodes);
    _parseCount++;
  }

  StyleSpec<TextSpec> _textSpecFor(MarkdownBlockTag block) {
    final spec = widget.spec;
    final heading = switch (block) {
      MarkdownBlockTag.paragraph => null,
      MarkdownBlockTag.h1 => spec.h1,
      MarkdownBlockTag.h2 => spec.h2,
      MarkdownBlockTag.h3 => spec.h3,
      MarkdownBlockTag.h4 => spec.h4,
      MarkdownBlockTag.h5 => spec.h5,
      MarkdownBlockTag.h6 => spec.h6,
    };

    return heading ?? spec.paragraph ?? const StyleSpec(spec: TextSpec());
  }

  Widget _block(BuildContext context, md.Element element) {
    final alertType = element.alertType;
    // Rendering only runs for an eligible document, so the tag is known; an
    // unknown one falls back to paragraph styling rather than throwing.
    final block =
        MarkdownBlockTag.from(element.tag) ?? MarkdownBlockTag.paragraph;
    final child = alertType == null
        ? MarkdownText(
            element: element,
            block: block,
            styleSpec: _textSpecFor(block),
            spec: widget.spec,
          )
        : MarkdownAlert(
            type: alertType,
            styleSpec: widget.spec.alert,
            blockSpacing: widget.spec.blockSpacing,
            children: _blocks(context, element.alertContent),
          );

    return widget.wrapBlock?.call(context, element, child) ?? child;
  }

  List<Widget> _blocks(BuildContext context, List<md.Node> nodes) => [
    for (final node in nodes.whereType<md.Element>()) _block(context, node),
  ];

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(MarkdownDocument oldWidget) {
    super.didUpdateWidget(oldWidget);
    _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_unsupported.isNotEmpty) {
      return widget.unsupportedBuilder?.call(context, _unsupported) ??
          Text(
            'Unsupported Markdown: ${(_unsupported.toList()..sort()).join(', ')}',
          );
    }

    return Box(
      styleSpec: widget.spec.container,
      child: MarkdownBlocks(
        spacing: widget.spec.blockSpacing,
        children: _blocks(context, _nodes),
      ),
    );
  }
}
