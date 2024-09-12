import 'package:demo/helpers/knob_builder.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class _CustomCardStyle extends FortalezaCardStyle {
  const _CustomCardStyle();

  @override
  Style makeStyle(SpecConfiguration<CardSpecUtility> spec) {
    final $ = spec.utilities;

    return Style(
      $.container.chain
        ..borderRadius(4)
        ..color.white()
        ..border.all.color.black12()
        ..padding.all(8),
      $.flex.chain
        ..mainAxisSize.min()
        ..column(),
    );
  }

  @widgetbook.UseCase(
    name: 'Card Component',
    type: Card,
  )
  Widget buildCard(BuildContext context) {
    return Center(
      child: Card(
        style: const _CustomCardStyle(),
        variants: [
          context.knobs.variant(FortalezaCardStyle.variants),
        ],
        children: [
          Avatar(
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
}
