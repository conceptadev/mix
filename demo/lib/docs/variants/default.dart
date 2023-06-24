import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class VariantsDefaultExample extends StatelessWidget {
  const VariantsDefaultExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = StyleMix(
      backgroundColor($M3Color.secondary),
      textStyle(color: $M3Color.onSecondary),
      onHover(
        backgroundColor($M3Color.primary),
        textStyle(color: $M3Color.onPrimary),
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
