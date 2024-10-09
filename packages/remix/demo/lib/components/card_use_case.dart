import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Card Component',
  type: Card,
)
Widget buildCard(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Card(
        variants: [
          context.knobs.variant(FortalezaCardStyle.variants),
        ],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Avatar(
              fallbackBuilder: (spec) => spec('LF'),
              variants: FortalezaCardStyle.variants,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledText(
                  'Leo Farias',
                  style: Style($text.style.ref($rx.text.text3)),
                ),
                StyledText(
                  'Flutter Engineer',
                  style: Style(
                    $text.style.ref($rx.text.text2),
                    $text.style.color.$neutral(10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
