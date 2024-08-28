import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Card Component',
  type: XCard,
)
Widget buildCard(BuildContext context) {
  return Center(
    child: XCard(
      style: Style(
        $card.flex.row(),
        $card.flex.mainAxisAlignment.start(),
        $card.flex.crossAxisAlignment.center(),
        $card.flex.gap(12),
      ),
      variants: [
        context.knobs.variant(CardThemeVariant.values),
      ],
      children: [
        XAvatar(
          fallbackBuilder: (spec) => spec('LF'),
          variants: const [AvatarThemeVariant.soft],
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
  );
}
