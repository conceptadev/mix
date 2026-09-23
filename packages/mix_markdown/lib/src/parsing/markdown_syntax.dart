import 'package:flutter/foundation.dart';
import 'package:markdown/markdown.dart' as md;

/// Parser configuration for a Markdown document.
///
/// Two configurations are equal when they hold the same syntax instances and
/// the same extension set, so a mounted renderer parses again only when the
/// configuration actually changes. Create a new instance when a stateful
/// syntax changes behavior, and treat the lists as immutable once passed in.
@immutable
class MarkdownSyntax {
  /// Block syntaxes tried before those of [extensionSet].
  final List<md.BlockSyntax> blockSyntaxes;

  /// Inline syntaxes tried before those of [extensionSet].
  final List<md.InlineSyntax> inlineSyntaxes;

  /// Extension set, [md.ExtensionSet.gitHubWeb] when null.
  final md.ExtensionSet? extensionSet;

  const MarkdownSyntax({
    this.blockSyntaxes = const [],
    this.inlineSyntaxes = const [],
    this.extensionSet,
  });

  /// Creates a parser for one document.
  ///
  /// HTML entities are decoded rather than encoded because the output is
  /// rendered as text, not markup.
  md.Document createDocument() => md.Document(
    blockSyntaxes: blockSyntaxes,
    inlineSyntaxes: inlineSyntaxes,
    extensionSet: extensionSet ?? md.ExtensionSet.gitHubWeb,
    encodeHtml: false,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarkdownSyntax &&
          listEquals(blockSyntaxes, other.blockSyntaxes) &&
          listEquals(inlineSyntaxes, other.inlineSyntaxes) &&
          identical(extensionSet, other.extensionSet);

  @override
  int get hashCode => Object.hash(
    Object.hashAll(blockSyntaxes),
    Object.hashAll(inlineSyntaxes),
    extensionSet,
  );
}
