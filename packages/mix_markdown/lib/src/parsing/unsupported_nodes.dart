import 'package:markdown/markdown.dart' as md;

import 'markdown_alert_element.dart';

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
