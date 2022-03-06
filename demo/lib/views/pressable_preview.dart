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
      bgColor($primary),
      font(
        weight: FontWeight.bold,
        color: $onBackground,
      ),
      border(
        color: Colors.black,
        width: 3,
      ),
      dark(
        border(color: Colors.white),
        textColor(Colors.white),
      ),
      (hover & active)(
        textColor(Colors.white),
        borderColor(Colors.greenAccent),
      ),
      press(
        elevation(1),
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
              'Simple Text',
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
