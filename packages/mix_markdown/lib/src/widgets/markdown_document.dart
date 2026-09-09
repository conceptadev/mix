import 'package:flutter/widgets.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:mix/mix.dart';

import '../parsing/markdown_alert_element.dart';
import '../parsing/markdown_document_cache.dart';
import '../parsing/markdown_syntax.dart';
import '../specs/markdown_spec.dart';
import 'markdown_alert.dart';
import 'markdown_text.dart';
import 'mix_markdown.dart';

const _blockTags = {'p', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6'};
const _inlineTags = {
  'strong',
  'b',
  'em',
  'i',
  'del',
  's',
  'a',
  'code',
  'br',
  'img',
};

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

/// A start-aligned column of rendered blocks.
class MarkdownBlocks extends StatelessWidget {
  /// Vertical space between blocks.
  final double? spacing;

  /// Rendered blocks.
  final List<Widget> children;

  const MarkdownBlocks({super.key, this.spacing, required this.children});

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: spacing ?? 0,
    children: children,
  );
}

/// The tags in [nodes] that the renderer cannot draw; empty when it can
/// draw the whole document.
///
/// Block-level text, which the parser emits for raw HTML, reports `text`.
/// A paragraph holding only an image reports `standalone-image`, because
/// rendering it as alt text would silently drop the image.
Set<String> unsupportedNodes(List<md.Node> nodes) {
  final unsupported = <String>{};

  void visitInline(md.Node node) {
    if (node is! md.Element) return;
    if (!_inlineTags.contains(node.tag)) {
      unsupported.add(node.tag);

      return;
    }
    node.children?.forEach(visitInline);
  }

  void visitBlock(md.Node node) {
    if (node is md.Text) {
      if (node.text.trim().isNotEmpty) unsupported.add('text');

      return;
    }
    if (node is! md.Element) return;
    if (node.alertType != null) {
      node.alertContent.forEach(visitBlock);

      return;
    }
    if (!_blockTags.contains(node.tag)) {
      unsupported.add(node.tag);

      return;
    }
    if (_isStandaloneImage(node)) unsupported.add('standalone-image');
    node.children?.forEach(visitInline);
  }

  nodes.forEach(visitBlock);

  return Set.unmodifiable(unsupported);
}

bool _isStandaloneImage(md.Element paragraph) {
  final content = [
    for (final child in paragraph.children ?? const <md.Node>[])
      if (child is! md.Text || child.text.trim().isNotEmpty) child,
  ];

  return content.length == 1 &&
      content.single is md.Element &&
      (content.single as md.Element).tag == 'img';
}
