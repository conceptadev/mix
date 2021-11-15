import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class TypographyPreview extends StatelessWidget {
  const TypographyPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = Mix(
      rounded(35),
      padding(20),
      font(
        weight: FontWeight.bold,
        color: Colors.black,
      ),
      border(
        color: Colors.black,
        width: 3,
      ),
      animated(),
      dark(
        border(color: Colors.white),
        textColor(Colors.white),
      ),
      elevation(8),
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
        border(color: Colors.greenAccent),
        elevation(2),
        scale(0.9),
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
