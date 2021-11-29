import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class NeonPreview extends StatelessWidget {
  const NeonPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = Mix(
      padding(16),
      rounded(10),
      animated(),
      textColor(Colors.purpleAccent),
      border(
        color: Colors.purpleAccent,
        width: 1,
      ),
      shadow(
        color: Colors.purpleAccent,
        blurRadius: 5.0,
      ),
      hover(
        shadow(
          blurRadius: 15.0,
        ),
      ),
      large(
        bgColor(Colors.orange),
      ),
      small(
        bgColor(Colors.yellow),
      ),
      bgColor(Colors.white),
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
