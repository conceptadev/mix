import 'package:flutter_test/flutter_test.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:mix_markdown/mix_markdown.dart';
import 'package:mix_markdown/src/parsing/markdown_alert_element.dart';

void main() {
  test('configurations are equal when they hold the same instances', () {
    final marker = _MarkerSyntax();
    final a = MarkdownSyntax(inlineSyntaxes: [marker]);
    final b = MarkdownSyntax(inlineSyntaxes: [marker]);

    expect(a, b);
    expect(a.hashCode, b.hashCode);
    expect(a, isNot(MarkdownSyntax(inlineSyntaxes: [_MarkerSyntax()])));
    expect(
      const MarkdownSyntax(),
      isNot(MarkdownSyntax(extensionSet: md.ExtensionSet.commonMark)),
    );
  });

  test('parses GitHub alerts by default and decodes entities', () {
    final nodes = const MarkdownSyntax().createDocument().parse(
      '> [!NOTE]\n> &amp; \\*x\\*',
    );
    final alert = nodes.single as md.Element;

    expect(alert.alertType, MarkdownAlertType.note);
    expect(alert.alertContent.single.textContent, '& *x*');
  });

  test('custom syntaxes take part in parsing', () {
    final nodes = MarkdownSyntax(
      inlineSyntaxes: [_MarkerSyntax()],
    ).createDocument().parse('a @@ b');
    final paragraph = nodes.single as md.Element;

    expect(paragraph.children!.whereType<md.Element>().single.tag, 'strong');
  });

  test('alert type is null for other elements', () {
    final nodes = const MarkdownSyntax().createDocument().parse(
      '<div class="markdown-alert">x</div>\n\n# Title',
    );

    expect(nodes.whereType<md.Element>().single.alertType, isNull);
  });
}

class _MarkerSyntax extends md.InlineSyntax {
  _MarkerSyntax() : super('@@');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    parser.addNode(md.Element.text('strong', 'marker'));

    return true;
  }
}
