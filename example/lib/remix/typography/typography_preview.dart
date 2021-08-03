import 'package:example/remix/components/atoms/typography.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class TypographyPreview extends StatelessWidget {
  const TypographyPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ColumnBox(
        Mix(gap(10), crossAxis.start, p(20), crossAxis.stretch),
        children: [
          H1('Heading 1'),
          H2('Heading 2'),
          H3('Heading 3'),
          H4('Heading 4'),
          H5('Heading 5'),
          H6('Heading 6'),
          Body1('Body 1'),
          Body2('Body 2'),
          Caption('Caption'),
          Overline('Overline'),
        ],
      ),
    );
  }
}
