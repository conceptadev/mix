import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mix/mix.dart';
import 'package:mix_markdown/mix_markdown.dart';

void main() {
  test('factory and instance shorthand compose from the public barrel', () {
    final fromFactory = MarkdownStyler.paragraph(TextStyler.fontSize(16));
    final fromInstance = MarkdownStyler()
        .paragraph(.fontSize(16))
        .h1(.fontSize(32).fontWeight(FontWeight.bold))
        .alert(.note(.container(BoxStyler().paddingAll(12))));

    expect(fromFactory, isA<MarkdownStyler>());
    expect(fromInstance, isA<MarkdownStyler>());
  });

  testWidgets('the widget renders with a styler and with a resolved spec', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: Column(
            children: [
              MixMarkdown(data: '# Styled', style: .h1(.fontSize(30))),
              const MixMarkdown(
                data: 'Resolved',
                styleSpec: StyleSpec(
                  spec: MarkdownSpec(
                    paragraph: StyleSpec(
                      spec: TextSpec(style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    expect(tester.widget<Text>(find.text('Styled')).style?.fontSize, 30);
    expect(tester.widget<Text>(find.text('Resolved')).style?.fontSize, 12);
  });
}
