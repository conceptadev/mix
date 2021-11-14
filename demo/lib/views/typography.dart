import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class TypographyPreview extends StatelessWidget {
  const TypographyPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boxMix = Mix(
      bgColor(Colors.blue),
      rounded(5),
      p(20),
      border(color: Colors.red),
      animated(duration: 150),
      elevation(10),
      hover(
        bgColor(
          Colors.blue.shade400,
        ),
      ),
      pressing(
        bgColor(Colors.blue.shade600),
        elevation(4),
        p(15),
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
