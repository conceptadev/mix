import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get card {
  return Mix(
      margin(20),
      elevation(6),
      rounded(10),
      bgColor($surface),
      padding(20),
      gap(10),
      crossAxis(CrossAxisAlignment.start),
      'heading1'.variant(
        upperCase(),
        font(
          color: $onSurface,
        ),
      ));
}

class CardsPreview extends StatelessWidget {
  const CardsPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: card.vbox(
        children: const [
          TextMix(
            'This is a title',
            variant: 'heading1',
          ),
          // TextMix(
          //   'This is great content that I add here when I need something awesome',
          // ),
        ],
      ),
    );
  }
}
