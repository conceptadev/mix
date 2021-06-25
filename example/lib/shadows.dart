import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/utils.dart';

final darkColor = hexToColor('#1c1c1c');

final cardMix = Mix(
  bgColor(Colors.white),
  p(20),
  rounded(5),
  m(30),
  h(150),
  w(150),
  align.bottomLeft,
);
final darkCardMix = cardMix.mix(bgColor(darkColor));

final shadowOffset = boxShadow.offset;
final shadowSpread = boxShadow.spreadRadius;
final shadowBlur = boxShadow.blurRadius;

final textMix = Mix(textColor(Colors.black), fontSize(12));
final darkTextMix = textMix.mix(textColor(Colors.grey));

final darkShadowColor = boxShadow.color(Colors.black54);

final shadowColor = Mix(
  boxShadow.color(Color.fromRGBO(30, 144, 255, 0.1)),
);

final shadow20 = shadowColor.mix(
  shadowBlur(3),
  shadowOffset(0, 1),
);

final shadow40 = shadowColor.mix(
  shadowBlur(4),
  shadowOffset(0, 2),
);

final shadow60 = shadowColor.mix(
  shadowBlur(8),
  shadowOffset(0, 4),
);

final shadow80 = shadowColor.mix(
  shadowBlur(16),
  shadowOffset(0, 8),
);

final shadow100 = shadowColor.mix(
  shadowBlur(24),
  shadowOffset(0, 16),
);

class ShadowsPreview extends StatelessWidget {
  const ShadowsPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            RowBox(
              Mix(backgroundColor(Colors.white), p(40)),
              children: [
                Box(
                  Mix.combine(cardMix, shadow20),
                  child: textMix.text('shadow20'),
                ),
                Box(
                  Mix.combine(cardMix, shadow40),
                  child: textMix.text('shadow40'),
                ),
                Box(
                  Mix.combine(cardMix, shadow60),
                  child: textMix.text('shadow60'),
                ),
                Box(
                  Mix.combine(cardMix, shadow80),
                  child: textMix.text('shadow80'),
                ),
                Box(
                  Mix.combine(cardMix, shadow100),
                  child: textMix.text('shadow100'),
                ),
              ],
            ),
            RowBox(
              Mix(backgroundColor(darkColor), p(40)),
              children: [
                Box(
                  Mix.combine(darkCardMix, shadow20).mix(darkShadowColor),
                  child: darkTextMix.text('shadow20'),
                ),
                Box(
                  Mix.combine(darkCardMix, shadow40).mix(darkShadowColor),
                  child: darkTextMix.text('shadow40'),
                ),
                Box(
                  Mix.combine(darkCardMix, shadow60).mix(darkShadowColor),
                  child: darkTextMix.text('shadow60'),
                ),
                Box(
                  Mix.combine(darkCardMix, shadow80).mix(darkShadowColor),
                  child: darkTextMix.text('shadow80'),
                ),
                Box(
                  Mix.combine(darkCardMix, shadow100).mix(darkShadowColor),
                  child: darkTextMix.text('shadow100'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
