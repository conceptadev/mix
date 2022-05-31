import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class VariantsAndOperator extends StatelessWidget {
  const VariantsAndOperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = Mix(
      padding(20.0),
      textColor(Colors.amber),
      (hover & enabled)(
        // When it's hovering AND enabled
        textColor(Colors.black),
        bold(),
      ),
    );
    return Center(
      child: Pressable(
        onPressed: () {},
        child: Box(
          mix: mix,
          child: const TextMix('HOVER THIS TO CHANGE THE TEXT COLOR'),
        ),
      ),
    );
  }
}
