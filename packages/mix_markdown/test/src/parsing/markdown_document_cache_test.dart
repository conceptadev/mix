import 'package:flutter_test/flutter_test.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:mix_markdown/mix_markdown.dart';
import 'package:mix_markdown/src/parsing/markdown_document_cache.dart';

void main() {
  test('parses once per source and syntax', () {
    final cache = MarkdownDocumentCache();
    final first = cache.load('**Text**', const MarkdownSyntax());

    expect(cache.load('**Text**', const MarkdownSyntax()), same(first));
    expect(cache.parseCount, 1);

    cache.load('Changed', const MarkdownSyntax());
    expect(cache.parseCount, 2);

    cache.load('Changed', MarkdownSyntax(inlineSyntaxes: [_MarkerSyntax()]));
    expect(cache.parseCount, 3);
  });

  test('returned nodes are unmodifiable', () {
    final nodes = MarkdownDocumentCache().load('text', const MarkdownSyntax());

    expect(() => nodes.add(md.Text('more')), throwsUnsupportedError);
  });

  test('nested alerts share document-level references', () {
    const source =
        '> [!NOTE]\n'
        '> [outer][docs]\n>\n'
        '> > [!TIP]\n> > **[inner][docs]**\n\n'
        '[docs]: https://example.com/docs "Title"\n';
    final cache = MarkdownDocumentCache();
    final elements = _elements(
      cache.load(source, const MarkdownSyntax()),
    ).toList();
    final links = elements.where((e) => e.tag == 'a');

    expect(elements.where((e) => e.tag == 'div'), hasLength(2));
    expect(links, hasLength(2));
    expect(
      links.every((e) => e.attributes['href'] == 'https://example.com/docs'),
      isTrue,
    );
    expect(cache.parseCount, 1);
  });

  test('empty and Unicode input keep document boundaries', () {
    final cache = MarkdownDocumentCache();

    expect(cache.load('', const MarkdownSyntax()), isEmpty);
    expect(
      cache.load('日本語 العربية 😀', const MarkdownSyntax()).single.textContent,
      '日本語 العربية 😀',
    );
  });
}

Iterable<md.Element> _elements(Iterable<md.Node> nodes) sync* {
  for (final node in nodes) {
    if (node is md.Element) {
      yield node;
      yield* _elements(node.children ?? const []);
    }
  }
}

class _MarkerSyntax extends md.InlineSyntax {
  _MarkerSyntax() : super('@@');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    parser.addNode(md.Element.text('strong', 'marker'));

    return true;
  }
}
