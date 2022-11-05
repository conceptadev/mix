import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class VariantsDefaultExample extends StatelessWidget {
  const VariantsDefaultExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Mix(
      bgColor(MaterialTokens.colorScheme.secondary),
      textColor(MaterialTokens.colorScheme.onSecondary),
      onHover(
        bgColor(MaterialTokens.colorScheme.primary),
        textColor(MaterialTokens.colorScheme.onPrimary),
      ),
    );

    return Center(
      child: Pressable(
        onPressed: () {},
        child: Box(
          mix: style,
          child: const TextMix('Button'),
        ),
      ),
    );
  }
}
