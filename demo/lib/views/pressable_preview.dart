import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class PressablePreview extends StatelessWidget {
  const PressablePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = Mix(
      rounded(35),
      animated(),
      scale(1),
      padding(20),
      elevation(8),
      bgColor(cs().background),
      font(
        weight: FontWeight.bold,
        color: cs().onBackground,
      ),
      border(
        color: Colors.black,
        width: 3,
      ),
      dark(
        border(color: Colors.white),
        textColor(Colors.white),
      ),
      hover(
        bgColor(Colors.green.shade600),
        textColor(Colors.white),
        border(color: Colors.greenAccent),
      ),
      press(
        elevation(2),
        scale(0.9),
      ),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          Pressable(
            mix: mix,
            onPressed: () {},
            child: const TextMix(
              text: 'Simple Text',
            ),
          )
        ],
      ),
    );
  }
}
