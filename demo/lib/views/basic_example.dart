import '../theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mix/mix.dart';

class BasicExample extends HookWidget {
  const BasicExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mix = Mix(
      height(100),
      width(100),
      rounded(10),
      elevation(2),
      // bgColor(Colors.purple),
      bgColor(theme<MyColors, Color>((myColors) => myColors.brandColor)),
      align(Alignment.center),
      textColor(Colors.white),
    );

    return Box(
      mix: mix,
      child: const TextMix('Gradient Box'),
    );
  }
}
