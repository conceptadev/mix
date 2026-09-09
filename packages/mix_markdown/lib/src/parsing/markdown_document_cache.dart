import 'package:markdown/markdown.dart' as md;

import 'markdown_syntax.dart';

/// Holds the parsed nodes of one Markdown source.
///
/// [load] returns the cached nodes while both the source and the syntax are
/// unchanged, so style and theme updates never trigger a parse.
class MarkdownDocumentCache {
  String? _data;
  MarkdownSyntax? _syntax;
  List<md.Node> _nodes = const [];
  int _parseCount = 0;

  /// The number of parses performed so far.
  int get parseCount => _parseCount;

  /// Returns the nodes of [data], parsing only when [data] or [syntax]
  /// differ from the previous call.
  List<md.Node> load(String data, MarkdownSyntax syntax) {
    if (data == _data && syntax == _syntax) return _nodes;
    _nodes = List.unmodifiable(syntax.createDocument().parse(data));
    _data = data;
    _syntax = syntax;
    _parseCount++;

    return _nodes;
  }
}
