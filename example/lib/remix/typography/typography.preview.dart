import 'package:example/remix/typography/typography.dart';
import 'package:flutter/material.dart';

class TypographyPreview extends StatelessWidget {
  const TypographyPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Heading1('Heading 1'),
        Heading2('Heading 2'),
        Heading3('Heading 3'),
        Heading4('Heading 4'),
        Heading5('Heading 5'),
        Paragraph('Paragraph'),
        Caption('Caption'),
        SmallText('Small'),
      ],
    );
  }
}
