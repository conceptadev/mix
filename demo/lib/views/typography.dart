import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class TypographyPreview extends StatelessWidget {
  const TypographyPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final redBg = Mix(bgColor(Colors.red), p(10));
    final onHoverGreen = Mix(
      animated(
        duration: const Duration(milliseconds: 200),
      ),
      hovering(
        bgColor(
          Colors.green,
        ),
      ),
      pressing(
        bgColor(Colors.orange),
        p(20),
      ),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Pressable(
            Mix.combine(redBg, onHoverGreen),
            onPressed: () {},
            child: TextMix(
              Mix(textColor(Colors.black)),
              text: 'Simple Text',
            ),
          )
        ],
      ),
    );
  }
}
