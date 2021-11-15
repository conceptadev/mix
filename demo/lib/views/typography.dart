import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class TypographyPreview extends StatelessWidget {
  const TypographyPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = Mix(
      rounded(5),
      padding(20),
      border(color: Colors.black),
      animated(duration: 150),
      elevation(8),
      scale(1),
      hover(
        textColor(Colors.green),
        border(color: Colors.green),
        bgColor(
          Colors.green.withOpacity(0.1),
        ),
      ),
      press(
        bgColor(Colors.green.shade600),
        textColor(Colors.white),
        elevation(2),
        scale(0.8),
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          Pressable(
            mix,
            onPressed: () {},
            child: TextMix(
              Mix(),
              text: 'Simple Text',
            ),
          )
        ],
      ),
    );
  }
}
