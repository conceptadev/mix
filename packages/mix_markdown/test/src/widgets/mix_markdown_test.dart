import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show RenderParagraph;
import 'package:flutter_test/flutter_test.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:mix/mix.dart';
import 'package:mix_markdown/mix_markdown.dart';
import 'package:mix_markdown/src/widgets/markdown_alert.dart';
import 'package:mix_markdown/src/widgets/markdown_blocks.dart';
import 'package:mix_markdown/src/widgets/markdown_document.dart';

void main() {
  Widget app(
    Widget child, {
    double scale = 1,
    TextDirection direction = TextDirection.ltr,
    Brightness brightness = Brightness.light,
  }) => MaterialApp(
    theme: ThemeData(brightness: brightness),
    home: MediaQuery(
      data: MediaQueryData(
        textScaler: TextScaler.linear(scale),
        platformBrightness: brightness,
      ),
      child: Directionality(
        textDirection: direction,
        child: Material(
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 320,
              child: SingleChildScrollView(child: child),
            ),
          ),
        ),
      ),
    ),
  );

  int parseCount(WidgetTester tester) => tester
      .state<MarkdownDocumentState>(find.byType(MarkdownDocument))
      .parseCount;

  group('parsing lifecycle', () {
    testWidgets('style-only updates never parse again', (tester) async {
      for (var frame = 0; frame < 20; frame++) {
        await tester.pumpWidget(
          app(
            MixMarkdown(
              data: '# Title\n\n**Body**',
              style: MarkdownStyler(
                paragraph: TextStyler().fontSize(16 + frame.toDouble()),
              ),
            ),
          ),
        );
      }

      expect(parseCount(tester), 1);
      expect(tester.takeException(), isNull);
    });

    testWidgets('new data or syntax parses again', (tester) async {
      await tester.pumpWidget(app(const MixMarkdown(data: 'a')));
      await tester.pumpWidget(app(const MixMarkdown(data: '@@')));
      expect(parseCount(tester), 2);
      expect(find.text('marker', findRichText: true), findsNothing);

      await tester.pumpWidget(
        app(
          MixMarkdown(
            data: '@@',
            syntax: MarkdownSyntax(inlineSyntaxes: [_MarkerSyntax()]),
          ),
        ),
      );
      expect(parseCount(tester), 3);
      expect(find.text('marker', findRichText: true), findsOneWidget);
    });

    testWidgets('brightness and text scale update without a parse', (
      tester,
    ) async {
      final style = MarkdownStyler(
        paragraph: TextStyler()
            .color(Colors.black)
            .onDark(TextStyler().color(Colors.white)),
      );
      Text body() => tester.widget<Text>(find.text('body'));

      await tester.pumpWidget(app(MixMarkdown(data: 'body', style: style)));
      expect(body().style?.color, Colors.black);

      await tester.pumpWidget(
        app(
          MixMarkdown(data: 'body', style: style),
          brightness: Brightness.dark,
          scale: 1.5,
        ),
      );
      await tester.pumpAndSettle();
      expect(body().style?.color, Colors.white);
      expect(parseCount(tester), 1);

      final rich = tester.widget<RichText>(
        find.descendant(of: find.text('body'), matching: find.byType(RichText)),
      );
      expect(rich.textScaler.scale(20), 30);
    });
  });

  group('blocks', () {
    testWidgets('headings and paragraphs render with heading semantics', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          const MixMarkdown(
            data:
                '# One\n\n## Two\n\n### Three\n\n#### Four\n\n##### Five\n\n###### Six\n\nBody',
          ),
        ),
      );

      for (final label in [
        'One',
        'Two',
        'Three',
        'Four',
        'Five',
        'Six',
        'Body',
      ]) {
        expect(find.text(label, findRichText: true), findsOneWidget);
      }
      final headers = tester
          .widgetList<Semantics>(find.byType(Semantics))
          .where((s) => s.properties.header == true);
      expect(headers, hasLength(6));
    });

    testWidgets('heading slots fall back to the paragraph slot', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          MixMarkdown(
            data: '# Title\n\n## Sub',
            style: MarkdownStyler(
              paragraph: TextStyler().fontSize(10),
              h1: TextStyler().fontSize(30),
            ),
          ),
        ),
      );

      expect(tester.widget<Text>(find.text('Title')).style?.fontSize, 30);
      expect(tester.widget<Text>(find.text('Sub')).style?.fontSize, 10);
    });

    testWidgets('block spacing applies between blocks and inside alerts', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          MixMarkdown(
            data: 'first\n\n> [!NOTE]\n> second\n>\n> third',
            style: MarkdownStyler(blockSpacing: 12),
          ),
        ),
      );

      final columns = tester.widgetList<Column>(
        find.descendant(
          of: find.byType(MarkdownBlocks),
          matching: find.byType(Column),
        ),
      );
      expect(columns, hasLength(2));
      expect(columns.every((column) => column.spacing == 12), isTrue);
    });

    testWidgets('empty body renders nothing and does not throw', (
      tester,
    ) async {
      await tester.pumpWidget(app(const MixMarkdown(data: '')));

      expect(find.byType(Text), findsNothing);
      expect(tester.takeException(), isNull);
    });

    testWidgets('wraps under a narrow constraint and inherits direction', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          const MixMarkdown(
            data: 'العربية 日本語 long long long long long long long long',
          ),
          direction: TextDirection.rtl,
          scale: 1.5,
        ),
      );

      final paragraph = tester.renderObject<RenderParagraph>(
        find.byType(RichText).last,
      );
      expect(paragraph.textDirection, TextDirection.rtl);
      expect(
        tester.getSize(find.byType(MixMarkdown)).width,
        lessThanOrEqualTo(320),
      );
      expect(tester.takeException(), isNull);
    });

    testWidgets('text directives keep equal-length inline styles', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          MixMarkdown(
            data: 'hello **world**',
            style: MarkdownStyler(paragraph: TextStyler().uppercase()),
          ),
        ),
      );

      expect(find.text('HELLO WORLD', findRichText: true), findsOneWidget);
    });

    testWidgets('a host SelectionArea registers the text', (tester) async {
      await tester.pumpWidget(
        app(
          const SelectionArea(child: MixMarkdown(data: '**Selectable** body')),
        ),
      );

      final richTexts = tester.widgetList<RichText>(find.byType(RichText));
      expect(richTexts.any((t) => t.selectionRegistrar != null), isTrue);

      await tester.pumpWidget(app(const SizedBox.shrink()));
      expect(tester.takeException(), isNull);
    });
  });

  group('alerts', () {
    const alerts =
        '> [!NOTE]\n> **Outer**\n>\n> > [!TIP]\n> > Inner\n\n'
        '> [!IMPORTANT]\n> Important body\n\n'
        '> [!WARNING]\n> Warning body\n\n'
        '> [!CAUTION]\n> Caution body';

    testWidgets('every type renders its header and parsed children', (
      tester,
    ) async {
      await tester.pumpWidget(app(const MixMarkdown(data: alerts)));

      expect(find.byType(MarkdownAlert), findsNWidgets(5));
      for (final label in ['Note', 'Tip', 'Important', 'Warning', 'Caution']) {
        expect(find.text(label), findsOneWidget);
      }
      expect(find.text('Outer', findRichText: true), findsOneWidget);
      expect(find.text('Inner', findRichText: true), findsOneWidget);
      expect(parseCount(tester), 1);
      expect(tester.takeException(), isNull);
    });

    testWidgets('type slots style the label, icon, and container', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          MixMarkdown(
            data: '> [!TIP]\n> body',
            style: MarkdownStyler(
              alert: MarkdownAlertStyler(
                tip: MarkdownAlertTypeStyler(
                  label: 'Hint',
                  icon: IconStyler().icon(Icons.star).color(Colors.amber),
                  container: BoxStyler().paddingAll(12),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Hint'), findsOneWidget);
      expect(find.text('Tip'), findsNothing);
      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.icon, Icons.star);
      expect(icon.color, Colors.amber);
      expect(
        tester
            .widget<Padding>(
              find
                  .descendant(
                    of: find.byType(MarkdownAlert),
                    matching: find.byType(Padding),
                  )
                  .first,
            )
            .padding,
        const EdgeInsets.all(12),
      );
    });

    testWidgets('unsupported blocks inside an alert fall back as a whole', (
      tester,
    ) async {
      Set<String>? seen;
      await tester.pumpWidget(
        app(
          MixMarkdown(
            data: '> [!NOTE]\n> - unsupported list\n',
            unsupportedBuilder: (context, tags) {
              seen = tags;

              return const Text('fallback');
            },
          ),
        ),
      );

      expect(seen, {'ul'});
      expect(find.text('fallback'), findsOneWidget);
      expect(find.byType(MarkdownAlert), findsNothing);
    });
  });

  group('unsupported documents', () {
    testWidgets('show a diagnostic without a builder', (tester) async {
      await tester.pumpWidget(
        app(const MixMarkdown(data: '| h |\n|---|\n| b |')),
      );

      expect(find.text('Unsupported Markdown: table'), findsOneWidget);
    });

    testWidgets('report standalone images instead of flattening them', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(const MixMarkdown(data: '![alt][img]\n\n[img]: image.png')),
      );

      expect(find.textContaining('standalone-image'), findsOneWidget);
    });
  });

  group('hooks', () {
    testWidgets('wrapBlock receives the same element across rebuilds', (
      tester,
    ) async {
      md.Element? original;
      var calls = 0;
      Widget body() => app(
        MixMarkdown(
          data: '# Wrapped',
          wrapBlock: (context, element, child) {
            if (original != null) expect(element, same(original));
            original = element;
            calls++;

            return Padding(padding: const EdgeInsets.all(3), child: child);
          },
        ),
      );

      await tester.pumpWidget(body());
      await tester.pumpWidget(body());

      expect(calls, greaterThanOrEqualTo(2));
      expect(parseCount(tester), 1);
    });

    testWidgets('the generated call builds the widget from a styler', (
      tester,
    ) async {
      await tester.pumpWidget(
        app(
          MarkdownStyler(paragraph: TextStyler().fontSize(21))(data: 'called'),
        ),
      );

      expect(tester.widget<Text>(find.text('called')).style?.fontSize, 21);
    });
  });

  group('style contract', () {
    test('generated spec supports copy, equality, and lerp', () {
      const start = MarkdownSpec(blockSpacing: 8);
      const end = MarkdownSpec(blockSpacing: 24);

      expect(start.copyWith(blockSpacing: 24), end);
      expect(start.lerp(end, 0.5).blockSpacing, 16);
      expect(start.hashCode, const MarkdownSpec(blockSpacing: 8).hashCode);
    });

    testWidgets('styler merge keeps earlier nested fields', (tester) async {
      final style =
          MarkdownStyler(
            paragraph: TextStyler().fontSize(24).color(Colors.red),
            container: BoxStyler().paddingAll(12),
            blockSpacing: 8,
          ).merge(
            MarkdownStyler(
              paragraph: TextStyler().fontWeight(FontWeight.bold),
              blockSpacing: 16,
            ),
          );
      late MarkdownSpec resolved;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              resolved = style.resolve(context).spec;

              return const SizedBox.shrink();
            },
          ),
        ),
      );

      expect(resolved.paragraph?.spec.style?.fontSize, 24);
      expect(resolved.paragraph?.spec.style?.color, Colors.red);
      expect(resolved.paragraph?.spec.style?.fontWeight, FontWeight.bold);
      expect(resolved.container?.spec.padding, const EdgeInsets.all(12));
      expect(resolved.blockSpacing, 16);
    });

    testWidgets('animated block spacing interpolates without a parse', (
      tester,
    ) async {
      Future<void> pump(double spacing) => tester.pumpWidget(
        app(
          MixMarkdown(
            data: 'first\n\nsecond',
            style: MarkdownStyler(blockSpacing: spacing).animate(
              AnimationConfig.linear(const Duration(milliseconds: 250)),
            ),
          ),
        ),
      );
      Column column() => tester.widget<Column>(
        find.descendant(
          of: find.byType(MarkdownBlocks),
          matching: find.byType(Column),
        ),
      );

      await pump(8);
      await tester.pumpAndSettle();
      await pump(32);
      await tester.pump(const Duration(milliseconds: 125));
      expect(column().spacing, greaterThan(8));
      expect(column().spacing, lessThan(32));

      await tester.pumpAndSettle();
      expect(column().spacing, 32);
      expect(parseCount(tester), 1);
      expect(tester.takeException(), isNull);
    });
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
