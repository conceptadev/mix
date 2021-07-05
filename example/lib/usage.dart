import 'package:example/components/styled_syntax_view.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class UsageExample extends StatelessWidget {
  const UsageExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simple white square.
    final squareMix = Mix(bgColor(Colors.white), h(150), w(150));

    // Lets polish it a bit.
    final cardMix = squareMix.mix(p(20), bottomLeft, rounded(20));

    final shadowMix = Mix(
      shadowColor(Colors.black12),
      shadowBlur(4),
      shadowOffset(0, 2),
    );

    final rowMix = Mix(gap(20), crossAxis.center);

    return ListView(
      children: [
        ColumnBox(
          Mix(gap(20), m(20), crossAxis.start),
          children: [
            rowMix.row(
              children: [
                Box(
                  squareMix,
                  child: Text('White Square'),
                ),
                StyledSyntaxView(
                  '''
final squareMix = Mix(h(150), w(150), bgColor(Colors.white));

Box(
  squareMix,
  child: Text('Square'),
);
                ''',
                )
              ],
            ),
            rowMix.row(
              children: [
                Box(
                  cardMix,
                  child: Text('Card'),
                ),
                StyledSyntaxView(
                  '''
final cardMix = squareMix.mix(p(20), bottomLeft, rounded(20));

Box(
  cardMix,
  child: Text('Card'),
);
                ''',
                )
              ],
            ),
            rowMix.row(
              children: [
                Box(
                  Mix.combine(cardMix, shadowMix),
                  child: Text('Card With Shadow'),
                ),
                StyledSyntaxView(
                  '''
final shadowMix = Mix(
  shadowColor(Colors.black12),
  shadowBlur(4),
  shadowOffset(0, 2),
);

Box(
  Mix.combine(cardMix, shadowMix),
  child: Text('Card With Shadow'),
);
                ''',
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
