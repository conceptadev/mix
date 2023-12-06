import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class VariantsDefaultExample extends StatelessWidget {
  const VariantsDefaultExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = StyleMix(
      backgroundColor($colors.secondary()),
      text.style.color.of($colors.onSecondary),
      onHover(
        backgroundColor.of($colors.primary),
        text.style(color: $colors.onPrimary()),
      ),
    );

    return Center(
      child: Pressable(
        onPressed: () {
          return;
        },
        child: StyledContainer(
          style: style,
          child: const StyledText('Button'),
        ),
      ),
    );
  }
}
