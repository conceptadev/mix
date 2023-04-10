import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mix/mix.dart';

class BasicExample extends HookWidget {
  const BasicExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = StyleMix(
      height(100),
      width(100),
      rounded(10),
      animated(),
      elevation(2),
      bgColor(Colors.purple),
      align(Alignment.center),
      textColor(Colors.white),
      onPress(
        bgColor(Colors.black),
      ),
      onHover(
        opacity(0.5),
      ),
      onLongPress(
        bgColor(Colors.green),
      ),
    );

    return Pressable(
      onPressed: () => print('tapped'),
      child: StyledContainer(
        mix: mix,
        child: const StyledText('Gradient Box'),
      ),
    );
  }
}
