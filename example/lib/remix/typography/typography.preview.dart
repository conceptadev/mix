import 'package:example/remix/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class TypographyPreview extends StatelessWidget {
  const TypographyPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heading1 = context.globalMix<MixStyles>().heading1;

    return ListView(
      children: [
        // // Heading1('Heading 1'),
        // Body('Body'),
        TextMix(
          heading1,
          text: 'Test BodyMix',
        ),
        // Heading3('Heading 3'),
        // Heading4('Heading 4'),
        // Heading5('Heading 5'),
        // Paragraph('Paragraph'),
        // Caption('Caption'),
        // SmallText('Small'),
      ],
    );
  }
}
