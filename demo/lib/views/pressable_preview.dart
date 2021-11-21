import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class PressablePreview extends StatelessWidget {
  const PressablePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = Mix(
      rounded(35),
      padding(20),
      animated(),
      scale(1),
      elevation(8),
      bgColor(Colors.white),
      font(
        weight: FontWeight.bold,
        color: Colors.black,
      ),
      border(
        color: Colors.black,
        width: 3,
      ),
      dark(
        border(color: Colors.white),
        bgColor(Colors.black),
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
