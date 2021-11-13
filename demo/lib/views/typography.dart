import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class TypographyPreview extends StatelessWidget {
  const TypographyPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boxMix = Mix(
      bgColor(Colors.red),
      p(10),
      animated(),
      hovering(
        bgColor(
          Colors.green,
        ),
      ),
      pressing(
        bgColor(Colors.orange),
        rounded(20),
        p(20),
      ),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Pressable(
            boxMix,
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
