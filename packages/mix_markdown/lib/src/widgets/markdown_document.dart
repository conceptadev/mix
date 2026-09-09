import 'package:flutter/widgets.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:mix/mix.dart';

import '../parsing/markdown_alert_element.dart';
import '../parsing/markdown_document_cache.dart';
import '../parsing/markdown_syntax.dart';
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
class MarkdownDocumentState extends State<MarkdownDocument> {
  final _cache = MarkdownDocumentCache();
  List<md.Node> _nodes = const [];
  Set<String> _unsupported = const {};

  /// The number of parses since this state was created.
  @visibleForTesting
  int get parseCount => _cache.parseCount;

  void _load() {
    final nodes = _cache.load(widget.data, widget.syntax);
    if (identical(nodes, _nodes)) return;
    _nodes = nodes;
    _unsupported = unsupportedNodes(nodes);
  }

  StyleSpec<TextSpec> _textSpecFor(String tag) {
    final spec = widget.spec;
    final heading = switch (tag) {
      'h1' => spec.h1,
      'h2' => spec.h2,
      'h3' => spec.h3,
      'h4' => spec.h4,
      'h5' => spec.h5,
      'h6' => spec.h6,
      _ => null,
    };

    return heading ?? spec.paragraph ?? const StyleSpec(spec: TextSpec());
  }

  Widget _block(BuildContext context, md.Element element) {
    final alertType = element.alertType;
    final child = alertType == null
        ? MarkdownText(
            element: element,
            styleSpec: _textSpecFor(element.tag),
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
