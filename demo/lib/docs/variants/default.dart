import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class VariantsDefaultExample extends StatelessWidget {
  const VariantsDefaultExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Mix(
      bgColor($secondary),
      textColor($onSecondary),
      hover(
        bgColor($primary),
        textColor($onPrimary),
      ),
    );

    return Center(
      child: Pressable(
        onPressed: () {},
        mix: style,
        child: const TextMix('Button'),
      ),
    );
  }
}
