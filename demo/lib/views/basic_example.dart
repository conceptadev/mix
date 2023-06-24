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
      animation(),
      elevation(2),
      backgroundColor(Colors.purple),
      alignment(Alignment.center),
      textStyle(color: Colors.white),
      onPress(
        backgroundColor(Colors.black),
      ),
      onHover(
        opacity(0.5),
      ),
      onLongPress(
        backgroundColor(Colors.green),
      ),
    );

    return Pressable(
      onPressed: () {
        return;
      },
      child: StyledContainer(
        style: mix,
        child: const StyledText('Gradient Box'),
      ),
    );
  }
}
